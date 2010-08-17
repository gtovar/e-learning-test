/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/jax.js
 *
 *  Implements the HTML-CSS OutputJax that displays mathematics
 *  using HTML and CSS to position the characters from math fonts
 *  in their proper locations.
 *  
 *  ---------------------------------------------------------------------
 *  
 *  Copyright (c) 2009 Design Science, Inc.
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

(function (MML,AJAX,HTMLCSS) {
  
  var FONTTEST = MathJax.Object.Subclass({
    FontInfo: {
      STIX: {family: "STIXSizeOneSym", testString: "() {} []"},
      TeX:  {family: "MathJax_Size1",  testString: "() {} []"}
    },
    comparisonFont: ["sans-serif","monospace","script","Times","Courier","Arial","Helvetica"],
    
    Init: function () {
      var div = this.div = document.body.appendChild(document.createElement("div"));
      div.style.position = "absolute"; div.style.visibility = "hidden";
      div.style.top = div.style.left = 0;
      div.style.fontWeight = "normal";
      div.style.fontStyle = "normal";
      div.style.fontSize = "40px";
      this.text = this.div.appendChild(document.createTextNode(""));
    },
    
    findFont: function (fonts,pref) {
      if (pref && this.testCollection(pref)) {return pref}
      for (var i = 0, m = fonts.length; i < m; i++) {
        if (fonts[i] === pref) continue;
        if (this.testCollection(fonts[i])) {return fonts[i]}
      }
      return null;
    },
    
    testCollection: function (name) {return this.testFont(this.FontInfo[name])},
    
    testFont: function (font) {
      if (font.isWebFont && HTMLCSS.FontFaceBug) {
        this.div.style.fontWeight = this.div.style.fontStyle = "normal";
      } else {
        this.div.style.fontWeight = (font.weight||"normal");
        this.div.style.fontStyle  = (font.style||"normal");
      }
      var W = this.getComparisonWidths(font.testString);
      if (W) {
        this.div.style.fontFamily = "'"+font.family+"',"+this.comparisonFont[0];
        if (this.div.offsetWidth == W[0]) {
          this.div.style.fontFamily = "'"+font.family+"',"+this.comparisonFont[W[2]];
          if (this.div.offsetWidth == W[1]) {return false}
        }
        if (this.div.offsetWidth != W[3]) {
          if (!HTMLCSS.FONTDATA || !HTMLCSS.FONTDATA.hasStyleChar) {return true}
          return this.testStyleChar(font.weight,font.style);
        }
      }
      return false;  
    },
    
    styleChar: String.fromCharCode(0xEFFD), // width encodes style
    compChar:  String.fromCharCode(0xEFFF), // "standard" width to compare to

    testStyleChar: function (weight,style) {
      var n = 3 + (weight ? 2 : 0) + (style ? 4 : 0);
      var extra = "", dw = 0;
      if (HTMLCSS.msieItalicWidthBug && style === "italic") {
        this.text.nodeValue = extra = this.compChar;
        dw = this.div.offsetWidth;
      }
      if (HTMLCSS.safariTextNodeBug) {this.div.innerHTML = this.compChar+extra}
        else {this.text.nodeValue = this.compChar+extra}
      var W = this.div.offsetWidth-dw;
      if (HTMLCSS.safariTextNodeBug) {this.div.innerHTML = this.styleChar+extra}
        else {this.text.nodeValue = this.styleChar+extra}
      W = Math.floor((this.div.offsetWidth-dw)/W+.5);
      return (W == n);
    },
    
    getComparisonWidths: function (string) {
      if (HTMLCSS.FONTDATA && HTMLCSS.FONTDATA.hasStyleChar)
        {string += this.styleChar + " " + this.compChar}
      if (HTMLCSS.safariTextNodeBug) {this.div.innerHTML = string}
        else {this.text.nodeValue = string}
      this.div.style.fontFamily = this.comparisonFont[0]+",xyzzy";
      var W = this.div.offsetWidth, sW = -1;
      if (HTMLCSS.safariWebFontSerif) {
        this.div.style.fontFamily = HTMLCSS.safariWebFontSerif[0];
        sW = this.div.offsetWidth;
      }
      for (var i = 1, m = this.comparisonFont.length; i < m; i++) {
        this.div.style.fontFamily = this.comparisonFont[i]+",xyzzy";
        if (this.div.offsetWidth != W) {return [W,this.div.offsetWidth,i,sW]}
      }
      return null;
    },
    
    loadWebFont: function (font) {
      var n = MathJax.Message.File("Web-Font "+HTMLCSS.fontInUse+"/"+font.directory);
      var callback = MathJax.CallBack(["Clear",MathJax.Message,n]);
      AJAX.timer.start(AJAX,[this.checkWebFont,font,callback],1);
      return callback;
    },
    
    checkWebFont: function (check,font,callback) {
      if (check.time(callback)) return;
      if (HTMLCSS.Font.testFont(font)) {callback(check.STATUS.OK)}
        else {setTimeout(check,check.delay)}
    },
    
    fontFace: function (name) {
      var type = HTMLCSS.allowWebFonts;
      var dir = AJAX.fileURL(HTMLCSS.webfontDir+"/"+type);
      var fullname = name.replace(/-b/,"-B").replace(/-i/,"-I").replace(/-Bold-/,"-Bold");
      if (!fullname.match(/-/)) {fullname += "-Regular"}
      if (type === "svg") {fullname += ".svg#"+fullname} else {fullname += "."+type}
      var def = {
        "font-family": HTMLCSS.FONTDATA.FONTS[name].family,
        src: "url('"+dir+"/"+fullname+"')"
      };
      if (type === "svg") def.src += " format('svg')";
      if (!(HTMLCSS.FontFaceBug && HTMLCSS.FONTDATA.FONTS[name].isWebFont)) {
        if (name.match(/-bold/)) {def["font-weight"] = "bold"}
        if (name.match(/-italic/)) {def["font-style"] = "italic"}
      }
      return def;
    }
  });

  HTMLCSS.Augment({
  
    config: {
      styles: {
        ".MathJax": {
          "font-family": "serif",
          "font-style":  "normal",
          "font-weight": "normal",
          "line-height": "normal",
          "font-size":   "100%"
        },

        ".MathJax_Display": {
          position:    "relative"
        },
        
        ".MathJax SPAN, .MathJax IMG, .MathJax NOBR": {
          border:  0,
          padding: 0,
          margin:  0,
          "vertical-align": 0,
          "line-height": "normal"
        }
      }
    },
    
    Font: FONTTEST(),
    
    Config: function () {
      MathJax.OutputJax.prototype.Config.call(this);
      var font = this.Font.findFont(this.config.availableFonts,this.config.preferredFont);
      if (!font && this.allowWebFonts) {font = this.config.webFont}
      if (!font && this.config.imageFont) {font = this.config.imageFont; this.imgFonts = true}
      if (font) {
        this.fontInUse = font; this.fontDir += "/" + font; this.webfontDir += "/" + font;
        if (!this.require) {this.require = []}
        this.require.push(this.fontDir+"/fontdata.js");
        if (this.imgFonts) {this.require.push(this.directory+"/imageFonts.js")}
      } else {
        MathJax.Message.Clear(
          MathJax.Message.Set("Can't find a valid font using ["+this.config.availableFonts.join(", ")+"]"),
          2000
        );
        this.FONTDATA = {
          TeX_factor: 1, baselineskip: 1.2, lineH: .8, lineD: .2, ffLineH: .8,
          FONTS: {}, VARIANT: {normal: {fonts:[]}}, RANGES: [],
          DEFAULTFAMILY: "serif", DEFAULTWEIGHT: "normal", DEFAULTSTYLE: "normal",
          DELIMITERS: {}, RULECHAR: 0x2D
        };
        MathJax.InputJax.TeX.Definitions.macros.overline[1]  = "002D";
        MathJax.InputJax.TeX.Definitions.macros.underline[1] = "002D";
      }
    },
    
    Startup: function () {
      var MJ = this.config.styles[".MathJax"];
      var family = [], fonts = this.FONTDATA.VARIANT.normal.fonts;
      if (!(fonts instanceof Array)) {fonts = [fonts]}
      for (var i = 0, m = fonts.length; i < m; i++) {
        family[i] = this.FONTDATA.FONTS[fonts[i]].family;
        if (!family[i]) {family[i] = fonts[i]}
      }
      MJ["font-family"] = family.join(',');
      this.hiddenDiv = this.Element("div",{
        style:{visibility:"hidden", overflow:"hidden", height:"1px",
               position:"absolute", top:0}
      });
      if (!document.body.firstChild) {document.body.appendChild(this.hiddenDiv)}
        else {document.body.insertBefore(this.hiddenDiv,document.body.firstChild)}
      this.hiddenDiv = this.addElement(this.hiddenDiv,"div",{id:"MathJax_Hidden"});
      return MathJax.Ajax.Styles(this.config.styles,["PreloadWebFonts",this]);
    },
    
    PreloadWebFonts: function () {
      if (!HTMLCSS.allowWebFonts || !HTMLCSS.config.preloadWebFonts) return;
      for (var i = 0, m = HTMLCSS.config.preloadWebFonts.length; i < m; i++) {
        var FONT = HTMLCSS.FONTDATA.FONTS[HTMLCSS.config.preloadWebFonts[i]];
        if (!FONT.available) {HTMLCSS.Font.testFont(FONT)}
      }
    },
    
    Translate: function (script) {
      var math = script.MathJax.elementJax.root;
      var span = this.Element("span",{className:"MathJax"}), div = span;
      if (math.displaystyle) {
        div = this.Element("div",{className:"MathJax_Display", style:{width:"100%", position:"relative"}});
        div.appendChild(span);
      }
      script.parentNode.insertBefore(div,script);
      this.getLineHDM(div,span); var isHidden = (this.em === 0 || String(this.em) === "NaN");
      if (isHidden) {this.hiddenDiv.appendChild(div); this.getLineHDM(div,span)}
      this.initImg(span);
      this.initHTML(math,span);
      math.setTeXclass();
      try {math.toHTML(span)} catch (err) {
        if (err.restart) {div.parentNode.removeChild(div)}
        throw err;
      }
      if (isHidden) {script.parentNode.insertBefore(div,script)}
    },
    
    initImg: function (span) {},
    initHTML: function (math,span) {},
    initFont: function (name) {
      if (!this.allowWebFonts) {return null}
      var FONTS = HTMLCSS.FONTDATA.FONTS, AVAIL = HTMLCSS.config.availableFonts;
      if (AVAIL && AVAIL.length && HTMLCSS.Font.testFont(FONTS[name]))
        {FONTS[name].available = true; return null}
      FONTS[name].isWebFont = true;
      if (HTMLCSS.FontFaceBug) {FONTS[name].family = name}
      return AJAX.Styles({"@font-face":this.Font.fontFace(name)});
    },
    
    Remove: function (jax) {
      var span = jax.SourceElement(); if (!span) return;
      span = span.previousSibling; if (!span) return;
      if (span.className.match(/^MathJax/)) {span.parentNode.removeChild(span)}
    },
    
    getLineHDM: function (span,mj) {
      var img, test = this.Element("span",{style: {position:"absolute"}});
      span.parentNode.insertBefore(test,span);
      var text = this.addText(test,"( |"+String.fromCharCode(0xE000));
      this.H = test.offsetHeight;
      if (this.msieInlineBlockAlignBug) {
        img = this.addElement(test,"img",{style:{height:this.H+"px",width:"1px"}});
        try {img.src = "about:blank"} catch(err) {}
      } else {
        img = HTMLCSS.createStrut(test,this.H);
      }
      this.D = test.offsetHeight - this.H; this.H -= this.D;
      test.removeChild(text);
      img.style.height = "1px"; img.style.width = "100ex";
      var ex = test.offsetWidth/100;
      test.className = "MathJax"; img.style.width = "100em";
      var em = test.offsetWidth/100;
      var scale = Math.floor((ex/this.TeX.x_height) / em * this.config.scale);
      //mj.style.fontSize = test.style.fontSize = scale+"%";
      this.em = MML.mbase.prototype.em = test.offsetWidth/100;
      this.H /= this.em; this.D /= this.em
      MML.mbase.prototype.H = this.H; MML.mbase.prototype.D = this.D;
      span.parentNode.removeChild(test);
    },
    getHD: function (span) {
      var position = span.style.position;
      span.style.position = "absolute";
      var strut; if (this.operaHeightBug) {strut = this.createStrut(span,0)}
      var HD = {h:span.offsetHeight}, img;
      if (this.msieInlineBlockAlignBug) {
        img = this.addElement(span,"img",{style:{height:HD.h+"px",width:"1px"}});
        try {img.src = "about:blank"} catch(err) {}
      } else {
        img = HTMLCSS.createStrut(span,HD.h);
      }
      HD.d = span.offsetHeight - HD.h; HD.h -= HD.d;
      HD.h /= this.em; HD.d /= this.em;
      if (strut) {span.removeChild(strut)}
      span.removeChild(img);
      span.style.position = position;
      return HD;
    },
    getW: function (span) {
      var W = span.offsetWidth, w = (span.bbox ? span.bbox.w: -1), start, end;
      if ((w < 0 || this.negativeSkipBug) && W >= 0) {
        // IE can't deal with a space at the beginning, so put something else first
        if (this.negativeSkipBug) {start = HTMLCSS.createStrut(span,1,true)}
        var end = this.addElement(span,"span");
        this.addText(end,"x");
        W = end.offsetLeft - (start||span).offsetLeft;
        span.removeChild(end);
        if (start) {span.removeChild(start)}
      }
      return W/this.em;
    },
    Measured: function (span,parent) {
      if (span.bbox.width == null) {
        var w = this.getW(span);
        span.bbox.rw += w - span.bbox.w;
        span.bbox.w = w;
      }
      if (!parent) {parent = span.parentNode}
      if (!parent.bbox) {parent.bbox = span.bbox}
      return span;
    },
    
    Em: function (m) {
      if (Math.abs(m) < .000001) {return "0em"}
      return String(m+.0005).replace(/(\.\d\d\d).+/,'$1') + "em";
    },
    Percent: function (m) {
      return String(m*100+.5).replace(/\..+/,'') + "%";
    },
    length2percent: function (length) {
      return this.Percent(this.length2em(length));
    },
    length2em: function (length) {
      if (typeof(length) !== "string") {length = length.toString()}
      if (length === "") {return ""}
      if (length === MML.SIZE.NORMAL) {return 1}
      if (length === MML.SIZE.BIG)    {return 2}
      if (length === MML.SIZE.SMALL)  {return .71}
      if (length === "infinity")      {return HTMLCSS.BIGDIMEN}
      var factor = this.FONTDATA.TeX_factor;
      if (length.match(/mathspace$/)) {return HTMLCSS.MATHSPACE[length]*factor}
      var match = length.match(/^\s*([-+]?(?:\.\d+|\d+(?:\.\d*)?))(pt|em|ex|mu|px|%)?/);
      var m = parseFloat(match[1]), unit = match[2];
      if (unit === "em") {return m * factor}
      if (unit === "ex") {return m * HTMLCSS.TeX.x_height * factor}
      if (unit === "%")  {return m / 100}
      if (unit === "px") {return m / HTMLCSS.em}
      if (unit === "pt") {return m / 10 * factor}
      if (unit === "mu") {return m / 18 * factor} // FIXME:  needs to include scale
      return m*factor;
    },
    length2Em: function (length) {
      return this.Em(this.length2em(length));
    },
    thickness2em: function (length) {
      var thick = HTMLCSS.TeX.rule_thickness;
      if (length === "medium") {return thick}
      if (length === "thin") {return .8*thick}
      if (length === "thick") {return 1.2*thick}
      return this.length2em(length);
    },
    
    createStrut: function (span,h,before) {
      var strut = this.Element("span",{
        style:{display:"inline-block", overflow:"hidden", height:h+"px",
               width:"1px", marginRight:"-1px"}
      });
      if (before) {span.insertBefore(strut,span.firstChild)} else {span.appendChild(strut)}
      return strut;
    },
    createBlank: function (span,w,before) {
      var blank = this.Element("span",{
        style: {display:"inline-block", overflow:"hidden", height:"1px", width:this.Em(w)}
      });
      if (before) {span.insertBefore(blank,span.firstChild)} else {span.appendChild(blank)}
      return blank;
    },
    createSpace: function (span,h,d,w,color) {
      var H = this.Em(Math.max(0,h+d)), D = this.Em(-d);
      if (this.msieInlineBlockAlignBug) {D = this.Em(HTMLCSS.getHD(span.parentNode).d-d)}
      if (span.isBox || span.className == "mspace") {
        span.bbox = {
          h: h*span.scale, d: d*span.scale,
          w: w*span.scale, rw: w*span.scale, lw: 0
        };
        span.style.height = H; span.style.verticalAlign = D;
      } else {
        span = this.addElement(span,"span",{style: {height:H, verticalAlign:D}});
      }
      if (w >= 0) {
        span.style.width = this.Em(w);
        span.style.display = "inline-block";
      } else {
        if (this.msieNegativeSpaceBug) {span.style.height = ""}
        span.style.marginLeft = this.Em(w);
        if (HTMLCSS.safariNegativeSpaceBug && span.parentNode.firstChild == span)
          {this.createBlank(span,0,true)}
      }
      if (color && color !== MML.COLOR.TRANSPARENT) {span.style.backgroundColor = color}
      return span;
    },
    createRule: function (span,h,d,w,color) {
      if (!color) {color = "solid"} else {color = "solid "+color}
      color = this.Em(w)+" "+color;
      // If rule is very thin, make it at least min_rule_thickness so it doesn't disappear
      if (h+d > 0 && (h+d)*this.em < HTMLCSS.TeX.min_rule_thickness)
        {var f = 1/(h+d)*(this.TeX.min_rule_thickness/this.em); h *= f; d *= f}
      var H = this.Em(h+d), D = this.Em(-d);
      if (span.isBox || span.className == "mspace") {span.bbox = {h:h, d:d, w:w, rw:w, lw: 0}}
      span = this.addElement(span,"span",{
        style: {borderLeft: color, display: "inline-block", overflow:"hidden",
                width:0, height:H, verticalAlign:D}
      });
      if (w > 0 && span.offsetWidth == 0) {span.style.width = this.Em(w)}
      return span;
    },
    
    createStack: function (span,nobbox,w) {
      if (this.msiePaddingWidthBug) {this.createStrut(span,0)}
      span = this.addElement(span,"span",{
        style: {display:"inline-block", position:"relative", width:(w == null ? 0: "100%"), height:0}
      });
      if (!nobbox) {
        span.parentNode.bbox = span.bbox = {
          h: -this.BIGDIMEN, d: -this.BIGDIMEN,
          w:0, lw: this.BIGDIMEN, rw: -this.BIGDIMEN
        };
        if (w != null) {span.bbox.width = span.parentNode.bbox.width = w}
      }
      return span;
    },
    createBox: function (span,w) {
      var box = this.addElement(span,"span",{style:{position:"absolute"}, isBox: true});
      if (w != null) {box.style.width = "100%"}
      return box;
    },
    addBox: function (span,box) {
      box.style.position = "absolute"; box.isBox = true;
      return span.appendChild(box);
    },
    placeBox: function (span,x,y,noclip) {
      var parent = span.parentNode, bbox = span.bbox, BBOX = parent.bbox;
      if (this.msiePlaceBoxBug) {this.addText(span,this.NBSP)}
      if (this.imageHeightBug) {this.addText(span,this.imgSpace)}
      var HD = this.getHD(span), dx = 0;
      if (bbox) {
        var dd = 2/this.em;
        var H = (bbox.H == null ? bbox.h : bbox.H), D = (bbox.D == null ? bbox.d : bbox.D);
        var t = HD.h - H - dd, b = HD.h + D + dd, l = bbox.lw - dd, r = 1000;
        if (this.negativeSkipBug) {
          if (bbox.lw < 0) {dx = bbox.lw; HTMLCSS.createBlank(span,-dx,true); l = 0}
          if (bbox.rw > bbox.w) {HTMLCSS.createBlank(span,bbox.rw-bbox.w+.1)}
        }
        if (!this.msieClipRectBug && !bbox.noclip && !noclip)
          {}//{span.style.clip = "rect("+this.Em(t)+" "+this.Em(r)+" "+this.Em(b)+" "+this.Em(l)+")"}      Возможно лучше раскомментировать!
      }
      span.style.left = this.Em(x+dx);
      span.style.top  = this.Em(-(y+HD.h));
      if (bbox && BBOX) {
        if (bbox.H != null && (BBOX.H == null || bbox.H + y > BBOX.H)) {BBOX.H = bbox.H + y}
        if (bbox.D != null && (BBOX.D == null || bbox.D - y > BBOX.D)) {BBOX.D = bbox.D - y}
        if (bbox.h + y > BBOX.h) {BBOX.h = bbox.h + y}
        if (bbox.d - y > BBOX.d) {BBOX.d = bbox.d - y}
        if (BBOX.H != null && BBOX.H <= BBOX.h) {delete BBOX.H}
        if (BBOX.D != null && BBOX.D <= BBOX.d) {delete BBOX.D}
        if (bbox.w + x > BBOX.w) {
          BBOX.w = bbox.w + x;
          if (BBOX.width == null) {parent.style.width = this.Em(BBOX.w)}
        }
        if (bbox.rw + x > BBOX.rw) {BBOX.rw = bbox.rw + x}
        if (bbox.lw + x < BBOX.lw) {BBOX.lw = bbox.lw + x}
        if (bbox.width != null) {parent.style.width = "100%"; BBOX.width = bbox.width}
      }
    },
    alignBox: function (span,align,y) {
      this.placeBox(span,0,y); // set y position (and left aligned)
      var r = 0, c = -span.bbox.w/2;
      if (this.negativeSkipBug) {r = span.bbox.w-span.bbox.rw-.1; c += span.bbox.lw}
      // FIXME: handle width that is not a percent
      c = (span.bbox.width ? "-"+Math.floor(parseInt(span.bbox.width)/2)+"%" : this.Em(c));
      MathJax.Hub.Insert(span.style,({
        right:  {left:"", right: this.Em(r)},
        center: {left:"50%", marginLeft: c}
      })[align]);
    },
    setStackWidth: function (span,w) {
      if (typeof(w) === "number") {
        span.style.width = this.Em(Math.max(0,w));
        if (span.bbox) {span.bbox.w = w};
        if (span.parentNode.bbox) {span.parentNode.bbox.w = w}
      } else {
        span.style.width = span.parentNode.style.width = "100%";
        if (span.bbox) {span.bbox.width = w}
        if (span.parentNode.bbox) {span.parentNode.bbox.width = w}
      }
    },
    
    createDelimiter: function (span,code,HW,scale,font) {
      if (!code) {
        span.bbox = {h:0, d:0, w:this.TeX.nulldelimiterspace, lw: 0};
        span.bbox.rw = span.bbox.w;
        this.createSpace(span,span.bbox.h,span.bbox.d,span.bbox.w);
        return;
      }
      if (!scale) {scale = 1};
      if (!(HW instanceof Array)) {HW = [HW,HW]}
      var hw = HW[1]; HW = HW[0];
      var delim = this.FONTDATA.DELIMITERS[code];
      if (!delim) {delim = [[0,this.FONTDATA.VARIANT[MML.VARIANT.NORMAL]]]}
      for (var i = 0, m = delim.length; i < m; i++) {
        if (delim[i] instanceof Array) {
          if (delim[i][0]*scale >= HW || i === delim.length-1 || delim[i+1].stop) {
	    if (delim[i][2]) {scale *= delim[i][2]}
            if (delim[i][3]) {code = delim[i][3]}
	    var chr = this.addElement(span,"span");
	    this.createChar(chr,[code,delim[i][1]],scale,font);
            if (this.msieVerticalAlignBug || this.safariVerticalAlignBug || this.konquerorVerticalAlignBug) {
              chr.style.position = "relative";
              chr.style.top = this.Em(chr.bbox.h);
            } else {
              chr.style.verticalAlign = this.Em(-chr.bbox.h);
              if (this.ffVerticalAlignBug) {HTMLCSS.createStrut(chr,chr.bbox.h)}
            }
	    span.bbox = {
	      w: chr.bbox.w, lw: chr.bbox.lw, rw: chr.bbox.rw,
	      h: 0, d: (chr.bbox.h + chr.bbox.d)
	    };
            span.offset = .65 * span.bbox.w;
            span.scale = scale;
	    break;
          }
        } else {
          this["extendDelimiter"+delim[i].direction](span,hw,delim[i],scale,font);
        }
      }
    },
    extendDelimiterVertical: function (span,H,delim,scale,font) {
      var stack = this.createStack(span,true);
      var top = this.createBox(stack), bot = this.createBox(stack);
      this.createChar(top,(delim.top||delim.ext),scale,font);
      this.createChar(bot,(delim.bot||delim.ext),scale,font);
      var ext = {bbox:{w:0,lw:0,rw:0}}, mid = ext;
      var h = top.bbox.h + top.bbox.d + bot.bbox.h + bot.bbox.d;
      var y = -top.bbox.h; this.placeBox(top,0,y,true); y -= top.bbox.d;
      if (delim.mid) {
        mid = this.createBox(stack); this.createChar(mid,delim.mid,scale,font);
        h += mid.bbox.h + mid.bbox.d;
      }
      if (H > h) {
        ext = this.Element("span"); this.createChar(ext,delim.ext,scale,font);
        var eH = ext.bbox.h + ext.bbox.d, eh = eH - .05, n, N, k = (delim.mid ? 2 : 1);
        N = n = Math.ceil((H-h)/(k*eh));
        if (!delim.fullExtenders) {eh = (H-h)/(k*n)}
        var dy = (n/(n+1))*(eH - eh); eh = eH - dy; y += dy + eh - ext.bbox.h;
        while (k-- > 0) {
          while (n-- > 0) {y -= eh; this.placeBox(this.addBox(stack,ext.cloneNode(true)),0,y,true)}
          y += dy - ext.bbox.d;
          if (delim.mid && k) {
            this.placeBox(mid,0,y-mid.bbox.h,true); n = N;
            y += -(mid.bbox.h + mid.bbox.d) + dy + eh - ext.bbox.h;
          }
        }
      } else {
        y += (h - H)/2;
        if (delim.mid) {this.placeBox(mid,0,y-mid.bbox.h,true); y += -(mid.bbox.h + mid.bbox.d)}
        y += (h - H)/2;
      }
      this.placeBox(bot,0,y-bot.bbox.h,true); y -= bot.bbox.h + bot.bbox.d;
      span.bbox = {
        w:  Math.max(top.bbox.w,ext.bbox.w,bot.bbox.w,mid.bbox.w),
        lw: Math.min(top.bbox.lw,ext.bbox.lw,bot.bbox.lw,mid.bbox.lw),
        rw: Math.max(top.bbox.rw,ext.bbox.rw,bot.bbox.rw,mid.bbox.rw),
        h: 0, d: -y
      }
      span.scale = scale;
      span.offset = .55 * span.bbox.w;
      span.isMultiChar = true;
      this.setStackWidth(stack,span.bbox.w);
    },
    extendDelimiterHorizontal: function (span,W,delim,scale,font) {
      var stack = this.createStack(span,true);
      var left = this.createBox(stack), right = this.createBox(stack);
      this.createChar(left,(delim.left||delim.rep),scale,font);
      this.createChar(right,(delim.right||delim.rep),scale,font);
      var rep = this.Element("span"); this.createChar(rep,delim.rep,scale,font);
      var mid = {bbox: {h:-this.BIGDIMEN, d:-this.BIGDIMEN}};
      this.placeBox(left,-left.bbox.lw,0,true);
      var w = (left.bbox.rw - left.bbox.lw) + (right.bbox.rw - right.bbox.lw) - .05,
          x = left.bbox.rw - left.bbox.lw - .025;
      if (delim.mid) {
        mid = this.createBox(stack); this.createChar(mid,delim.mid,scale,font);
        w += mid.bbox.w;
      }
      if (W > w) {
        var rW = rep.bbox.rw-rep.bbox.lw, rw = rW - .05, n, N, k = (delim.mid ? 2 : 1);
        N = n = Math.ceil((W-w)/(k*rw)); rw = (W-w)/(k*n);
        var dx = (n/(n+1))*(rW - rw); rw = rW - dx; x -= rep.bbox.lw + dx;
        while (k-- > 0) {
          while (n-- > 0) {this.placeBox(this.addBox(stack,rep.cloneNode(true)),x,0,true); x += rw}
          if (delim.mid && k) {this.placeBox(mid,x,0,true); x += mid.bbox.w - dx; n = N}
        }
      } else {
        x -= (w - W)/2;
        if (delim.mid) {this.placeBox(mid,x,0,true); x += mid.bbox.w}
        x -= (w - W)/2;
      }
      this.placeBox(right,x,0,true);
      span.bbox = {
        w: x+right.bbox.rw, lw: 0, rw: x+right.bbox.rw,
        H: Math.max(left.bbox.h,rep.bbox.h,right.bbox.h,mid.bbox.h),
        D: Math.max(left.bbox.d,rep.bbox.d,right.bbox.d,mid.bbox.d),
        h: rep.bbox.h, d: rep.bbox.d
      }
      span.scale = scale;
      span.isMultiChar = true;
      this.setStackWidth(stack,span.bbox.w);
    },
    createChar: function (span,data,scale,font) {
      var SPAN = span, text = "", variant = {fonts: [data[1]]};
      if (font && font === MML.VARIANT.BOLD) {variant.fonts = [data[1]+"-bold",data[1]]}
      if (typeof(data[1]) !== "string") {variant = data[1]}
      span.scale = scale;
      if (data[0] instanceof Array) {
        for (var i = 0, m = data[0].length; i < m; i++) {text += String.fromCharCode(data[0][i])}
      } else {text = String.fromCharCode(data[0])}
      if (scale !== 1) {
        SPAN = this.addElement(span,"span",{style:{fontSize: this.Percent(scale)}, scale:scale});
        this.handleVariant(SPAN,variant,text);
        span.bbox = SPAN.bbox;
      } else {this.handleVariant(span,variant,text)}
      if (data[2]) {span.style.marginLeft = this.Em(data[2])}
    },
    positionDelimiter: function (span,h) {
      if (this.safariVerticalAlignBug || this.msieVerticalAlignBug || this.konquerorVerticalAlignBug ||
         (this.operaVerticalAlignBug && span.isMultiChar)) {
        if (span.firstChild.style.display === "")
          {span = span.firstChild; h -= parseFloat(span.style.top)}
        span.style.position = "relative";
        span.style.top = this.Em(-h);
      } else {
        span.style.verticalAlign = this.Em(h);
        if (HTMLCSS.ffVerticalAlignBug) {HTMLCSS.createRule(span.parentNode,span.bbox.h,0,0)}
      }
    },
    
    handleVariant: function (span,variant,text) {
      var newtext = "", n, c, C, font, noVariant = 1, VARIANT;
      if (text.length === 0) {
        span.bbox = {w:0, h:0, d:0, lw: 0, rw: 0};
        return;
      }
      span.bbox = {
        w: 0, h: -this.BIGDIMEN, d: -this.BIGDIMEN, rw: -this.BIGDIMEN, lw: this.BIGDIMEN
      };
      if (!variant) {variant = this.FONTDATA.VARIANT[MML.VARIANT.NORMAL]}
      VARIANT = variant;
      for (var i = 0, m = text.length; i < m; i++) {
        variant = VARIANT;
        n = text.charCodeAt(i); c = text.charAt(i);
        if (c == this.PLANE1) {
          i++; n = text.charCodeAt(i) + 0x1D400 - 0xDC00;
        } else {
          var id, M, RANGES = this.FONTDATA.RANGES;
          for (id = 0, M = RANGES.length; id < M; id++) {
            if (RANGES[id].name === "alpha" && variant.noLowerCase) continue;
            var N = variant["offset"+RANGES[id].offset];
            if (N && n >= RANGES[id].low && n <= RANGES[id].high) {
              if (RANGES[id].remap && RANGES[id].remap[n]) {
                n = N + RANGES[id].remap[n];
              } else {
                n = n - RANGES[id].low + N;
                if (RANGES[id].add) {n += RANGES[id].add}
              }
              if (variant["variant"+RANGES[id].offset])
                {variant = this.FONTDATA.VARIANT[variant["variant"+RANGES[id].offset]]}
              break;
            }
          }
        }
        if (variant.remap && variant.remap[n]) {
          if (variant.remap[n] instanceof Array) {
            var remap = variant.remap[n];
            n = remap[0]; variant = this.FONTDATA.VARIANT[remap[1]];
          } else {
            n = variant.remap[n];
            if (variant.remap.variant) {variant = this.FONTDATA.VARIANT[variant.remap.variant]}
          }
        }
        font = this.lookupChar(variant,n); c = font[n];
        if (noVariant && !c[5].img) {this.handleFont(span,font); noVariant = 1}
        newtext = this.handleChar(span,font,c,n,newtext);
        if (c[0] > span.bbox.h) {span.bbox.h = c[0]}
        if (c[1] > span.bbox.d) {span.bbox.d = c[1]}
        if (span.bbox.w + c[3] < span.bbox.lw) {span.bbox.lw = span.bbox.w + c[3]}
        if (span.bbox.w + c[4] > span.bbox.rw) {span.bbox.rw = span.bbox.w + c[4]}
        span.bbox.w += c[2];
      }
      if (newtext.length) {this.addText(span,newtext)}
      span.bbox.h /= 1000; span.bbox.d /= 1000;
      span.bbox.w /= 1000; span.bbox.lw /= 1000; span.bbox.rw /= 1000;
      if (span.scale && span.scale !== 1) {
        span.bbox.h *= span.scale; span.bbox.d *= span.scale;
        span.bbox.w *= span.scale; span.bbox.lw *= span.scale; span.bbox.rw *= span.scale;
      }
      if (text.length == 1 && font.skew && font.skew[n]) {span.bbox.skew = font.skew[n]}
    },
    
    handleFont: function (span,font) {
      span.style.fontFamily = font.family;
      if (!(HTMLCSS.FontFaceBug && font.isWebFont)) {
        var style  = font.style  || this.FONTDATA.DEFAULTSTYLE,
            weight = font.weight || this.FONTDATA.DEFAULTWEIGHT;
        if (style !== "normal")  {span.style.fontStyle  = style}
        if (weight !== "normal") {span.style.fontWeight = weight}
      }
    },
    
    handleChar: function (span,font,c,n,text) {
      var C = c[5];
      if (C.img) {return this.handleImg(span,font,c,n,text)}
      if (C.c == null) {
        if (n <= 0xFFFF) {C.c = String.fromCharCode(n)}
                    else {C.c = this.PLANE1 + String.fromCharCode(n-0x1D400+0xDC00)}
      }
      return text + C.c;
    },
    handleImg: function (span,font,c,n,text) {return text}, // replaced by imageFont extension
    
    lookupChar: function (variant,n) {
      var i, m;
      if (!variant.FONTS) {
        var FONTS = this.FONTDATA.FONTS;
        var fonts = (variant.fonts || this.FONTDATA.VARIANT.normal.fonts);
        if (!(fonts instanceof Array)) {fonts = [fonts]}
        if (variant.fonts != fonts) {variant.fonts = fonts}
        variant.FONTS = [];
        for (i = 0, m = fonts.length; i < m; i++) {
          if (FONTS[fonts[i]]) {
            variant.FONTS.push(FONTS[fonts[i]]);
            FONTS[fonts[i]].name = fonts[i]; // FIXME: should really be in the font files
          }
        }
      }
      for (i = 0, m = variant.FONTS.length; i < m; i++) {
        var font = variant.FONTS[i];
        if (typeof(font) === "string") {
          delete variant.FONTS; this.loadFont(font);
        }
        if (font[n]) {
          if (font[n].length === 5) {font[n][5] = {}}
          if (HTMLCSS.allowWebFonts && !font.available)
            {this.loadWebFont(font)} else {return font}
        } else {this.findBlock(font,n)}
      }
      var unknown = {family:HTMLCSS.FONTDATA.DEFAULTFAMILY+",serif"};
      unknown[n] = [800,200,500,0,500,{isUnknown:true}]; // [h,d,w,lw,rw,{data}]
      return unknown;
    },
    
    findBlock: function (font,c) {
      if (font.Ranges) {
        // FIXME:  do binary search?
        for (var i = 0, m = font.Ranges.length; i < m; i++) {
          if (c <  font.Ranges[i][0]) return;
          if (c <= font.Ranges[i][1]) {
            var file = font.Ranges[i][2];
            for (var j = font.Ranges.length-1; j >= 0; j--)
              {if (font.Ranges[j][2] == file) {font.Ranges.splice(j,1)}}
            this.loadFont(font.directory+"/"+file+".js");
          }
        }
      }
    },
    
    loadFont: function (file) {
      var queue = MathJax.CallBack.Queue();
      queue.Push(["Require",MathJax.Ajax,this.fontDir+"/"+file]);
      if (this.imgFonts) {queue.Push(["Require",MathJax.Ajax,this.webfontDir+"/png/"+file])}
      MathJax.Hub.RestartAfter(queue.Push({}));
    },
    
    loadWebFont: function (font) {
      font.available = font.isWebFont = true;
      if (HTMLCSS.FontFaceBug) {font.family = font.name}
      var callback = this.Font.loadWebFont(font);
      MathJax.Hub.RestartAfter(callback);
    },

    Element: function (type,def) {
      var obj = document.createElement(type);
      for (var i = 1, m = arguments.length; i < m; i++) {
        if (arguments[i]) {MathJax.Hub.Insert(obj,arguments[i]);}
      }
      return obj;
    },
    addElement: function (span,type,def) {return span.appendChild(this.Element(type,def))},
    TextNode: function (text) {return document.createTextNode(text)},
    addText: function (span,text) {return span.appendChild(this.TextNode(text))},
    
    BIGDIMEN: 10000000,
    ID: 0,
    GetID: function () {this.ID++; return this.ID},
    
    MATHSPACE: {
      veryverythinmathspace:  1/18, 
      verythinmathspace:      2/18,
      thinmathspace:          3/18,
      mediummathspace:        4/18,
      thickmathspace:         5/18,
      verythickmathspace:     6/18,
      veryverythickmathspace: 7/18,
      negativeveryverythinmathspace:  -1/18, 
      negativeverythinmathspace:      -2/18,
      negativethinmathspace:          -3/18,
      negativemediummathspace:        -4/18,
      negativethickmathspace:         -5/18,
      negativeverythickmathspace:     -6/18,
      negativeveryverythickmathspace: -7/18
    },
    
    TeX: {
      x_height:         .430554,
      quad:             1,
      num1:             .676508,
      num2:             .393732,
      num3:             .44373,
      denom1:           .685951,
      denom2:           .344841,
      sup1:             .412892,
      sup2:             .362892,
      sup3:             .288888,
      sub1:             .15,
      sub2:             .247217,
      sup_drop:         .386108,
      sub_drop:         .05,
      delim1:          2.39,
      delim2:          1.0,
      axis_height:      .25,
      rule_thickness:   .06,
      big_op_spacing1:  .111111,
      big_op_spacing2:  .166666,
      big_op_spacing3:  .2,
      big_op_spacing4:  .6,
      big_op_spacing5:  .1,
      
      integer:          6553.6,     // conversion of em's to TeX internal integer
      scriptspace:         .1,
      nulldelimiterspace:  .12,
      delimiterfactor:     901,
      delimitershortfall:   .3,
      
      min_rule_thickness:  1.25     // in pixels
    },
    
    PLANE1: String.fromCharCode(0xD835),
    NBSP: String.fromCharCode(0xA0),
    
    hfuzz: 0,        // adjustment to clipping rectangle dd in height
    dfuzz: 0,        // adjustment to clipping rectangle dd in depths
    rfuzz: 0         // adjustment to rule placements in roots
  });
  
  MML.mbase.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      for (var i = 0, m = this.data.length; i < m; i++)
        {if (this.data[i]) {this.data[i].toHTML(span)}}
      var stretchy = this.HTMLcomputeBBox(span);
      for (i = 0, m = stretchy.length; i < m; i++) {stretchy[i].HTMLstretchV(span)}
      if (stretchy.length) {this.HTMLcomputeBBox(span)}
      this.HTMLhandleColor(span);
      return span;
    },
    HTMLcomputeBBox: function (span) {
      var i, m, child, bbox, BBOX, hasDimens = 0, width, stretchy = [];
      BBOX = span.bbox = {
        h: -HTMLCSS.BIGDIMEN, d: -HTMLCSS.BIGDIMEN,
        H: -HTMLCSS.BIGDIMEN, D: -HTMLCSS.BIGDIMEN,
        w: 0, rw: -HTMLCSS.BIGDIMEN, lw: HTMLCSS.BIGDIMEN
      };
      for (i = 0, m = this.data.length; i < m; i++) {
        if (!this.data[i]) continue;
        if (this.data[i].HTMLcanStretch("Vertical")) {stretchy.push(this.data[i])}
        child = this.data[i].HTMLspanElement(); if (!child || !child.bbox) continue;
        bbox = child.bbox; hasDimens = 1; width = bbox.width;
        if (bbox.d > BBOX.d) {BBOX.d = bbox.d}
        if (bbox.h > BBOX.h) {BBOX.h = bbox.h}
        if (bbox.D != null && bbox.D > BBOX.D) {BBOX.D = bbox.D}
        if (bbox.H != null && bbox.H > BBOX.H) {BBOX.H = bbox.H}
        if (child.style.paddingLeft) {BBOX.w += parseFloat(child.style.paddingLeft)}
        if (BBOX.w + bbox.lw < BBOX.lw) {BBOX.lw = BBOX.w + bbox.lw}
        if (BBOX.w + bbox.rw > BBOX.rw) {BBOX.rw = BBOX.w + bbox.rw}
        BBOX.w += bbox.w;
        if (child.style.paddingRight) {BBOX.w += parseFloat(child.style.paddingRight)}
      }
      if (BBOX.D <= BBOX.d) {delete BBOX.D}; if (BBOX.H <= BBOX.h) {delete BBOX.H}
      if (!hasDimens) {span.bbox = {h:0, d:0, w:0, lw:0, rw: 0}}
      if (width != null) {span.bbox.width = width}
      return stretchy;
    },
    HTMLcanStretch: function (direction) {return false},
    
    HTMLcreateSpan: function (span) {
      span = HTMLCSS.addElement(span,"span",{className: this.type});
      this.spanID = HTMLCSS.GetID(); span.id = "MathJax-Span-"+this.spanID;
      return span;
    },
    HTMLspanElement: function () {
      if (!this.spanID) {return null}
      return document.getElementById("MathJax-Span-"+this.spanID);
    },
    
    HTMLhandleVariant: function (span,variant,text) {HTMLCSS.handleVariant(span,variant,text)},
    
    HTMLhandleSize: function (span) {
      span.scale = this.HTMLgetScale();
      if (span.scale !== 1) {span.style.fontSize = HTMLCSS.Percent(span.scale)}
      return span;
    },
    
    HTMLhandleColor: function (span) {
      var values = this.getValues("mathcolor","mathbackground");
      if (values.mathcolor) {span.style.color = values.mathcolor}
      if (values.mathbackground !== MML.COLOR.TRANSPARENT && values.mathbackground !== "") {
        var dd = 1/HTMLCSS.em;
        var lW = span.bbox.lw - dd, rW = span.bbox.rw - span.bbox.w;
        if (span.style.paddingLeft  !== "") {lW += parseFloat(span.style.paddingLeft)}
        if (span.style.paddingRight !== "") {rW -= parseFloat(span.style.paddingRight)}
        var W = Math.max(0,HTMLCSS.getW(span) - lW + rW + dd);
        if (HTMLCSS.msieCharPaddingWidthBug && span.style.paddingLeft !== "")
          {W += parseFloat(span.style.paddingLeft)}
        var H = span.bbox.h + span.bbox.d + 2*dd; var D = -(span.bbox.d+dd);
        rW = -W-lW;
        if (HTMLCSS.msieInlineBlockAlignBug) {
          if (H > HTMLCSS.D) {D += HTMLCSS.D} else {D = span.bbox.h+dd}
        }
        var frame = HTMLCSS.Element("span",{
          style:{display:"inline-block", backgroundColor:values.mathbackground,
                 width: HTMLCSS.Em(W), height:HTMLCSS.Em(H), verticalAlign: HTMLCSS.Em(D),
                 marginLeft: HTMLCSS.Em(lW), marginRight: HTMLCSS.Em(rW)}
        });
        span.parentNode.insertBefore(frame,span);
        if (HTMLCSS.msieInlineBlockAlignBug) {
          span.parentNode.insertBefore(HTMLCSS.Element("span",{style:{marginLeft:HTMLCSS.Em(lW)}}),frame);
          span.parentNode.insertBefore(HTMLCSS.Element("span",{style:{marginRight:HTMLCSS.Em(rW)}}),span);
          frame.style.marginLeft = frame.style.marginRight = "";
          frame.style.overflow = "hidden";
          span.style.position = "relative";
        }
      }
    },
    
    HTMLhandleSpace: function (span) {
      // for TeX mode
      var space = this.texSpacing();
      if (space !== "") {span.style.paddingLeft = HTMLCSS.length2Em(space)}
      // for MML mode
      // if (this.type !== "mo") return
      // if (this.Get("scriptlevel") == 0) {
      //   span.style.paddingLeft =  HTMLCSS.length2Em(this.Get("lspace"));
      //   span.style.paddingRight = HTMLCSS.length2Em(this.Get("rspace"));
      // }
    },

    HTMLgetScale: function () {
      var scale = 1, values = this.getValues("mathsize","scriptlevel");
      if (values.scriptlevel !== 0) {
        if (values.scriptlevel > 2) {values.scriptlevel = 2}
        scale = Math.pow(this.Get("scriptsizemultiplier"),values.scriptlevel);
      }
      scale *= HTMLCSS.length2em(values.mathsize);
      return scale;
    }
  });
  
  MML.mi.Augment({
    toHTML: function (span) {
      span = this.HTMLhandleSize(this.HTMLcreateSpan(span));
      var variant = this.Get("mathvariant"); if (this.variantForm) {variant = "-"+HTMLCSS.fontInUse+"-variant"}
      this.HTMLhandleVariant(span,HTMLCSS.FONTDATA.VARIANT[variant],this.data.join(""));
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });

  MML.mn.Augment({
    toHTML: function (span) {
      span = this.HTMLhandleSize(this.HTMLcreateSpan(span));
      var variant = this.Get("mathvariant"); if (this.variantForm) {variant = "-"+HTMLCSS.fontInUse+"-variant"}
      this.HTMLhandleVariant(span,HTMLCSS.FONTDATA.VARIANT[variant],this.data.join(""));
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });

  MML.mo.Augment({
    toHTML: function (span) {
      span = this.HTMLhandleSize(this.HTMLcreateSpan(span));
      var values = this.getValues("mathvariant","largeop","displaystyle");
      if (this.variantForm) {values.mathvariant = "-"+HTMLCSS.fontInUse+"-variant"}
      if (values.largeop) {values.mathvariant = (values.displaystyle ? "-largeOp" : "-smallOp")}
      this.HTMLhandleVariant(span,HTMLCSS.FONTDATA.VARIANT[values.mathvariant],this.data.join(""));
      if (values.largeop || this.texClass === MML.TEXCLASS.OP) {
        var p = (span.bbox.h - span.bbox.d)/2 - HTMLCSS.TeX.axis_height*span.scale;
        if (HTMLCSS.safariVerticalAlignBug && span.lastChild.nodeName === "IMG") {
          span.lastChild.style.verticalAlign =
            HTMLCSS.Em(parseFloat(span.lastChild.style.verticalAlign||0)/HTMLCSS.em-p/span.scale);
        } else         if (HTMLCSS.konquerorVerticalAlignBug && span.lastChild.nodeName === "IMG") {
          span.style.position = "relative";
          span.lastChild.style.position="relative";
          span.lastChild.style.top = HTMLCSS.Em(p/span.scale);
        } else {
          span.style.verticalAlign = HTMLCSS.Em(-p/span.scale);
        }
        span.bbox.h -= p; span.bbox.d += p;
        if (span.bbox.rw > span.bbox.w) {
          span.bbox.ic = span.bbox.rw-span.bbox.w;
          HTMLCSS.createBlank(span,span.bbox.ic);
          span.bbox.w = span.bbox.rw;
        }
      }
      // FIXME:  handle embellished operators
      // FIXME:  handle explicitly set lspace and rspace (these get set by autoDefault, so must avoid that)
//      if (this.lspace) {span.style.paddingLeft  = HTMLCSS.length2Em(this.lspace); this.texClass = MML.TEXCLASS.NONE}
//      if (this.rspace) {span.style.paddingRight = HTMLCSS.length2Em(this.rspace); this.texClass = MML.TEXCLASS.NONE}
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    },
    HTMLcanStretch: function (direction) {
      if (!this.Get("stretchy")) {return false}
      var c = this.data.join("");
      if (c.length > 1) {return false}
      c = HTMLCSS.FONTDATA.DELIMITERS[c.charCodeAt(0)];
      return (c && c[c.length-1].direction == direction);
    },
    HTMLstretchV: function (mrow) {
      var values = this.getValues("symmetric","maxsize","minsize");
      var span = this.HTMLspanElement(), H, W = span.bbox.w;
      var axis = HTMLCSS.TeX.axis_height;
      if (values.symmetric) {H = 2*Math.max(mrow.bbox.h-axis,mrow.bbox.d+axis)}
                       else {H = math.bbox.h + math.bbox.d}
      if (values.maxsize.match(/^\d+$/)) {values.maxsize *= H}
        else {values.maxsize = HTMLCSS.length2em(values.maxsize)}
      if (values.minsize.match(/^\d+$/)) {values.maxsize *= H}
        else {values.minsize = HTMLCSS.length2em(values.minsize)}
      H = Math.max(values.minsize,Math.min(values.maxsize,H));
      while (span.firstChild) {span.removeChild(span.firstChild)};
      HTMLCSS.createDelimiter(span,this.data.join("").charCodeAt(0),H,span.scale);
      if (values.symmetric) {span.bbox.h = span.bbox.d/2 + axis}
        else {span.bbox.h = span.bbox.d * mrow.bbox.h/(mrow.bbox.h + mrow.bbox.d)}
      span.bbox.d -= span.bbox.h;
      HTMLCSS.positionDelimiter(span,span.bbox.h);
      if (span.bbox.h > mrow.bbox.h) {mrow.bbox.h = span.bbox.h}
      if (span.bbox.d > mrow.bbox.d) {mrow.bbox.d = span.bbox.d}
      mrow.bbox.w += (span.bbox.w - W);
      this.HTMLhandleColor(span);
    },
    HTMLstretchH: function (box,W) {
      var values = this.getValues("maxsize","minsize","mathvariant");
      var span = this.HTMLspanElement(); span.style.fontSize = ""; span.style.fontFamily = "";
      while(box.firstChild != span) {box.removeChild(box.firstChild)} // remove color box, if any
      if (values.maxsize.match(/^\d+$/)) {values.maxsize *= W}
        else {values.maxsize = HTMLCSS.length2em(values.maxsize)}
      if (values.minsize.match(/^\d+$/)) {values.maxsize *= W}
        else {values.minsize = HTMLCSS.length2em(values.minsize)}
      W = Math.max(values.minsize,Math.min(values.maxsize,W));
      while (span.firstChild) {span.removeChild(span.firstChild)};
      HTMLCSS.createDelimiter(span,this.data.join("").charCodeAt(0),W,span.scale,values.mathvariant);
      this.HTMLhandleColor(span);
      box.bbox = span.bbox;
    }
  });
  
  MML.mtext.Augment({
    toHTML: function (span) {
      span = this.HTMLhandleSize(this.HTMLcreateSpan(span));
      var variant = this.Get("mathvariant"); if (this.variantForm) {variant = "-"+HTMLCSS.fontInUse+"-variant"}
      this.HTMLhandleVariant(span,HTMLCSS.FONTDATA.VARIANT[variant],this.data.join(""));
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  MML.mspace.Augment({
    toHTML: function (span) {
      span = this.HTMLhandleSize(this.HTMLcreateSpan(span));
      var values = this.getValues("height","depth","width","mathbackground");
      var h = HTMLCSS.length2em(values.height), d = HTMLCSS.length2em(values.depth),
          w = HTMLCSS.length2em(values.width);
      if (this.texfilled && w > 0 && h+d > 0) {HTMLCSS.createRule(span,h,d,w)}
       else {HTMLCSS.createSpace(span,h,d,w,values.mathbackground)}
     return span;
    }
  });

  MML.mphantom.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      HTMLCSS.Measured(this.data[0].toHTML(span),span);
      span.bbox.lw = 0; span.bbox.rw = 0;
      if (span.bbox.H != null) {delete span.bbox.H}
      if (span.bbox.D != null) {delete span.bbox.D}
      for (var i = 0, m = span.childNodes.length; i < m; i++)
        {span.childNodes[i].style.visibility = "hidden"}
      return span;
    }
  });
  
  MML.mpadded.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      var stack = HTMLCSS.createStack(span,true);
      var box = HTMLCSS.createBox(stack);
      HTMLCSS.Measured(this.data[0].toHTML(box),box);
      span.bbox = {h: box.bbox.h, d: box.bbox.d, w: box.bbox.w, lw: box.bbox.lw, rw: box.bbox.rw};
      var values = this.getValues("height","depth","width","lspace","voffset"), x = 0, y = 0, v;
      // FIXME:  handle % and multiples of given dimensions
      if (values.lspace)
        {x = (values.lspace === "-1 width" ? -box.bbox.w : HTMLCSS.length2em(values.lspace))}
      if (values.voffset) {y = HTMLCSS.length2em(values.voffset)}
      HTMLCSS.placeBox(box,x,y); span.bbox.lw += x; span.bbox.rw += x;
      if (values.height !== "") {
        v = HTMLCSS.length2em(values.height);
        if (String(values.height).match(/^\s*[-+]/)) {span.bbox.h += v} else {span.bbox.h = v}
      }
      if (values.depth !== "") {
        v = HTMLCSS.length2em(values.depth);
        if (String(values.depth).match(/^\s*[-+]/)) {span.bbox.d += v} else {span.bbox.d = v}
      }
      if (values.width !== "") {
        v = HTMLCSS.length2em(values.width);
        if (String(values.width).match(/^\s*[-+]/)) {span.bbox.w += v} else {span.bbox.w = v}
      }
      if (span.bbox.h < box.bbox.h+y) {span.bbox.H = box.bbox.h+y}
      if (span.bbox.d < box.bbox.d-y) {span.bbox.D = box.bbox.d-y}
      HTMLCSS.setStackWidth(stack,span.bbox.w);
      return span;
    }
  });
  
  MML.mstyle.Augment({
    toHTML: function (span) {return this.data[0].toHTML(span)}, // avoid inferred row?
    HTMLspanElement: function () {return this.data[0].HTMLspanElement()}
  });
  
  MML.mfrac.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      var frac = HTMLCSS.createStack(span);
      var num = HTMLCSS.createBox(frac), den = HTMLCSS.createBox(frac);
      HTMLCSS.Measured(this.data[0].toHTML(num),num);
      HTMLCSS.Measured(this.data[1].toHTML(den),den);
      var values = this.getValues("displaystyle","linethickness","numalign","denomalign");
      var scale = this.HTMLgetScale(), isDisplay = values.displaystyle;
      var w0 = num.bbox.w, w1 = den.bbox.w, W = Math.max(w0,w1), x0, x1;
      x0 = ({left: 0, right: W-w0, center: (W-w0)/2})[values.numalign] || 0;
      x1 = ({left: 0, right: W-w1, center: (W-w1)/2})[values.denomalign] || 0;
      var t = HTMLCSS.thickness2em(values.linethickness), p,q, u,v;
      if (isDisplay) {u = HTMLCSS.TeX.num1; v = HTMLCSS.TeX.denom1}
        else {u = (t === 0 ? HTMLCSS.TeX.num3 : HTMLCSS.TeX.num2); v = HTMLCSS.TeX.denom2}
      u *= scale; v *= scale;
      if (t === 0) {// \atop
        p = Math.max((isDisplay ? 7 : 3) * HTMLCSS.TeX.rule_thickness, 2/this.em); // force to at least 2 px
        q = (u - num.bbox.d) - (den.bbox.h - v);
        if (q < p) {u += (p - q)/2; v += (p - q)/2}
      } else {// \over
        var a = HTMLCSS.TeX.axis_height * scale;
        p = Math.max((isDisplay ? 3 : 1) * t, 1.5/this.em);  // force to be at least 1.5px
        q = (u - num.bbox.d) - (a + t/2); if (q < p) {u += p - q}
        q = (a - t/2) - (den.bbox.h - v); if (q < p) {v += p - q}
        var rule = HTMLCSS.createBox(frac);
        HTMLCSS.createRule(rule,t,0,W);
        HTMLCSS.placeBox(rule,0,a-t/2);
      }
      HTMLCSS.alignBox(num,values.numalign,u);
      HTMLCSS.alignBox(den,values.denomalign,-v);
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  MML.msqrt.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      var sqrt = HTMLCSS.createStack(span);
      var base = HTMLCSS.createBox(sqrt),
          rule = HTMLCSS.createBox(sqrt),
          surd = HTMLCSS.createBox(sqrt);
      HTMLCSS.Measured(this.data[this.data.length-1].toHTML(base),base);
      var scale = this.HTMLgetScale();
      var t = HTMLCSS.TeX.rule_thickness * scale, p,q, H, W;
      if (this.Get("displaystyle")) {p = HTMLCSS.TeX.x_height * scale} else {p = t}
      q = Math.max(t + p/4,2*HTMLCSS.TeX.min_rule_thickness/this.em); // force to be at least 2px
      H = base.bbox.h + base.bbox.d + q + t;
      W = Math.max(base.bbox.w,base.bbox.rw);
      HTMLCSS.createDelimiter(surd,0x221A,H,scale); HTMLCSS.Measured(surd);
      var x = 0; if (surd.isMultiChar) {surd.bbox.w -= .05}
      if (surd.bbox.d > H) {q += (surd.bbox.d - (H-t))/2}
      if (W < HTMLCSS.FONTDATA.DELIMITERS[HTMLCSS.FONTDATA.RULECHAR][0][0]*scale || scale < .75) {
        HTMLCSS.createRule(rule,t,0,W);
      } else {
        HTMLCSS.createDelimiter(rule,HTMLCSS.FONTDATA.RULECHAR,W,scale);
      }
      H = base.bbox.h + q + t;
      x = this.HTMLaddRoot(sqrt,surd,x,surd.bbox.d-H,scale);
      HTMLCSS.placeBox(surd,x,H);
      HTMLCSS.placeBox(rule,x+surd.bbox.w,H-rule.bbox.h+HTMLCSS.rfuzz);
      HTMLCSS.placeBox(base,x+surd.bbox.w,0);
      span.bbox.h += t;
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    },
    HTMLaddRoot: function (sqrt,surd,x,d,scale) {return x}
  });
  
  MML.mroot.Augment({
    toHTML: MML.msqrt.prototype.toHTML,
    HTMLaddRoot: function (sqrt,surd,x,d,scale) {
      var root = HTMLCSS.createBox(sqrt); HTMLCSS.Measured(this.data[0].toHTML(root),root);
      var h = this.HTMLrootHeight(surd.bbox.d,scale)-d;
      x = Math.max(root.bbox.w,surd.offset);
      HTMLCSS.placeBox(root,x-root.bbox.w,h);
      return x - surd.offset;
    },
    HTMLrootHeight: function (d,scale) {return .5*(d-.9*scale)+.65*scale}
  });
  
  MML.mfenced.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      var open = HTMLCSS.addElement(span,"span");
      // FIXME:  handle multiple children with separators
      this.data[0].toHTML(span);
      var close = HTMLCSS.addElement(span,"span");
      this.HTMLcomputeBBox(span);
      
      var scale = this.HTMLgetScale();
      var a = HTMLCSS.TeX.axis_height * scale,
          f = HTMLCSS.TeX.delimiterfactor * scale,
          l = HTMLCSS.TeX.delimitershortfall * scale;
      var d = Math.max(span.bbox.h - a,span.bbox.d + a);
      var H = Math.max(Math.floor(d/500*f),2*d-l);

      if (this.open) {
        HTMLCSS.createDelimiter(open,this.open.charCodeAt(0),[H,2*d]);
        open.bbox.h = open.bbox.d/2 + a; open.bbox.d -= open.bbox.h;
        HTMLCSS.positionDelimiter(open,open.bbox.h);
        if (open.bbox.h > span.bbox.h) {span.bbox.h = open.bbox.h}
        if (open.bbox.d > span.bbox.d) {span.bbox.d = open.bbox.d}
        span.bbox.w += open.bbox.w;
        span.bbox.lw = open.bbox.lw;
      }

      if (this.close) {
        HTMLCSS.createDelimiter(close,this.close.charCodeAt(0),[H,2*d]);
        close.bbox.h = close.bbox.d/2 + a; close.bbox.d -= close.bbox.h;
        HTMLCSS.positionDelimiter(close,close.bbox.h);
        if (close.bbox.h > span.bbox.h) {span.bbox.h = close.bbox.h}
        if (close.bbox.d > span.bbox.d) {span.bbox.d = close.bbox.d}
        span.bbox.rw = span.bbox.w + close.bbox.rw;
        span.bbox.w += close.bbox.w;
      }

      this.texClass = MML.TEXCLASS.OPEN;
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  MML.munderover.Augment({
    toHTML: function (span) {
      if (!this.Get("displaystyle") && this.data[this.base].Get("movablelimits"))
        {return MML.msubsup.prototype.toHTML.call(this,span)}
      span = this.HTMLcreateSpan(span); var scale = this.HTMLgetScale();
      var stack = HTMLCSS.createStack(span);
      var boxes = [], stretch = [], box, i, m, W = -HTMLCSS.BIGDIMEN, WW = W;
      for (i = 0, m = this.data.length; i < m; i++) {
        if (this.data[i]) {
          box = boxes[i] = HTMLCSS.createBox(stack);
          HTMLCSS.Measured(this.data[i].toHTML(box),box);
          stretch[i] = this.data[i].HTMLcanStretch("Horizontal");
          if (box.bbox.w > WW) {WW = box.bbox.w}
          if (!stretch[i] && WW > W) {W = WW}
        }
      }
      if (W == -HTMLCSS.BIGDIMEN) {W = WW}
      var t = HTMLCSS.TeX.rule_thickness, factor = HTMLCSS.FONTDATA.TeX_factor;
      var base = boxes[this.base], delta = (base.bbox.ic || 0);
      var x, y, z1, z2, z3, dw, k;
      for (i = 0, m = this.data.length; i < m; i++) {
        if (this.data[i]) {
          box = boxes[i];
          if (stretch[i]) {this.data[i].HTMLstretchH(box,W)}
          z3 = HTMLCSS.TeX.big_op_spacing5 * scale;
          var accent = (i != this.base && this.Get(["","accentunder","accent"][i]));
          if (accent && box.bbox.w <= 1/HTMLCSS.em+.0001) { // images can get the width off by 1px
            box.bbox.w = box.bbox.rw; box.bbox.noclip = true;
	    if (!HTMLCSS.AccentBug) {HTMLCSS.createBlank(box,box.bbox.w+.1)}
	      else {box.firstChild.firstChild.nodeValue += HTMLCSS.NBSP}
          }
          dw = (W - box.bbox.w)/2; x = dw, y = 0;
	  if (i == this.over) {
            if (accent) {
              k = Math.max(t * scale * factor,2.5/this.em); z3 = 0;
              if (base.bbox.skew) {x += base.bbox.skew}
            } else {
              z1 = HTMLCSS.TeX.big_op_spacing1 * scale * factor;
              z2 = HTMLCSS.TeX.big_op_spacing3 * scale * factor;
              k = Math.max(z1,z2-Math.max(0,box.bbox.d));
            }
            k = Math.max(k,1.5/this.em); // force to be at least 1.5px
            x += delta; y = base.bbox.h + box.bbox.d + k;
            box.bbox.h += z3;
          } else if (i == this.under) {
            if (accent) {
              k = 3*t * scale * factor; z3 = 0;
            } else {
              z1 = HTMLCSS.TeX.big_op_spacing2 * scale * factor;
              z2 = HTMLCSS.TeX.big_op_spacing4 * scale * factor;
              k = Math.max(z1,z2-box.bbox.h);
            }
            k = Math.max(k,1.5/this.em); // force to be at least 1.5px
	    x -= delta; y = -(base.bbox.d + box.bbox.h + k);
            box.bbox.d += z3;
          }
          HTMLCSS.placeBox(box,x,y);
        }
      }
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  MML.msubsup.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span); var scale = this.HTMLgetScale();
      var stack = HTMLCSS.createStack(span), script, box, values;
      var base = HTMLCSS.createBox(stack);
      HTMLCSS.Measured(this.data[this.base].toHTML(base),base);
      HTMLCSS.placeBox(base,0,0);
      var sscale = (this.data[this.sup] || this.data[this.sub]).HTMLgetScale();
      var x_height = HTMLCSS.TeX.x_height * scale,
          s = HTMLCSS.TeX.scriptspace * scale * .75;  // FIXME: .75 can be removed when IC is right?
      var sup, sub;
      if (this.data[this.sup]) {
        sup = HTMLCSS.createBox(stack);
        HTMLCSS.Measured(this.data[this.sup].toHTML(sup),sup);
        sup.bbox.w = sup.bbox.rw = Math.max(sup.bbox.w,sup.bbox.rw) + s;
      }
      if (this.data[this.sub]) {
        sub = HTMLCSS.createBox(stack);
        HTMLCSS.Measured(this.data[this.sub].toHTML(sub),sub);
        sub.bbox.w = sub.bbox.rw = Math.max(sub.bbox.w,sub.bbox.rw) + s;
      }
      var q = HTMLCSS.TeX.sup_drop * sscale, r = HTMLCSS.TeX.sub_drop * sscale;
      var u = base.bbox.h - q, v = base.bbox.d + r, delta = 0, p;
      if (base.bbox.ic) {delta = base.bbox.ic}
      if (this.data[this.base].type === "mi" || this.data[this.base].type === "mo") {
        if (this.data[this.base].data.join("").length === 1 &&
            !this.data[this.base].Get("largeop")) {u = v = 0}
      }
      if (!sup) {
        v = Math.max(v,HTMLCSS.TeX.sub1*scale,sub.bbox.h-(4/5)*x_height);
        HTMLCSS.placeBox(sub,base.bbox.w+s-delta,-v,sub.bbox);
      } else {
        if (!sub) {
          var values = this.getValues("displaystyle","texprimestyle");
          p = HTMLCSS.TeX[(values.displaystyle ? "sup1" : (values.texprimestyle ? "sup3" : "sup2"))];
          u = Math.max(u,p*scale,sup.bbox.d+(1/4)*x_height);
          HTMLCSS.placeBox(sup,base.bbox.w+s,u,sup.bbox);
        } else {
          v = Math.max(v,HTMLCSS.TeX.sub2*scale);
          var t = HTMLCSS.TeX.rule_thickness * scale;
          if ((u - sup.bbox.d) - (sub.bbox.h - v) < 3*t) {
            v = 3*t - u + sup.bbox.d + sub.bbox.h;
            q = (4/5)*x_height - (u - sup.bbox.d) + .05*scale*0;
            if (q > 0) {u += q; v -= q}
          }
          HTMLCSS.placeBox(sup,base.bbox.w+s,u);
          HTMLCSS.placeBox(sub,base.bbox.w+s-delta,-v);
        }
      }
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  MML.mtable.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      var values = this.getValues("columnalign","columnspacing","rowspacing",
                                  "align","useHeight","width","side","minlabelspacing");
      var WIDTH = (values.width === "auto" ? null : values.width);
      var stack = HTMLCSS.createStack(span,false,WIDTH);
      var scale = this.HTMLgetScale(); var LABEL = -1;
      //
      //  Create cells and measure columns and rows
      //
      var H = [], D = [], W = [], A = [], i, j, J = 0, m, M, s, row, C = [];
      var LHD = HTMLCSS.FONTDATA.baselineskip * scale * values.useHeight,
          LH = HTMLCSS.FONTDATA.lineH * scale, LD = HTMLCSS.FONTDATA.lineD * scale;
      for (i = 0, m = this.data.length; i < m; i++) {
        row = this.data[i]; s = (row.type === "mlabeledtr" ? LABEL : 0);
        A[i] = []; H[i] = 0; D[i] = 0;
        for (j = s, M = row.data.length + s; j < M; j++) {
          if (W[j] == null) {
            W[j] = -HTMLCSS.BIGDIMEN; if (j > J) {J =j}
            // FIXME:  these widths should come from columnwidths attribute
            C[j] = HTMLCSS.createStack(HTMLCSS.createBox(stack,WIDTH),false,WIDTH);
          }
          A[i][j] = HTMLCSS.createBox(C[j]);
          HTMLCSS.Measured(row.data[j-s].toHTML(A[i][j]),A[i][j]);
          if (A[i][j].bbox.h > H[i]) {H[i] = A[i][j].bbox.h}
          if (A[i][j].bbox.d > D[i]) {D[i] = A[i][j].bbox.d}
          if (A[i][j].bbox.w > W[j]) {W[j] = A[i][j].bbox.w}
        }
      }
      H[0] = Math.max(H[0],LH); D[A.length-1] = Math.max(D[A.length-1],LD);
      //
      //  Determine spacing and alignment
      //
      var CSPACE = values.columnspacing.split(/ /),
          RSPACE = values.rowspacing.split(/ /),
          CALIGN = values.columnalign.split(/ /);
      for (i = 0, m = CSPACE.length; i < m; i++) {CSPACE[i] = HTMLCSS.length2em(CSPACE[i])}
      for (i = 0, m = RSPACE.length; i < m; i++) {RSPACE[i] = HTMLCSS.length2em(RSPACE[i])}
      while (CSPACE.length <= J) {CSPACE.push(CSPACE[CSPACE.length-1])}
      while (CALIGN.length <= J) {CALIGN.push(CALIGN[CALIGN.length-1])}
      while (RSPACE.length <= A.length) {RSPACE.push(RSPACE[RSPACE.length-1])}
      if (C[LABEL]) {
        CALIGN[LABEL] = (values.side.substr(0,1) === "l" ? "left" : "right");
        CSPACE[LABEL] = -W[LABEL];
      }
      //
      //  Determine array total height
      //
      var HD = H[0] + D[A.length-1];
      for (i = 0, m = A.length-1; i < m; i++) {HD += Math.max(LHD,D[i]+H[i+1]+RSPACE[i])}
      //
      //  Compute alignment
      //
      var Y = HD/2 + HTMLCSS.TeX.axis_height*scale - H[0];
      //
      //  Lay out array by columns
      //
      var x = 0, y = Y; s = (C[LABEL] ? LABEL : 0);
      for (j = s; j <= J; j++) {
        for (i = 0, m = A.length; i < m; i++) {
          s = (this.data[i].type === "mlabeledtr" ? LABEL : 0);
          if (A[i][j])
            {HTMLCSS.alignBox(A[i][j],(this.data[i].data[j-s].columnalign||CALIGN[j]),y)}
          if (i < A.length-1) {y -= Math.max(LHD,D[i]+H[i+1]+ RSPACE[i])}
        }
        HTMLCSS.placeBox(C[j].parentNode,x,0);
        x += W[j] + CSPACE[j]; y = Y;
      }
      //
      //  Place the labels, if any
      //
      if (C[LABEL]) {
        var eqn = HTMLCSS.createStack(span,false,"100%");
        var align = HTMLCSS.config.styles[".MathJax_Display"]["text-align"];
        HTMLCSS.addBox(eqn,stack); HTMLCSS.alignBox(stack,align,0);
        HTMLCSS.addBox(eqn,C[LABEL]); HTMLCSS.alignBox(C[LABEL],CALIGN[LABEL],0);
        C[LABEL].style.marginRight = C[LABEL].style.marginLeft =
          HTMLCSS.length2Em(values.minlabelspacing);
        if (span.bbox.width != null) {
          stack.style.width = span.bbox.width;
          span.bbox.width="100%"
        }
      }
      //
      //  Finish the table
      //
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  MML.merror.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      HTMLCSS.addText(span,this.data[0].data.join("")); // avoid inferred row brackets
      var HD = HTMLCSS.getHD(span), W = HTMLCSS.getW(span);
      span.bbox = {h: HD.h, d: HD.d, w: W, lw: 0, rw: W};
      return span;
    }
  });
  
  MML.root.Augment({
    toHTML: function (span) {
      span = HTMLCSS.addElement(span,"nobr",{style:{visibility:"hidden"}});
      var stack = HTMLCSS.createStack(span);
      var box = HTMLCSS.createBox(stack);
      var math = HTMLCSS.Measured(this.data[0].toHTML(box),box);
      HTMLCSS.placeBox(box,0,0);
      if (math.bbox.width != null) {
        stack.style.width = math.bbox.width;
        box.style.width = "100%";
      }
      HTMLCSS.createRule(span,math.bbox.h,math.bbox.d,0);
      span.style.visibility = "";
      return span;
    }
  });
  
  MML.TeXAtom.Augment({
    toHTML: function (span) {
      span = this.HTMLcreateSpan(span);
      if (this.texClass === MML.TEXCLASS.VCENTER) {
        var stack = HTMLCSS.createStack(span);
        var box = HTMLCSS.createBox(stack);
        HTMLCSS.Measured(this.data[0].toHTML(box),box);
        // FIXME: should the axis height be scaled?
        HTMLCSS.placeBox(box,0,HTMLCSS.TeX.axis_height-(box.bbox.h+box.bbox.d)/2+box.bbox.d);
      } else {
        span.bbox = this.data[0].toHTML(span).bbox;
      }
      this.HTMLhandleSpace(span);
      this.HTMLhandleColor(span);
      return span;
    }
  });
  
  //
  //  Handle browser-specific setup
  //
  MathJax.Hub.Browser.Select({
    MSIE: function (browser) {
      var isIE7 = browser.versionAtLeast("7.0");
      var isIE8 = browser.versionAtLeast("8.0") && document.documentMode > 7;
      var quirks = (document.compatMode === "BackCompat");
      // FIXME:  work out tests for these?
      HTMLCSS.Augment({
        msiePaddingWidthBug: true,
        msieCharPaddingWidthBug: (isIE8 && !quirks),
        msieInlineBlockAlignBug: (!isIE8 || quirks),
        msieVerticalAlignBug: (isIE8 && !quirks),
        msiePlaceBoxBug: (isIE8 && !quirks),
        msieClipRectBug: !isIE8,
        msieNegativeSpaceBug: quirks,
        negativeSkipBug: true,
        msieIE6: !isIE7,
        msieItalicWidthBug: true,
        FontFaceBug: true,
        allowWebFonts: "eot"
      });
    },

    Firefox: function (browser) {
      HTMLCSS.Augment({
        ffVerticalAlignBug: true,
        AccentBug: true,
        allowWebFonts: (browser.versionAtLeast("3.5") &&
                        document.location.protocol !== "file:" ? "otf" : false)
      });
    },

    Safari: function (browser) {
      var v3p0 = browser.versionAtLeast("3.0");
      var v3p1 = browser.versionAtLeast("3.1");
      browser.isMobile = (navigator.appVersion.match(/Mobile/i) != null);
      HTMLCSS.Augment({
        hfuzz: .1, dfuzz: -.5, rfuzz: .05,
        safariNegativeSpaceBug: true,
        safariVerticalAlignBug: !v3p1,
        safariTextNodeBug: !v3p0,
        safariWebFontSerif: ["serif"],
        allowWebFonts: (v3p1 && !browser.isMobile ? (browser.isPC ? "svg" : "otf") : false)
      });
    },

    Chrome: function (browser) {
      HTMLCSS.Augment({
        hfuzz: 0, dfuzz: -.15, vfuzz: .05,
        AccentBug: !browser.isPC,
        allowWebFonts: "svg",
        safariNegativeSpaceBug: true,
        safariWebFontSerif: [""]
      });
    },
    
    Opera: function (browser) {
      HTMLCSS.config.styles[".MathJax .merror"]["vertical-align"] = null;
      HTMLCSS.Augment({
        operaHeightBug: true,
        operaVerticalAlignBug: true,
        negativeSkipBug: true,
        FontFaceBug: true,
        allowWebFonts: (browser.versionAtLeast("10.0") ? "otf" : false)
      });
    },
    
    Konqueror: function (browser) {
      HTMLCSS.Augment({
        konquerorVerticalAlignBug: true
      });
    }
  });
  
  // FIXME:  if (HTMLCSS.allowWebFonts == null) {do algorithmic check}
  // FIXME:  report error if browser is too old to be supported?
  
  HTMLCSS.loadComplete("jax.js");

})(MathJax.ElementJax.mml, MathJax.Ajax, MathJax.OutputJax["HTML-CSS"]);
