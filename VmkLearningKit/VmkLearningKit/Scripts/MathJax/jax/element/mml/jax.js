/*************************************************************
 *
 *  MathJax/jax/element/mml/jax.js
 *  
 *  Implements the MML ElementJax that holds the internal represetation
 *  of the mathematics on the page.  Various InputJax will produce this
 *  format, and the OutputJax will display it in various formats.
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

MathJax.ElementJax.mml = MathJax.ElementJax.Subclass({
  mimeType: "jax/mml"
},{
  name: "mml",
  version: 1.0,
  directory: MathJax.ElementJax.directory + "/mml",
  extensionDir: MathJax.ElementJax.extensionDir + "/mml"
});

MathJax.ElementJax.mml.Augment({
  Init: function () {
    this.mml = MathJax.ElementJax.mml;
    this.root = this.mml.root.apply(this,arguments);
  }
},{
  INHERIT: "_inherit_",
  AUTO: "_auto_",
  SIZE: {
    INFINITY: "infinity",
    SMALL: "small",
    NORMAL: "normal",
    BIG: "big"
  },
  COLOR: {
    TRANSPARENT: "transparent"
  },
  VARIANT: {
    NORMAL: "normal",
    BOLD: "bold",
    ITALIC: "italic",
    BOLDITALIC: "bold-italic",
    DOUBLESTRUCK: "double-struck",
    FRAKTUR: "fraktur",
    BOLDFRAKTUR: "bold-fraktur",
    SCRIPT: "script",
    BOLDSCRIPT: "bold-script",
    SANSSERIF: "sans-serif",
    BOLDSANSSERIF: "bold-sans-serif",
    SANSSARIFITALIC: "sans-serif-italic",
    SANSSERIFBOLDITALIC: "sans-serif-bold-italic",
    MONOSPACE: "monospace",
    INITIAL: "inital",
    TAILED: "tailed",
    LOOPED: "looped",
    STRETCHED: "stretched",
    CALIGRAPHIC: "-tex-caligraphic",
    OLDSTYLE: "-tex-oldstyle"
  },
  FORM: {
    PREFIX: "prefix",
    INFIX: "infix",
    POSTFIX: "postfix"
  },
  LINEBREAK: {
    AUTO: "auto",
    NEWLINE: "newline",
    NOBREAK: "nobreak",
    GOODBREAK: "goodbreak",
    BADBREAK: "badbreak"
  },
  LINEBREAKSTYLE: {
    BEFORE: "before",
    AFTER: "after",
    DUPLICATE: "duplicate",
    INFIXLINBREAKSTYLE: "infixlinebreakstyle"
  },
  INDENTSTYLE: {
    LEFT: "left",
    CENTER: "center",
    RIGHT: "right",
    AUTO: "auto",
    ID: "id",
    INDENTSTYLE: "indentstyle"
  },
  INDENTOFFSET: {
    INDENTOFFSET: "indentoffset"
  },
  LINETHICKNESS: {
    THIN: "thin",
    MEDIUM: "medium",
    THICK: "thick"
  },
  NOTATION: {
    LONGDIV: "longdiv",
    ACTUARIAL: "actuarial",
    RADICAL: "radical",
    BOX: "box",
    ROUNDEDBOX: "roundedbox",
    CIRCLE: "circle",
    LEFT: "left",
    RIGHT: "right",
    TOP: "top",
    BOTTOM: "bottom",
    UPDIAGONALSTRIKE: "updiagonalstrike",
    DOWNDIAGONALSTRIKE: "downdiagonalstrike",
    VERTICALSTRIKE: "verticalstrike",
    HORIZONTALSTRIKE: "horizontalstrike",
    MADRUWB: "madruwb"
  },
  ALIGN: {
    TOP: "top",
    BOTTOM: "bottom",
    CENTER: "center",
    BASELINE: "baseline",
    AXIS: "axis",
    LEFT: "left",
    RIGHT: "right"
  },
  LINES: {
    NONE: "none",
    SOLID: "solid",
    DASHED: "dashed"
  },
  SIDE: {
    LEFT: "left",
    RIGHT: "right",
    LEFTOVERLAP: "leftoverlap",
    RIGHTOVERLAP: "rightoverlap"
  },
  WIDTH: {
    AUTO: "auto",
    FIT: "fit"
  },
  LENGTH: {
    VERYVERYTHINMATHSPACE: "veryverythinmathspace",
    VERYTHINMATHSPACE: "verythinmathspace",
    THINMATHSPACE: "thinmathspace",
    MEDIUMMATHSPACE: "mediummathspace",
    THICKMATHSPACE: "thickmathspace",
    VERYTHICKMATHSPACE: "verythickmathspace",
    VERYVERYTHICKMATHSPACE: "veryverythickmathspace",
    NEGATIVEVERYVERYTHINMATHSPACE: "negativeveryverythinmathspace",
    NEGATIVEVERYTHINMATHSPACE: "negativeverythinmathspace",
    NEGATIVETHINMATHSPACE: "negativethinmathspace",
    NEGATIVEMEDIUMMATHSPACE: "negativemediummathspace",
    NEGATIVETHICKMATHSPACE: "negativethickmathspace",
    NEGATIVEVERYTHICKMATHSPACE: "negativeverythickmathspace",
    NEGATIVEVERYVERYTHICKMATHSPACE: "negativeveryverythickmathspace"
  },
  UNIT: {
    EM: "em",
    EX: "ex",
    PX: "px",
    IN: "in",
    CM: "cm",
    MM: "mm",
    PT: "pt",
    PC: "pc"
  },
  TEXCLASS: {
    ORD:   0,
    OP:    1,
    BIN:   2,
    REL:   3,
    OPEN:  4,
    CLOSE: 5,
    PUNCT: 6,
    INNER: 7,
    VCENTER: 8,
    NONE:   -1
  },
  PLANE1: String.fromCharCode(0xD835)
});

(function (MML) {
  var FALSE = false; var TRUE = true;
  
  MML.mbase = MathJax.Object.Subclass({
    type: "base",
    isToken: FALSE,
    defaults: {},
    noInherit: {},
    
    Init: function () {
      this.data = [];
      if (this.inferRow && !(arguments.length === 1 && arguments[0].inferred))
        {this.Append(MML.mrow().With({inferred: TRUE}))}
      this.Append.apply(this,arguments);
    },
    With: function (def) {
      for (var id in def) {if (def.hasOwnProperty(id)) {this[id] = def[id]}}
      return this;
    },
    Append: function () {
      if (this.inferRow && this.data.length) {
        this.data[0].Append.apply(this.data[0],arguments);
      } else {
        for (var i = 0, m = arguments.length; i < m; i++)
          {this.SetData(this.data.length,arguments[i])}
      }
    },
    SetData: function (i,item) {
      if (item != null) {
        if (!(item instanceof MML.mbase)) {item = MML.chars(item)}
        item.parent = this;
        item.setInherit(this.inheritFromMe ? this : this.inherit);
      }
      this.data[i] = item;
    },
    Parent: function () {
      var parent = this.parent;
      while (parent && parent.inferred) {parent = parent.parent}
      return parent;
    },
    Get: function (name) {
      if (typeof(this[name]) !== "undefined") {return this[name]}
      // FIXME: should cache these values and get from cache
      // (clear cache when appended to a new object?)
      var parent = this.Parent();
      if (parent && parent["adjustChild_"+name] != null)
        {return (parent["adjustChild_"+name])(parent.childPosition(this))}
      var obj = this.inherit; var root = obj;
      while (obj) {
        if (typeof(obj[name]) !== "undefined") {
          var noInherit = obj.noInherit[this.type];
          if (!(noInherit && noInherit[name])) {return obj[name]}
        }
        root = obj; obj = obj.inherit;
      }
      if (this.defaults[name] === MML.AUTO) {return this.autoDefault(name)}
      if (this.defaults[name] !== MML.INHERIT && this.defaults[name] != null)
        {return this.defaults[name]}
      if (root) {return root.defaults[name]}
      return null;
    },
    getValues: function () {
      var values = {};
      for (var i = 0, m = arguments.length; i < m; i++)
        {values[arguments[i]] = this.Get(arguments[i])}
      return values;
    },
    adjustChild_scriptlevel:   function (i) {return this.Get("scriptlevel")},   // always inherit from parent
    adjustChild_displaystyle:  function (i) {return this.Get("displaystyle")},  // always inherit from parent
    adjustChild_texprimestyle: function (i) {return this.Get("texprimestyle")}, // always inherit from parent
    childPosition: function (child) {
      if (child.parent.inferred) {child = child.parent}
      for (var i = 0, m = this.data.length; i < m; i++) {if (this.data[i] === child) {return i}}
      return null;
    },
    setInherit: function (obj) {
      if (obj !== this.inherit && this.inherit == null) {
        this.inherit = obj;
        for (var i = 0, m = this.data.length; i < m; i++) {
          if (this.data[i] && this.data[i].setInherit) {this.data[i].setInherit(obj)}
        }
      }
    },
    setTeXclass: function (prev) {
      this.getPrevClass(prev);
      return (typeof(this.texClass) !== "undefined" ? this : prev);
    },
    getPrevClass: function (prev) {
      if (prev) {
        this.prevClass = prev.Get("texClass");
        this.prevLevel = prev.Get("scriptlevel");
      }
    },
    texSpacing: function () {
      var prev = (this.prevClass != null ? this.prevClass : MML.TEXCLASS.NONE);
      var tex = (this.Get("texClass") || MML.TEXCLASS.ORD);
      if (prev === MML.TEXCLASS.NONE || tex === MML.TEXCLASS.NONE) {return ""}
      if (prev === MML.TEXCLASS.VCENTER) {prev = MML.TEXCLASS.ORD}
      if (tex  === MML.TEXCLASS.VCENTER) {tex  = MML.TEXCLASS.ORD}
      var space = this.TEXSPACE[prev][tex];
      if (this.prevLevel > 0 && this.Get("scriptlevel") > 0 && space >= 0) {return ""}
      return this.TEXSPACELENGTH[Math.abs(space)];
    },
    TEXSPACELENGTH:[
      "",
      MML.LENGTH.THINMATHSPACE,
      MML.LENGTH.MEDIUMMATHSPACE,
      MML.LENGTH.THICKMATHSPACE
    ],
    // See TeXBook Chapter 18 (p. 170)
    TEXSPACE: [
      [ 0,-1, 2, 3, 0, 0, 0, 1], // ORD
      [-1,-1, 0, 3, 0, 0, 0, 1], // OP
      [ 2, 2, 0, 0, 2, 0, 0, 2], // BIN
      [ 3, 3, 0, 0, 3, 0, 0, 3], // REL
      [ 0, 0, 0, 0, 0, 0, 0, 0], // OPEN
      [ 0,-1, 2, 3, 0, 0, 0, 1], // CLOSE
      [ 1, 1, 0, 1, 1, 1, 1, 1], // PUNCT
      [ 1,-1, 2, 3, 1, 0, 1, 1]  // INNER
    ],
    autoDefault: function (name) {return ""},
    isSpacelike: function () {return FALSE},
    isEmbellished: function () {return FALSE},
    Core: function () {return this},
    array: function () {if (this.inferred) {return this.data} else {return [this]}},
    toString: function () {return this.type+"("+this.data.join(",")+")"}
  },{
    childrenSpacelike: function () {
      for (var i = 0; i < this.data.length; i++) {
        if (!this.data[i].isSpacelike()) {return FALSE}
      }
      return TRUE;
    },
    childEmbellished: function () {
      if (this.data.length === 0) {return FALSE}
      return this.data[0].isEmbellished();
    },
    childCore: function () {return this.data[0].Core()},
    setChildTeXclass: function (prev) {
      this.getPrevClass(prev);
      return this.data[0].setTeXclass(prev);
    },
    setRowTeXclasses: function (prev) {
      this.getPrevClass(prev);
      for (var i = 0, m = this.data.length; i < m; i++)
        {if (this.data[i]) {prev = this.data[i].setTeXclass(prev)}}
      return prev;
    },
    setBaseTeXclasses: function (prev) {
      this.getPrevClass(prev);
      prev = this.data[0].setTeXclass(prev);
      for (var i = 1, m = this.data.length; i < m; i++)
        {if (this.data[i]) {this.data[i].setTeXclass()}}
      return prev;
    },
    setSeparateTeXclasses: function (prev) {
      this.getPrevClass(prev);
      for (var i = 0, m = this.data.length; i < m; i++)
        {if (this.data[i]) {this.data[i].setTeXclass()}}
      return this;
    }
  });
  
  MML.mi = MML.mbase.Subclass({
    type: "mi", isToken: TRUE,
    texClass: MML.TEXCLASS.ORD,
    defaults: {
      mathvariant: MML.AUTO,
      mathsize: MML.INHERIT,
      mathbackground: MML.INHERIT,
      mathcolor: MML.INHERIT
    },
    autoDefault: function (name) {
      if (name === "mathvariant") {
        var mi = this.data[0].toString();
        return (mi.length === 1 || (mi.length === 2 && mi.charCodeAt(0) === this.PLANE1) ?
                  MML.VARIANT.ITALIC : MML.VARIANT.NORMAL)}
      return "";
    } 
  });
  
  MML.mn = MML.mbase.Subclass({
    type: "mn", isToken: TRUE,
    texClass: MML.TEXCLASS.ORD,
    defaults: {
      mathvariant: MML.INHERIT,
      mathsize: MML.INHERIT,
      mathbackground: MML.INHERIT,
      mathcolor: MML.INHERIT
    }
  });
  
  MML.mo = MML.mbase.Subclass({
    type: "mo", isToken: TRUE,
    defaults: {
      mathvariant: MML.INHERIT,
      mathsize: MML.INHERIT,
      mathbackground: MML.INHERIT,
      mathcolor: MML.INHERIT,
      form: MML.AUTO,
      fence: MML.AUTO,
      separator: MML.AUTO,
      lspace: MML.AUTO,
      rspace: MML.AUTO,
      stretchy: MML.AUTO,
      symmetric: MML.AUTO,
      maxsize: MML.AUTO,
      minsize: MML.AUTO,
      largeop: MML.AUTO,
      movablelimits: MML.AUTO,
      accent: MML.AUTO,
      linebreak: MML.AUTO,
      lineleading: MML.INHERIT,
      linebreakstyle: MML.AUTO,
      linebreakmultchar: MML.INHERIT,
      indentstyle: MML.INHERIT,
      indentoffset: MML.INHERIT,
      indenttarget: MML.INHERIT,
      indentstylefirst: MML.INHERIT,
      indentoffsetfirst: MML.INHERIT,
      indentstylelast: MML.INHERIT,
      indentoffsetlast: MML.INHERIT,
      texClass: MML.AUTO
    },
    defaultDef: {
      form: MML.FORM.INFIX,
      fence: FALSE,
      separator: FALSE,
      lspace: MML.LENGTH.THICKMATHSPACE,
      rspace: MML.LENGTH.THICKMATHSPACE,
      stretchy: FALSE,
      symmetric: TRUE,
      maxsize: MML.SIZE.INFINITY,
      minsize: '0em', //'1em',
      largeop: FALSE,
      movablelimits: FALSE,
      accent: FALSE,
      texClass: MML.TEXCLASS.ORD
    },
    autoDefault: function (name) {
      var def = this.def;
      if (!def) {
        var mo = this.data.join("");
        var forms = [this.getForm(),MML.FORM.INFIX,MML.FORM.POSTFIX,MML.FORM.PREFIX];
        for (var i = 0, m = forms.length; i < m; i++) {
          var data = this.OPTABLE[forms[i]][mo];
          if (data) {
            if (!data[2]) {data[2] = this.defaultDef.texClass}
            if (!data[3]) {data[3] = {}}
            def = {}; for (var id in data[3]) {if (data[3].hasOwnProperty(id)) {def[id] = data[3][id]}}
            def.lspace = this.SPACE[data[0]]; def.rspace = this.SPACE[data[1]];
            def.texClass = data[2];
            break;
          }
        }
        if (!def) {def = this.defaultDef} else {def.form = forms[0]}
        this.def = def;
      }
      if (def[name]) {return def[name]} else {return this.defaultDef[name]}
      return "";
    },
    getForm: function () {
      var i, parent = this.parent;
      if (parent && parent.type === "mrow" && parent.NonSpaceLength() !== 1) {
        if (parent.FirstNonSpace() === this) {return MML.FORM.PREFIX}
        if (parent.LastNonSpace() === this) {return MML.FORM.POSTFIX}
      }
      return MML.FORM.INFIX;
    },
    isEmbellished: function () {return TRUE},
    Core: function () {return this},
    setTeXclass: function (prev) {
      this.texClass = this.Get("texClass");
      if (prev) {this.prevClass = prev.texClass || MML.TEXCLASS.ORD; this.prevLevel = prev.Get("scriptlevel")}
        else {this.prevClass = MML.TEXCLASS.NONE}
      if (this.texClass === MML.TEXCLASS.BIN &&
            (this.prevClass == null ||
             this.prevClass === MML.TEXCLASS.BIN ||
             this.prevClass === MML.TEXCLASS.OP ||
             this.prevClass === MML.TEXCLASS.REL ||
             this.prevClass === MML.TEXCLASS.OPEN ||
             this.prevClass === MML.TEXCLASS.PUNCT)) {
        this.texClass = MML.TEXCLASS.ORD;
      } else if (this.prevClass === MML.TEXCLASS.BIN &&
                   (this.texClass === MML.TEXCLASS.REL ||
                    this.texClass === MML.TEXCLASS.CLOSE ||
                    this.texClass === MML.TEXCLASS.PUNCT)) {
        prev.texClass = this.prevClass = MML.TEXCLASS.ORD;
      }
      return this;
    }
  });
  
  MML.mtext = MML.mbase.Subclass({
    type: "mtext", isToken: TRUE,
    texClass: MML.TEXCLASS.ORD,
    defaults: {
      mathvariant: MML.INHERIT,
      mathsize: MML.INHERIT,
      mathbackground: MML.INHERIT,
      mathcolor: MML.INHERIT
    }
  });

  MML.mspace = MML.mbase.Subclass({
    type: "mspace", isToken: TRUE,
    isSpacelike: function () {return TRUE},
    defaults: {
      width: "0em",
      height: "0ex",
      depth: "0ex",
      linebreak: MML.LINEBREAK.AUTO
    }
  });

  MML.ms = MML.mbase.Subclass({
    type: "ms", isToken: TRUE,
    texClass: MML.TEXCLASS.ORD,
    defaults: {
      mathvariant: MML.INHERIT,
      mathsize: MML.INHERIT,
      mathbackground: MML.INHERIT,
      mathcolor: MML.INHERIT,
      lquote: "&quot;",
      rquote: "&quot;"
    }
  });

  MML.mglyph = MML.mbase.Subclass({
    type: "mglyph", isToken: TRUE,
    texClass: MML.TEXCLASS.ORD,
    defaults: {
      alt: "",
      src: "",
      width: MML.AUTO,
      height: MML.AUTO,
      valign: "0em"
    }
  });

  MML.mrow = MML.mbase.Subclass({
    type: "mrow",
    isSpacelike: MML.mbase.childrenSpacelike,
    inferred: FALSE,
    isEmbellished: function () {
      var isEmbellished = 0;
      for (var i = 0, m = this.data.length; i < m; i++) {
        if (this.data[i].isEmbellished()) {
          if (isEmbellished) {return FALSE}
          isEmbellished = TRUE; this.core = i;
        } else if (!this.data[i].isSpacelike()) {return FALSE}
      }
      return TRUE;
    },
    NonSpaceLength: function () {
      var n = 0;
      for (var i = 0, m = this.data.length; i < m; i++) {if (!this.data[i].isSpacelike()) {n++}}
      return n;
    },
    FirstNonSpace: function () {
      for (var i = 0, m = this.data.length; i < m; i++)
        {if (!this.data[i].isSpacelike()) {return this.data[i]}}
      return null;
    },
    LastNonSpace: function () {
      for (var i = this.data.length-1; i >= 0; i--)
        {if (!this.data[i].isSpacelike()) {return this.data[i]}}
      return null;
    },
    Core: function () {
      if (typeof(this.core) === "undefined" || !(this.isEmbellished())) {return null}
      return this.data[this.core];
    },
    toString: function () {
      if (this.inferred) {return '[' + this.data.join(',') + ']'}
      return this.SUPER(arguments).toString.call(this);
    },
    setTeXclass: MML.mbase.setRowTeXclasses
  });

  MML.mfrac = MML.mbase.Subclass({
    type: "mfrac", num: 0, den: 1,
    texClass: MML.TEXCLASS.INNER,
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    defaults: {
      linethickness: MML.LINETHICKNESS.MEDIUM,
      numalign: MML.ALIGN.CENTER,
      denomalign: MML.ALIGN.CENTER,
      bevelled: FALSE
    },
    adjustChild_displaystyle: function (n) {return FALSE},
    adjustChild_scriptlevel: function (n) {
      var level = this.Get("scriptlevel");
      if (!this.Get("displaystyle") || level > 0) {level++}
      return level;
    },
    adjustChild_texprimestyle: function (n) {
      if (n == this.den) {return true}
      return this.Get("texprimestyle");
    },
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.msqrt = MML.mbase.Subclass({
    type: "msqrt",
    inferRow: TRUE,
    texClass: MML.TEXCLASS.ORD,
    setTeXclass: MML.mbase.setSeparateTeXclasses,
    adjustChild_texprimestyle: function (n) {return TRUE}
  });

  MML.mroot = MML.mbase.Subclass({
    type: "mroot",
    texClass: MML.TEXCLASS.ORD,
    adjustChild_displaystyle: function (n) {
      if (n == 0) {return FALSE}
      return this.Get("displaystyle");
    },
    adjustChild_scriptlevel: function (n) {
      var level = this.Get("scriptlevel");
      if (n == 0) {level += 2}
      return level;
    },
    adjustChild_texprimestyle: function (n) {
      if (n === 1) {return TRUE};
      return this.Get("texprimestyle");
    },
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.mstyle = MML.mbase.Subclass({
    type: "mstyle",
    isSpacelike: MML.mbase.childrenSpacelike,
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    inferRow: TRUE,
    defaults: {
      scriptlevel: MML.INHERIT,
      displaystyle: MML.INHERIT,
      scriptsizemultiplier: Math.sqrt(1/2),
      scriptminsize: "8pt",
      mathbackground: MML.COLOR.TRANSPARENT,
      infixlinebreakstyle: MML.LINEBREAKSTYLE.BEFORE,
      decimalseparator: "."
    },
    adjustChild_scriptlevel: function (n) {
      var level = this.scriptlevel;
      if (level == null) {
        level = this.Get("scriptlevel");
      } else if (String(level).match(/^ *[-+]/)) {
        delete this.scriptlevel;
        var LEVEL = this.Get("scriptlevel");
        this.scriptlevel = level;
        level = LEVEL + parseInt(level);
      }
      return level;
    },
    noInherit: {
      mpadded: {width: TRUE, height: TRUE, depth: TRUE, lspace: TRUE, voffset: TRUE},
      mtable:  {width: TRUE, height: TRUE, depth: TRUE}
    },
    inheritFromMe: TRUE,
    setTeXclass: MML.mbase.setChildTeXclass
  });

  MML.merror = MML.mbase.Subclass({
    type: "merror",
    inferRow: TRUE,
    texClass: MML.TEXCLASS.ORD
  });

  MML.mpadded = MML.mbase.Subclass({
    type: "mpadded",
    inferRow: TRUE,
    isSpacelike: MML.mbase.childrenSpacelike,
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    defaults: {
      width: "",
      height: "",
      depth: "",
      lspace: 0,
      voffset: 0
    },
    setTeXclass: MML.mbase.setChildTeXclass
  });

  MML.mphantom = MML.mbase.Subclass({
    type: "mphantom",
    texClass: MML.TEXCLASS.ORD,
    inferRow: TRUE,
    isSpacelike: MML.mbase.childrenSpacelike,
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    setTeXclass: MML.mbase.setChildTeXclass
  });

  MML.mfenced = MML.mbase.Subclass({
    type: "mfenced",
    defaults: {
      open: '(',
      close: ')',
      separators: ','
    },
    texClass: MML.TEXCLASS.OPEN,
    setTeXclass: function (prev) {
      this.getPrevClass(prev);
      this.texClass = MML.TEXCLASS.OPEN;
      for (var i = 0, m = this.data.length; i < m; i++)
        {this.data[i].setTeXclass(this); this.texClass = MML.TEXCLASS.PUNCT}
      this.texClass = MML.TEXCLASS.CLOSE;
      return this;
    }
  });

  MML.menclose = MML.mbase.Subclass({
    type: "menclose",
    inferRow: TRUE,
    defaults: {
      notation: MML.NOTATION.LONGDIV,
      texClass: MML.TEXCLASS.ORD
    },
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.msubsup = MML.mbase.Subclass({
    type: "msubsup", base: 0, sub: 1, sup: 2,
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    defaults: {
      subscriptshift: MML.AUTO,
      superscriptshift: MML.AUTO,
      texClass: MML.AUTO
    },
    autoDefault: function (name) {
      if (name === "texClass") {
        var core = this.Core();
        if (core) {return core.Get(name)} else {return MML.TEXCLASS.ORD}
      }
      // compute this from size of children
      return 0;
    },
    adjustChild_displaystyle: function (n) {
      if (n > 0) {return FALSE}
      return this.Get("displaystyle");
    },
    adjustChild_scriptlevel: function (n) {
      var level = this.Get("scriptlevel");
      if (n > 0) {level++}
      return level;
    },
    adjustChild_texprimestyle: function (n) {
      if (n === this.sub) {return TRUE}
      return this.Get("texprimestyle");
    },
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });
  
  MML.munderover = MML.mbase.Subclass({
    type: "munderover", base: 0, under: 1, over: 2, sub: 1, sup: 2,
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    defaults: {
      accent: MML.AUTO,
      accentunder: MML.AUTO,
      align: MML.ALIGN.CENER,
      texClass: MML.AUTO
    },
    autoDefault: function (name) {
      if (name === "texClass") {
        if (this.isEmbellished()) {
          var core = this.Core();
          if (core) {return core.Get(name)}
        }
        return MML.TEXCLASS.ORD;
      }
      if (name === "accent") {return this.data[this.over].Get("accent")}
      if (name === "accentunder") {return this.data[this.under].Get("accent")}
      // determine accent type
      return FALSE;
    },
    adjustChild_displaystyle: function (n) {
      if (n > 0) {return FALSE}
      return this.Get("displaystyle");
    },
    adjustChild_scriptlevel: function (n) {
      var level = this.Get("scriptlevel");
      if (n == this.under && !this.Get("accentunder")) {level++}
      if (n == this.over  && !this.Get("accent")) {level++}
      return level;
    },
    adjustChild_texprimestyle: function (n) {
      if (n === this.base && this.data[this.over]) {return TRUE}
      return this.Get("texprimestyle");
    },
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.mmultiscripts = MML.mbase.Subclass({
    type: "mmultiscripts",
    isEmbellished: MML.mbase.childEmbellished,
    Core: MML.mbase.childCore,
    defaults: {
      subscriptshift: MML.AUTO,
      superscriptshift: MML.AUTO,
      texClass: MML.AUTO
    },
    autoDefault: function (name) {
      if (name === "texClass") {
        var core = this.Core();
        if (core) {return core.Get(name)} else {return MML.TEXCLASS.ORD}
      }
      // compute this from size of children
      return 0;
    },
    adjustChild_displaystyle: function (n) {
      if (n > 0) {return FALSE}
      return this.Get("displaystyle");
    },
    adjustChild_scriptlevel: function (n) {
      var level = this.Get("scriptlevel");
      if (n > 0) {level++}
      return level;
    },
    adjustChild_texprimestyle: function (n) {return (n === this.base && this.data[this.over])},
    setTeXclass: MML.mbase.setBaseTeXclasses
  });

  MML.mtable = MML.mbase.Subclass({
    type: "mtable",
    defaults: {
      align: MML.ALIGN.AXIS,
      rowalign: MML.ALIGN.BASELINE,
      columnalign: MML.ALIGN.CENTER,
      groupalign: "{left}",
      alignmentscope: TRUE,
      columnwidth: MML.WIDTH.AUTO,
      width: MML.WIDTH.AUTO,
      rowspacing: "1ex",
      columnspacing: ".8em",
      rowlines: MML.LINES.NONE,
      columnlines: MML.LINES.NONE,
      frame: MML.LINES.NONE,
      framespacing: "0.4em 0.5ex",
      equalrows: FALSE,
      equalcolumns: FALSE,
      displaystyle: FALSE,
      side: MML.SIDE.RIGHT,
      minlabelspacing: "0.8em",
      texClass: MML.TEXCLASS.ORD,
      useHeight: 1
    },
    inheritFromMe: TRUE,
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.mtr = MML.mbase.Subclass({
    type: "mtr",
    defaults: {
      rowalign: MML.INHERIT,
      columnalign: MML.INHERIT,
      groupalign: MML.INHERIT
    },
    inheritFromMe: TRUE,
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.mtd = MML.mbase.Subclass({
    type: "mtd",
    inferRow: TRUE,
    defaults: {
      rowspan: 1,
      columnspan: 1,
      rowalign: MML.INHERIT,
      columnalign: MML.INHERIT,
      groupalign: MML.INHERIT
    },
    setTeXclass: MML.mbase.setChildTeXclass
  });

  MML.maligngroup = MML.mbase.Subclass({
    type: "malign",
    isSpacelike: function () {return TRUE},
    defaults: {
      groupalign: MML.INHERIT
    },
    inheritFromMe: TRUE
  });

  MML.malignmark = MML.mbase.Subclass({
    type: "malignmark",
    defaults: {
      edge: MML.SIDE.LEFT
    },
    isSpacelike: function () {return TRUE}
  });

  MML.mlabeledtr = MML.mbase.Subclass({
    type: "mlabeledtr",
    defaults: {
      rowalign: MML.INHERIT,
      columnalign: MML.INHERIT,
      groupalign: MML.INHERIT
    },
    inheritFromMe: TRUE,
    setTeXclass: MML.mbase.setSeparateTeXclasses
  });

  MML.root = MML.mstyle.Subclass({
    type: "root",
    defaults: {
      mathvariant: MML.VARIANT.NORMAL,
      mathsize: MML.SIZE.NORMAL,
      mathcolor: "", // should be "black", but allow it to inherit from surrounding text
      mathbackground: MML.COLOR.TRANSPARENT,
      scriptlevel: 0,
      displaystyle: FALSE,
      scriptsizemultiplier: Math.sqrt(1/2),
      scriptminsize: "8pt",
      infixlinebreakstyle: MML.LINEBREAKSTYLE.BEFORE,
      decimalseparator: ".",
      texprimestyle: FALSE     // is it in TeX's C' style?
    },
    setTeXclass: MML.mbase.setChildTeXclass,
    toString: function () {return this.data.join(',')}
  });
  
  MML.chars = MML.mbase.Subclass({
    type: "chars",
    Append: function () {this.data.push.apply(this.data,arguments)},
    value: function () {return this.data.join("")},
    toString: function () {return this.data.join("")}
  });
  
  MML.entity = MML.mbase.Subclass({
    type: "entity",
    Append: function () {this.data.push.apply(this.data,arguments)},
    value: function () {
      if (this.data[0].substr(0,2) === "#x") {return parseInt(this.data[0].substr(2),16)}
      else if (this.data[0].substr(0,1) === "#") {return parseInt(this.data[0].substr(1))}
      else {return 0}  // FIXME: look up named entities from table
    },
    toString: function () {
      var n = this.value();
      if (n <= 0xFFFF) {return String.fromCharCode(n)}
      return this.PLANE1 + String.fromCharCode(n-0x1D400+0xDC00);
    }
  });
  
  MML.TeXAtom = MML.mbase.Subclass({
    type: "texatom",
    inferRow: TRUE,
    texClass: MML.TEXCLASS.ORD,
    setTeXclass: function (prev) {
      this.getPrevClass(prev);
      this.data[0].setTeXclass();
      return this;
    }
  });

  var TEXCLASS = MML.TEXCLASS;
  
  var FIXUNICODE = MML.FIXUNICODE = function (def) {
    var newdef = {};
    for (var id in def) {if (def.hasOwnProperty(id)) {
      var newid = id, match;
      while (match = newid.match(/&#x([A-F0-9]+);/i))
        {newid = newid.replace(match[0],String.fromCharCode(parseInt(match[1],16)))}
      newdef[newid] = def[id];
      if (!newdef[newid][2]) {newdef[newid][2] = TEXCLASS.ORD}
    }}
    return newdef;
  };
  
  MML.mo.Augment({
    SPACE: [
      '0em',
      '0.1111em',
      '0.1667em',
      '0.2222em',
      '0.2667em',
      '0.3333em'
    ],
    OPTABLE: {
      prefix: FIXUNICODE({
        '&#x2111;': [1,1],               // black-letter capital i (ℑ)
        '&#x2113;': [1,1],               // script small l (ℓ)
        '&#x211C;': [1,1],               // black-letter capital r (ℜ)
        '&#x2200;': [2,1],               // for all (∀)
        '&#x2202;': [2,1],               // partial differential (∂)
        '&#x2203;': [2,1],               // there exists (∃)
        '&#x2207;': [2,1],               // nabla (∇)
        '&#x220F;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary product (∏)
        '&#x2210;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary coproduct (∐)
        '&#x2211;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary summation (∑)
        '&#x221A;': [1,1,TEXCLASS.ORD,{stretchy: true}],  // square root (√)
        '&#x2220;': [0,0],               // angle (∠)
        '&#x222B;': [0,1,TEXCLASS.OP,{stretchy: true, largeop: true}],  // integral (∫)
        '&#x222E;': [0,1,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // contour integral (∮)
        '&#x22C0;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary logical and (⋀)
        '&#x22C1;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary logical or (⋁)
        '&#x22C2;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary intersection (⋂)
        '&#x22C3;': [1,2,TEXCLASS.OP,{stretchy: true, largeop: true, movablelimits: true}],  // n-ary union (⋃)
        '&#x2308;': [0,0,TEXCLASS.OPEN,{fence: true, stretchy: true}],  // left ceiling (⌈)
        '&#x230A;': [0,0,TEXCLASS.OPEN,{fence: true, stretchy: true}],  // left floor (⌊)
        '&#x27E8;': [0,0,TEXCLASS.OPEN,{fence: true, stretchy: true}],  // mathematical left angle bracket (⟨)
        '&#x2A00;': [1,2,TEXCLASS.OP,{largeop: true, movablelimits: true}],  // n-ary circled dot operator (⨀)
        '&#x2A01;': [1,2,TEXCLASS.OP,{largeop: true, movablelimits: true}],  // n-ary circled plus operator (⨁)
        '&#x2A02;': [1,2,TEXCLASS.OP,{largeop: true, movablelimits: true}],  // n-ary circled times operator (⨂)
        '&#x2A04;': [1,2,TEXCLASS.OP,{largeop: true, movablelimits: true}],  // n-ary union operator with plus (⨄)
        '&#x2A06;': [1,2,TEXCLASS.OP,{largeop: true, movablelimits: true}],  // n-ary square union operator (⨆)
        '&#x3C3;': [1,1],                // greek small letter sigma (σ)
        '&#xAC;': [2,1],                 // not sign (¬)
        '(': [0,0,TEXCLASS.OPEN,{fence: true, stretchy: true}],  // left parenthesis (()
        '[': [0,0,TEXCLASS.OPEN,{fence: true, stretchy: true}],  // left square bracket ([)
        '{': [0,0,TEXCLASS.OPEN,{fence: true, stretchy: true}]   // left curly bracket ({)
      }),
      postfix: FIXUNICODE({
        '!': [1,0,TEXCLASS.CLOSE],       // exclamation mark (!)
        '&': [0,0],                      // ampersand (&)
        '&#x2032;': [0,2],               // prime (′)
        '&#x2309;': [0,0,TEXCLASS.CLOSE,{fence: true, stretchy: true}],  // right ceiling (⌉)
        '&#x230B;': [0,0,TEXCLASS.CLOSE,{fence: true, stretchy: true}],  // right floor (⌋)
        '&#x23DE;': [0,0,TEXCLASS.ORD,{stretchy: true, accent: true}],  // top curly bracket (⏞)
        '&#x23DF;': [0,0,TEXCLASS.ORD,{stretchy: true, accent: true}],  // bottom curly bracket (⏟)
        '&#x266D;': [0,2],               // music flat sign (♭)
        '&#x266E;': [0,2],               // music natural sign (♮)
        '&#x266F;': [0,2],               // music sharp sign (♯)
        '&#x27E9;': [0,0,TEXCLASS.CLOSE,{fence: true, stretchy: true}],  // mathematical right angle bracket (⟩)
        '&#x2C6;': [0,0,TEXCLASS.ORD,{stretchy: true, accent: true}],  // modifier letter circumflex accent (ˆ)
        '&#x2C7;': [0,0,TEXCLASS.ORD,{stretchy: true, accent: true}],  // caron (ˇ)
        '&#x2D8;': [0,0,TEXCLASS.ORD,{accent: true}],  // breve (˘)
        '&#x2D9;': [0,0,TEXCLASS.ORD,{accent: true}],  // dot above (˙)
        '&#x2DC;': [0,0,TEXCLASS.ORD,{stretchy: true, accent: true}],  // small tilde (˜)
        '&#x302;': [0,0,TEXCLASS.ORD,{accent: true}],  // combining circumflex accent (̂)
        '&#xA8;': [0,0,TEXCLASS.ORD,{accent: true}],  // diaeresis (¨)
        ')': [0,0,TEXCLASS.CLOSE,{fence: true, stretchy: true}],  // right parenthesis ())
        ']': [0,0,TEXCLASS.CLOSE,{fence: true, stretchy: true}],  // right square bracket (])
        '}': [0,0,TEXCLASS.CLOSE,{fence: true, stretchy: true}]   // right curly bracket (})
      }),
      infix: FIXUNICODE({
        '%': [3,3],                      // percent sign (%)
        '&#x2026;': [0,0,TEXCLASS.INNER], // horizontal ellipsis (…)
        '&#x2190;': [5,5,TEXCLASS.REL,{stretchy: true, accent: true}],  // leftwards arrow (←)
        '&#x2191;': [5,5,TEXCLASS.REL,{stretchy: true}],  // upwards arrow (↑)
        '&#x2192;': [5,5,TEXCLASS.REL,{stretchy: true, accent: true}],  // rightwards arrow (→)
        '&#x2193;': [5,5,TEXCLASS.REL,{stretchy: true}],  // downwards arrow (↓)
        '&#x2194;': [5,5,TEXCLASS.REL,{stretchy: true, accent: true}],  // left right arrow (↔)
        '&#x2195;': [5,5,TEXCLASS.REL,{stretchy: true}],  // up down arrow (↕)
        '&#x2196;': [5,5,TEXCLASS.REL,{stretchy: true}],  // north west arrow (↖)
        '&#x2197;': [5,5,TEXCLASS.REL,{stretchy: true}],  // north east arrow (↗)
        '&#x2198;': [5,5,TEXCLASS.REL,{stretchy: true}],  // south east arrow (↘)
        '&#x2199;': [5,5,TEXCLASS.REL,{stretchy: true}],  // south west arrow (↙)
        '&#x21A6;': [5,5,TEXCLASS.REL,{stretchy: true}],  // rightwards arrow from bar (↦)
        '&#x21A9;': [5,5,TEXCLASS.REL],  // leftwards arrow with hook (↩)
        '&#x21AA;': [5,5,TEXCLASS.REL],  // rightwards arrow with hook (↪)
        '&#x21BC;': [5,5,TEXCLASS.REL,{stretchy: true, accent: true}],  // leftwards harpoon with barb upwards (↼)
        '&#x21BD;': [5,5,TEXCLASS.REL,{stretchy: true}],  // leftwards harpoon with barb downwards (↽)
        '&#x21C0;': [5,5,TEXCLASS.REL,{stretchy: true, accent: true}],  // rightwards harpoon with barb upwards (⇀)
        '&#x21C1;': [5,5,TEXCLASS.REL,{stretchy: true}],  // rightwards harpoon with barb downwards (⇁)
        '&#x21CC;': [5,5,TEXCLASS.REL,{stretchy: true}],  // rightwards harpoon over leftwards harpoon (⇌)
        '&#x21D0;': [5,5,TEXCLASS.REL,{stretchy: true}],  // leftwards double arrow (⇐)
        '&#x21D1;': [5,5,TEXCLASS.REL,{stretchy: true}],  // upwards double arrow (⇑)
        '&#x21D2;': [5,5,TEXCLASS.REL,{stretchy: true}],  // rightwards double arrow (⇒)
        '&#x21D3;': [5,5,TEXCLASS.REL,{stretchy: true}],  // downwards double arrow (⇓)
        '&#x21D4;': [5,5,TEXCLASS.REL,{stretchy: true}],  // left right double arrow (⇔)
        '&#x21D5;': [5,5,TEXCLASS.REL,{stretchy: true}],  // up down double arrow (⇕)
        '&#x2208;': [5,5,TEXCLASS.REL],  // element of (∈)
        '&#x2209;': [5,5,TEXCLASS.REL],  // not an element of (∉)
        '&#x220B;': [5,5,TEXCLASS.REL],  // contains as member (∋)
        '&#x2212;': [4,4,TEXCLASS.BIN],  // minus sign (−)
        '&#x2213;': [4,4,TEXCLASS.BIN],  // minus-or-plus sign (∓)
        '&#x2215;': [4,4,TEXCLASS.BIN],  // division slash (∕)
        '&#x2216;': [4,4,TEXCLASS.BIN,{stretchy: true}],  // set minus (∖)
        '&#x2217;': [4,4,TEXCLASS.BIN],  // asterisk operator (∗)
        '&#x2218;': [4,4,TEXCLASS.BIN],  // ring operator (∘)
        '&#x2219;': [4,4,TEXCLASS.BIN],  // bullet operator (∙)
        '&#x221D;': [5,5,TEXCLASS.REL],  // proportional to (∝)
        '&#x2223;': [5,5,TEXCLASS.REL],  // divides (∣)
        '&#x2225;': [5,5,TEXCLASS.REL],  // parallel to (∥)
        '&#x2227;': [4,4,TEXCLASS.BIN],  // logical and (∧)
        '&#x2228;': [4,4,TEXCLASS.BIN],  // logical or (∨)
        '&#x2229;': [4,4,TEXCLASS.BIN],  // intersection (∩)
        '&#x222A;': [4,4,TEXCLASS.BIN],  // union (∪)
        '&#x223C;': [5,5,TEXCLASS.REL],  // tilde operator (∼)
        '&#x2240;': [4,4,TEXCLASS.BIN],  // wreath product (≀)
        '&#x2243;': [5,5,TEXCLASS.REL],  // asymptotically equal to (≃)
        '&#x2245;': [5,5,TEXCLASS.REL],  // approximately equal to (≅)
        '&#x2248;': [5,5,TEXCLASS.REL],  // almost equal to (≈)
        '&#x224D;': [5,5,TEXCLASS.REL],  // equivalent to (≍)
        '&#x2250;': [5,5,TEXCLASS.REL],  // approaches the limit (≐)
        '&#x2260;': [5,5,TEXCLASS.REL],  // not equal to (≠)
        '&#x2261;': [5,5,TEXCLASS.REL],  // identical to (≡)
        '&#x2264;': [5,5,TEXCLASS.REL],  // less-than or equal to (≤)
        '&#x2265;': [5,5,TEXCLASS.REL],  // greater-than or equal to (≥)
        '&#x226A;': [5,5,TEXCLASS.REL],  // much less-than (≪)
        '&#x226B;': [5,5,TEXCLASS.REL],  // much greater-than (≫)
        '&#x227A;': [5,5,TEXCLASS.REL],  // precedes (≺)
        '&#x227B;': [5,5,TEXCLASS.REL],  // succeeds (≻)
        '&#x2282;': [5,5,TEXCLASS.REL],  // subset of (⊂)
        '&#x2283;': [5,5,TEXCLASS.REL],  // superset of (⊃)
        '&#x2286;': [5,5,TEXCLASS.REL],  // subset of or equal to (⊆)
        '&#x2287;': [5,5,TEXCLASS.REL],  // superset of or equal to (⊇)
        '&#x228E;': [4,4,TEXCLASS.BIN,{stretchy: true}],  // multiset union (⊎)
        '&#x2291;': [5,5,TEXCLASS.REL],  // square image of or equal to (⊑)
        '&#x2292;': [5,5,TEXCLASS.REL],  // square original of or equal to (⊒)
        '&#x2293;': [4,4,TEXCLASS.BIN,{stretchy: true}],  // square cap (⊓)
        '&#x2294;': [4,4,TEXCLASS.BIN,{stretchy: true}],  // square cup (⊔)
        '&#x2295;': [4,4,TEXCLASS.BIN,{largeop: true, movablelimits: true}],  // circled plus (⊕)
        '&#x2296;': [4,4,TEXCLASS.BIN,{largeop: true, movablelimits: true}],  // circled minus (⊖)
        '&#x2297;': [4,4,TEXCLASS.BIN,{largeop: true, movablelimits: true}],  // circled times (⊗)
        '&#x2298;': [4,4,TEXCLASS.BIN,{largeop: true, movablelimits: true}],  // circled division slash (⊘)
        '&#x2299;': [4,4,TEXCLASS.BIN,{largeop: true, movablelimits: true}],  // circled dot operator (⊙)
        '&#x22A2;': [5,5,TEXCLASS.REL],  // right tack (⊢)
        '&#x22A3;': [5,5,TEXCLASS.REL],  // left tack (⊣)
        '&#x22A4;': [5,5],               // down tack (⊤)
        '&#x22A5;': [5,5,TEXCLASS.REL],  // up tack (⊥)
        '&#x22A8;': [5,5,TEXCLASS.REL],  // true (⊨)
        '&#x22C4;': [4,4,TEXCLASS.BIN],  // diamond operator (⋄)
        '&#x22C5;': [4,4,TEXCLASS.PUNCT], // dot operator (⋅)
        '&#x22C6;': [4,4,TEXCLASS.BIN],  // star operator (⋆)
        '&#x22C8;': [5,5,TEXCLASS.REL],  // bowtie (⋈)
        '&#x22EE;': [5,5],               // vertical ellipsis (⋮)
        '&#x22EF;': [0,0,TEXCLASS.INNER], // midline horizontal ellipsis (⋯)
        '&#x22F1;': [5,5,TEXCLASS.INNER], // down right diagonal ellipsis (⋱)
        '&#x25B3;': [4,4,TEXCLASS.BIN],  // white up-pointing triangle (△)
        '&#x25B9;': [4,4,TEXCLASS.BIN],  // white right-pointing small triangle (▹)
        '&#x25BD;': [4,4,TEXCLASS.BIN],  // white down-pointing triangle (▽)
        '&#x25C3;': [4,4,TEXCLASS.BIN],  // white left-pointing small triangle (◃)
        '&#x27F5;': [1,1,TEXCLASS.REL,{stretchy: true}],  // long leftwards arrow (⟵)
        '&#x27F6;': [1,1,TEXCLASS.REL,{stretchy: true}],  // long rightwards arrow (⟶)
        '&#x27F7;': [1,1,TEXCLASS.REL,{stretchy: true}],  // long left right arrow (⟷)
        '&#x27F8;': [1,1,TEXCLASS.REL,{stretchy: true}],  // long leftwards double arrow (⟸)
        '&#x27F9;': [1,1,TEXCLASS.REL,{stretchy: true}],  // long rightwards double arrow (⟹)
        '&#x27FA;': [1,1,TEXCLASS.REL,{stretchy: true}],  // long left right double arrow (⟺)
        '&#x2A3F;': [4,4,TEXCLASS.BIN],  // amalgamation or coproduct (⨿)
        '&#x2AAF;': [5,5,TEXCLASS.REL],  // precedes above single-line equals sign (⪯)
        '&#x2AB0;': [5,5,TEXCLASS.REL],  // succeeds above single-line equals sign (⪰)
        '&#xB1;': [4,4,TEXCLASS.BIN],    // plus-minus sign (±)
        '&#xD7;': [4,4,TEXCLASS.BIN],    // multiplication sign (×)
        '&#xF7;': [4,4,TEXCLASS.BIN],    // division sign (÷)
        '*': [3,3,TEXCLASS.BIN],         // asterisk (*)
        '+': [4,4,TEXCLASS.BIN],         // plus sign (+)
        ',': [0,3,TEXCLASS.PUNCT,{separator: true}],  // comma (,)
        '-': [4,4,TEXCLASS.BIN],         // hyphen-minus (-)
        '.': [3,3],                      // full stop (.)
        '/': [1,1,TEXCLASS.ORD,{stretchy: true}],  // solidus (/)
        ':': [1,2,TEXCLASS.REL],         // colon (:)
        ';': [0,3,TEXCLASS.PUNCT,{separator: true}],  // semicolon (;)
        '<': [5,5,TEXCLASS.REL],         // less-than sign (<)
        '=': [5,5,TEXCLASS.REL],         // equals sign (=)
        '>': [5,5,TEXCLASS.REL],         // greater-than sign (>)
        '?': [1,1,TEXCLASS.CLOSE],       // question mark (?)
        '\\': [,],                       //  ()
        '_': [1,1],                      // low line (_)
        '|': [2,2,TEXCLASS.ORD,{fence: true, stretchy: true}],  // vertical line (|)
        '#': [0,0],                      // #
        '$': [0,0],                      // $
        '&#x0131;': [0,0],               // imath
        '&#x0237;': [0,0],               // jmath
        '&#x02C9;': [0,0],               // bar
        '&#x02CA;': [0,0],               // acute
        '&#x02CB;': [0,0],               // grave
        '&#x0300;': [0,0],               // grave
        '&#x0301;': [0,0],               // acute
        '&#x0303;': [0,0],               // tilde
        '&#x0304;': [0,0],               // bar
        '&#x0306;': [0,0],               // breve
        '&#x0307;': [0,0],               // dot
        '&#x0308;': [0,0],               // ddot
        '&#x030C;': [0,0],               // check
        '&#x0338;': [4,4,TEXCLASS.REL],  // not
        '&#x0393;': [0,0],               // Gamma
        '&#x0394;': [0,0],               // Delta
        '&#x0398;': [0,0],               // Theta
        '&#x039B;': [0,0],               // Lambda
        '&#x039E;': [0,0],               // Xi
        '&#x03A0;': [0,0],               // Pi
        '&#x03A3;': [0,0],               // Sigma
        '&#x03A5;': [0,0],               // Upsilon
        '&#x03A6;': [0,0],               // Phi
        '&#x03A8;': [0,0],               // Psi
        '&#x03A9;': [0,0],               // Omega
        '&#x03B1;': [0,0],               // alpha
        '&#x03B2;': [0,0],               // beta
        '&#x03B3;': [0,0],               // gamma
        '&#x03B4;': [0,0],               // delta
        '&#x03B5;': [0,0],               // varepsilon
        '&#x03B6;': [0,0],               // zeta
        '&#x03B7;': [0,0],               // eta
        '&#x03B8;': [0,0],               // theta
        '&#x03B9;': [0,0],               // iota
        '&#x03BA;': [0,0],               // kappa
        '&#x03BB;': [0,0],               // lambda
        '&#x03BC;': [0,0],               // mu
        '&#x03BD;': [0,0],               // nu
        '&#x03BE;': [0,0],               // xi
        '&#x03BF;': [0,0],               // omicron
        '&#x03C0;': [0,0],               // pi
        '&#x03C1;': [0,0],               // rho
        '&#x03C2;': [0,0],               // varsigma
        '&#x03C4;': [0,0],               // tau
        '&#x03C5;': [0,0],               // upsilon
        '&#x03C6;': [0,0],               // varphi
        '&#x03C7;': [0,0],               // chi
        '&#x03C8;': [0,0],               // psi
        '&#x03C9;': [0,0],               // omega
        '&#x03D1;': [0,0],               // vartheta
        '&#x03D5;': [0,0],               // phi
        '&#x03D6;': [0,0],               // varpi
        '&#x03F1;': [0,0],               // varrho
        '&#x2020;': [3,3,TEXCLASS.BIN],  // dagger
        '&#x2021;': [3,3,TEXCLASS.BIN],  // ddagger
        '&#x20D7;': [0,0],               // vec
        '&#x210F;': [0,0],               // hbar
        '&#x2118;': [0,0],               // wp
        '&#x2135;': [0,0],               // aleph
        '&#x2205;': [0,0],               // emptyset
        '&#x221E;': [0,0],               // infty
        '&#x2322;': [4,4,TEXCLASS.REL],  // frown
        '&#x2323;': [4,4,TEXCLASS.REL],  // smile
        '&#x23AA;': [0,0],               // bracevert
        '&#x23AF;': [0,0],               // underline
        '&#x23B0;': [2,1,TEXCLASS.OPEN], // lmoustache
        '&#x23B1;': [1,2,TEXCLASS.CLOSE], // rmoustache
        '&#x25EF;': [3,3,TEXCLASS.BIN],  // bigcirc
        '&#x2660;': [0,0],               // spadesuit
        '&#x2661;': [0,0],               // heartsuit
        '&#x2662;': [0,0],               // diamondsuit
        '&#x2663;': [0,0],               // clubsuit
        '&#x27EE;': [2,1,TEXCLASS.OPEN], // lgroup
        '&#x27EF;': [1,2,TEXCLASS.CLOSE], // rgrtoup
        '&#x27FC;': [4,4,TEXCLASS.REL]   // longmapsto
      })
    }
  });
  
})(MathJax.ElementJax.mml);

MathJax.ElementJax.mml.loadComplete("jax.js");
