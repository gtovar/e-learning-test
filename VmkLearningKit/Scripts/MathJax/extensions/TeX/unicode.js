/*************************************************************
 *
 *  MathJax/extensions/TeX/unicode.js
 *  
 *  Implements the \unicode extension to TeX to allow arbitrary unicode
 *  code points from being entered into the TeX file.  You can specify
 *  the height and depth of the character (the width is determined by
 *  the browser), and the default font from which to take the character.
 *  
 *  Examples:
 *      \unicode{65}                        % the character 'A'
 *      \unicode{x41}                       % the character 'A'
 *      \unicode[.55,0.05]{x22D6}           % less-than with dot, with height .7 and depth 0
 *      \unicode[.55,0.05][Geramond]{x22D6} % same taken from Geramond font
 *
 *  Once a size and font are provided for a given conde point, they need
 *  not be specified again in subsequent \unicode calls for that character.
 *  Note that a font list can be given, but Internet Explorer has a buggy
 *  implementation of font-family where it only looks in the first
 *  available font and if the glyph is not in that, it does not look at
 *  later fonts, but goes directly to the default font as set in the
 *  Internet-Options/Font panel.  For this reason, the default font list is
 *  "STIXGeneral,'Arial Unicode MS'", so if the user has STIX fonts, the
 *  symbol will be taken from that (almost all the symbols are in
 *  STIXGeneral), otherwise Arial Unicode MS is tried.
 *  
 *  To configure the default font list, use
 *  
 *      MathJax.Hub.Configure({
 *        TeX: {
 *          unicode: {
 *            fonts: "STIXGeneral,'Arial Unicode MS'"
 *          }
 *        }
 *      });
 *
 *  The result of \unicode will have TeX class ORD (e.g., it will act like a
 *  variable).  Use \mathbin, \mathrel, etc, to specify a different class.
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

//
//  The configuration defaults, augmented by the user settings
//  
MathJax.Extension["TeX/unicode"] = {
  unicode: {},
  config: MathJax.Hub.Insert({
    fonts: "STIXGeneral,'Arial Unicode MS'"
  },((MathJax.Hub.config.TeX||{}).unicode||{}))
};
  
MathJax.Hub.Register.StartupHook("HTML-CSS Jax Ready",function () {
  var TEX = MathJax.InputJax.TeX;
  var MML = MathJax.ElementJax.mml;
  var HTMLCSS = MathJax.OutputJax["HTML-CSS"];
  var FONTS = MathJax.Extension["TeX/unicode"].config.fonts;
  var UNICODE = MathJax.Extension["TeX/unicode"].unicode;
  
  TEX.Definitions.macros.unicode = 'Unicode';
  TEX.Parse.Augment({
    Unicode: function(name) {
      var HD = this.GetBrackets("\\"+name);
      var font = this.GetBrackets("\\"+name);
      var n = this.trimSpaces(this.GetArgument("\\"+name));
      if (HD) {
        HD = HD.replace(/ /g,"");
        if (!HD.match(/^(\d+(\.\d*)?|\.\d+),(\d+(\.\d*)?|\.\d+)$/))
          {TEX.Error("First bracketed argument for \\"+name+" must be of the form [h,d]")}
        HD = HD.split(',');
        var N = parseInt(n.match(/^x/) ? "0"+n : n);
        UNICODE[N] = [Math.floor(HD[0]*1000),Math.floor(HD[1]*1000),500,0,500,{isUnknown:true}];
        if (font) {UNICODE[N][5].font = font+","+FONTS}
      }
      var def = (this.stack.env.font ? {mathvariant: this.stack.env.font}: {});
      this.Push(MML.mtext(MML.entity("#"+n)).With(def));
    }
  });
    
  //
  // Override lookupChar routine so that error messages
  //   don't have the clipping and other unneeded overhead
  //
  var save_lookupChar = HTMLCSS.lookupChar;
  HTMLCSS.Augment({
    lookupChar: function (variant,n) {
      var font = save_lookupChar.call(this,variant,n);
      if (font[n][5] && font[n][5].isUnknown) {
        font.family = FONTS;
        if (variant.fonts[0]) {
          if (variant.fonts[0].match(/-italic/)) {font.style = "italic"}
          if (variant.fonts[0].match(/-bold/))   {font.weight = "bold"}
        }
        if (UNICODE[n]) {
          font[n] = UNICODE[n];
          if (UNICODE[n][5].font) {font.family = UNICODE[n][5].font}
        }
      }
      return font;
    }
  });
    
  MathJax.Hub.Startup.signal.Post("TeX unicode Ready");
  
});

MathJax.Ajax.loadComplete("[MathJax]/extensions/TeX/unicode.js");
