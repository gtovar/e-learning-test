/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/font/STIX/fontdata.js
 *  
 *  Initializes the HTML-CSS OutputJax to use the STIX fonts
 *  for displaying mathematics.
 *
 *  ---------------------------------------------------------------------
 *  
 *  Copyright (c) 2009 Design Science, Inc.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

(function (HTMLCSS,TEX) {
  
  TEX.isSTIX = true;
  HTMLCSS.allowWebFonts = false;

  HTMLCSS.Augment({
    FONTDATA: {
      TeX_factor: 1.125,    // TeX em's to STIX em's seem to need this
      baselineskip: 1.2,
      lineH: .8, lineD: .2,

      FONTS: {
        "STIXGeneral":                "General/Regular/Main.js",
        "STIXGeneral-italic":         "General/Italic/Main.js",
        "STIXGeneral-bold":           "General/Bold/Main.js",
        "STIXGeneral-bold-italic":    "General/BoldItalic/Main.js",
        "STIXNonUnicode":             "NonUnicode/Regular/Main.js",
        "STIXNonUnicode-italic":      "NonUnicode/Italic/Main.js",
        "STIXNonUnicode-bold":        "NonUnicode/Bold/Main.js",
        "STIXNonUnicode-bold-italic": "NonUnicode/BoldItalic/Main.js",
        "STIXVariants":               "Variants/Regular/All.js",
        "STIXSizeOneSym":             "SizeOneSym/Regular/All.js",
        "STIXSizeTwoSym":             "SizeTwoSym/Regular/All.js",
        "STIXSizeThreeSym":           "SizeThreeSym/Regular/All.js",
        "STIXSizeFourSym":            "SizeFourSym/Regular/All.js",
        "STIXSizeFiveSym":            "SizeFiveSym/Regular/All.js",
        "STIXIntegralsD":             "IntegralsD/Regular/All.js"
      },
      
      DEFAULTFAMILY: "STIXGeneral", DEFAULTWEIGHT: "normal", DEFAULTSTYLE: "normal",

      VARIANT: {
        "normal": {fonts: ["STIXGeneral","STIXNonUnicode","STIXSizeOneSym"]},
        "bold":   {fonts: ["STIXGeneral-bold","STIXNonUnicode-bold","STIXSizeOneSym-bold"]},
        "italic": {fonts: ["STIXGeneral-italic","STIXNonUnicode-italic","STIXGeneral","STIXNonUnicode","STIXSizeOneSym"]},
        "bold-italic": {fonts: ["STIXGeneral-bold-italic","STIXNonUnicode-bold-italic"]},
        "double-struck": {offsetA: 0x1D538, offsetN: 0x1D7D8,
                           remap: {0x1D53A: 0x2102, 0x1D53F: 0x210D, 0x1D545: 0x2115, 0x1D547: 0x2119,
                                   0x1D548: 0x211A, 0x1D549: 0x211D, 0x1D551: 0x2124}},
        "fraktur": {offsetA: 0x1D504,
                    remap: {0x1D506: 0x212D, 0x1D50B: 0x210C, 0x1D50C: 0x2111, 0x1D515: 0x211C, 0x1D51D: 0x2128}},
        "bold-fraktur": {fonts: ["STIXGeneral-bold"], offsetA: 0x1D56C},
        "script": {fonts: ["STIXGeneral-italic"], offsetA: 0x1D49C,
                   remap: {0x1D49D: 0x212C, 0x1D4A0: 0x2130, 0x1D4A1: 0x2131, 0x1D4A3: 0x210B,
                           0x1D4A4: 0x2110, 0x1D4A7: 0x2112, 0x1D4A8: 0x2133, 0x1D4AD: 0x211B,
                           0x1D4BA: 0x212F, 0x1D4BC: 0x210A, 0x1D4C4: 0x2134}},
        "bold-script": {fonts: ["STIXGeneral-italic"], offsetA: 0x1D4D0},
        "sans-serif": {offsetA: 0x1D5A0, offsetN: 0x1D7E2, offsetG: 0xE17D},
        "bold-sans-serif": {offsetA: 0x1D5D4, offsetG: 0x1D756, offsetN: 0x1D7EC},
        "sans-serif-italic": {fonts: ["STIXGeneral-italic"], offsetA: 0x1D608, offsetN: 0xE1B4, offsetG: 0xE1BF},
        "sans-serif-bold-italic": {fonts: ["STIXGeneral-bold-italic"], offsetA: 0x1D63C, offsetN: 0xE1F6, offsetG: 0x1D790},
        "monospace": {offsetA: 0x1D670, offsetN: 0x1D7F6},
        "-STIX-variant": {fonts:["STIXVariants","STIXNonUnicode","STIXGeneral"]},
        "-tex-caligraphic": {fonts: ["STIXGeneral-italic","STIXNonUnicode-italic","STIXNonUnicode","STIXSizeOneSym"], offsetA: 0xE22D, noLowerCase: 1},
        "-tex-oldstyle": {offsetN: 0xE261,
                          remap: {0xE262: 0xE265, 0xE263: 0xE269, 0xE264: 0xE26D, 0xE265: 0xE271,
                                  0xE266: 0xE275, 0xE267: 0xE279, 0xE268: 0xE27D, 0xE269: 0xE281,
                                  0xE26A: 0xE285}},
        "-largeOp": {fonts:["STIXSizeOneSym","STIXIntegralsD","STIXNonUnicode","STIXGeneral"]},
        "-smallOp": {}
      },
      
      RANGES: [
        {name: "alpha", low: 0x61, high: 0x7A, offset: "A", add: 26},
        {name: "Alpha", low: 0x41, high: 0x5A, offset: "A"},
        {name: "number", low: 0x30, high: 0x39, offset: "N"},
        {name: "greek", low: 0x03B1, high: 0x03C9, offset: "G", add: 25},
        {name: "Greek", low: 0x0391, high: 0x03F6, offset: "G",
           remap: {0x03F5: 53, 0x03D1: 54, 0x03F0: 55, 0x03D5: 56, 0x03F1: 57, 0x03D6: 58, 0x03F4: 17}}
      ],
      
      RULECHAR: 0x203E,
      
      DELIMITERS: {
        0x0028: // (
         [[.844,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x239B,"STIXSizeOneSym"], ext: [0x239C,"STIXSizeOneSym"], bot: [0x239D,"STIXSizeOneSym"], direction:"Vertical"}],
        0x0029: // )
         [[.844,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x239E,"STIXSizeOneSym"], ext: [0x239F,"STIXSizeOneSym"], bot: [0x23A0,"STIXSizeOneSym"], direction:"Vertical"}],
        0x002F: // /
         [[.690,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],{stop:1, direction:"Vertical"}],
        0x005B: // [
         [[.818,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x23A1,"STIXSizeOneSym"], ext: [0x23A2,"STIXSizeOneSym"], bot: [0x23A3,"STIXSizeOneSym"], direction:"Vertical"}],
        0x005C: // \
         [[.690,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],{stop:1, direction:"Vertical"}],
        0x005D: // ]
         [[.818,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x23A4,"STIXSizeOneSym"], ext: [0x23A5,"STIXSizeOneSym"], bot: [0x23A6,"STIXSizeOneSym"], direction:"Vertical"}],
        0x007B: // {
         [[.861,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x23A7,"STIXSizeOneSym"], mid:[0x23A8,"STIXSizeOneSym"], bot: [0x23A9,"STIXSizeOneSym"], ext: [0x23AA,"STIXSizeOneSym"], direction:"Vertical"}],
        0x007D: // }
         [[.861,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x23AB,"STIXSizeOneSym"], mid:[0x23AC,"STIXSizeOneSym"], bot: [0x23AD,"STIXSizeOneSym"], ext: [0x23AA,"STIXSizeOneSym"], direction:"Vertical"}],
        0x0302: // wide hat
         [[.405,"STIXGeneral"],[.560,"STIXSizeOneSym"],[.979,"STIXSizeTwoSym"],[1.46,"STIXSizeThreeSym"],[1.886,"STIXSizeFourSym"],[2.328,"STIXSizeFiveSym"],{stop:1, direction:"Horizontal"}],
        0x0303: // wide tilde
         [[.415,"STIXGeneral"],[.558,"STIXSizeOneSym"],[.978,"STIXSizeTwoSym"],[1.458,"STIXSizeThreeSym"],[1.886,"STIXSizeFourSym"],[2.328,"STIXSizeFiveSym"],{stop:1, direction:"Horizontal"}],
        0x203E: // horizontal line
         [[.5,"STIXGeneral"],{rep:[0x203E,"STIXGeneral"], direction:"Horizontal"}],
        0x2190: // left arrow
         [[.926,"STIXGeneral"],{left:[0x2190,"STIXGeneral"],rep:[0x2212,"STIXGeneral"],direction:"Horizontal"}],
        0x2191: // \uparrow
         [[.818,"STIXGeneral"],{top:[0x2191,"STIXGeneral"], ext:[0x23D0,"STIXGeneral"],direction:"Vertical"}],
        0x2192: // right arrow
         [[.926,"STIXGeneral"],{rep:[0x2212,"STIXGeneral"],right:[0x2192,"STIXGeneral"],direction:"Horizontal"}],
        0x2193: // \downarrow
         [[.818,"STIXGeneral"],{ext:[0x23D0,"STIXGeneral"],bot:[0x2193,"STIXGeneral"],direction:"Vertical"}],
        0x2194: // left-right arrow
         [[.926,"STIXGeneral"],{left:[0x2190,"STIXGeneral"],rep:[0x2212,"STIXGeneral"],right:[0x2192,"STIXGeneral"],direction:"Horizontal"}],
        0x2195: // \updownarrow
         [[.818,"STIXGeneral"],{top:[0x2191,"STIXGeneral"], ext:[0x23D0,"STIXGeneral"],bot:[0x2193,"STIXGeneral"],direction:"Vertical"}],
        0x21D1: // \Uparrow
         [[.818,"STIXGeneral"],{top:[0x21D1,"STIXGeneral"], ext:[0x2225,"STIXGeneral",.1],direction:"Vertical"}],
        0x21D3: // \Downarrow
         [[.818,"STIXGeneral"],{ext:[0x2225,"STIXGeneral",.1],bot:[0x21D3,"STIXGeneral"],direction:"Vertical"}],
        0x21D5: // \Updownarrow
         [[.818,"STIXGeneral"],{top:[0x21D1,"STIXGeneral"], ext:[0x2225,"STIXGeneral",.1],bot:[0x21D3,"STIXGeneral"],direction:"Vertical"}],
        0x221A: // \surd
         [[.954,"STIXVariants"],[1.232,"STIXGeneral"],[1.847,"STIXSizeOneSym"],[2.460,"STIXSizeTwoSym"],[3.075,"STIXSizeThreeSym"],
          {top: [0xE001,"STIXNonUnicode"], ext: [0xE000,"STIXNonUnicode"], 
          bot: [0x23B7,"STIXSizeOneSym"], direction:"Vertical", fullExtenders:1}],
        0x2223: // \vert
         [[.879,"STIXGeneral"],{ext:[0x2223,"STIXGeneral"],direction:"Vertical"}],
        0x2225: // \Vert
         [[.879,"STIXGeneral"],{ext:[0x2225,"STIXGeneral"],direction:"Vertical"}],
        0x2308: // \lceil
         [[.926,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x23A1,"STIXSizeOneSym"], ext:[0x23A2,"STIXSizeOneSym"], direction:"Vertical"}],
        0x2309: // \rceil
         [[.926,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {top: [0x23A4,"STIXSizeOneSym"], ext:[0x23A5,"STIXSizeOneSym"], direction:"Vertical"}],
        0x230A: // \lfloor
         [[.926,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {ext:[0x23A2,"STIXSizeOneSym"], bot: [0x23A3,"STIXSizeOneSym"], direction:"Vertical"}],
        0x230B: // \rfloor
         [[.926,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],
          {ext:[0x23A5,"STIXSizeOneSym"], bot: [0x23A6,"STIXSizeOneSym"], direction:"Vertical"}],
        0x23AA: // \bracevert
         [[1.01,"STIXSizeOneSym"],{top:[0x23AA,"STIXSizeOneSym"], ext:[0x23AA,"STIXSizeOneSym"],bot:[0x23AA,"STIXSizeOneSym"],direction:"Vertical"}],
        0x23AF: // horizontal line
         [[.315,"STIXGeneral"],{rep:[0x23AF,"STIXGeneral"],direction:"Horizontal"}],
        0x23B0: // \lmoustache
         [[1.0,"STIXSizeOneSym"],{top:[0x23A7,"STIXSizeOneSym"], ext:[0x23AA,"STIXSizeOneSym"],bot:[0x23AD,"STIXSizeOneSym"],direction:"Vertical"}],
        0x23B1: // \rmoustache
         [[1.0,"STIXSizeOneSym"],{top:[0x23AB,"STIXSizeOneSym"], ext:[0x23AA,"STIXSizeOneSym"],bot:[0x23A9,"STIXSizeOneSym"],direction:"Vertical"}],
        0x23DE: // horizontal brace down
         [[.556,"STIXGeneral"],[.926,"STIXSizeOneSym"],[1.46,"STIXSizeTwoSym"],[1.886,"STIXSizeThreeSym"],[2.328,"STIXSizeFourSym"],[3.238,"STIXSizeFiveSym"],
          {left:[0xE13B,"STIXNonUnicode"],mid:[0xE140,"STIXNonUnicode"],right:[0xE13C,"STIXNonUnicode"],rep:[0xE14A,"STIXNonUnicode"],direction:"Horizontal"}],
        0x23DF: // horizontal brace up
         [[.556,"STIXGeneral"],[.926,"STIXSizeOneSym"],[1.46,"STIXSizeTwoSym"],[1.886,"STIXSizeThreeSym"],[2.328,"STIXSizeFourSym"],[3.238,"STIXSizeFiveSym"],
          {left:[0xE13D,"STIXNonUnicode"],mid:[0xE141,"STIXNonUnicode"],right:[0xE13E,"STIXNonUnicode"],rep:[0xE14B,"STIXNonUnicode"],direction:"Horizontal"}],
        0x27E8: // \langle
         [[.926,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],{stop:1, direction:"Vertical"}],
        0x27E9: // \rangle
         [[.926,"STIXGeneral"],[1.230,"STIXSizeOneSym"],[1.353,"STIXSizeOneSym",1.1],[1.845,"STIXSizeTwoSym"],[2.048,"STIXSizeTwoSym",1.11],
          [2.460,"STIXSizeThreeSym"],[2.472,"STIXSizeThreeSym",1.005],[3.075,"STIXSizeFourSym"],{stop:1, direction:"Vertical"}],
        0x27EE: // \lgroup
         [[.853,"STIXGeneral"],{top:[0x23A7,"STIXSizeOneSym"], ext:[0x23AA,"STIXSizeOneSym"],bot:[0x23A9,"STIXSizeOneSym"],direction:"Vertical"}],
        0x27EF: // \rgroup
         [[.853,"STIXGeneral"],{top:[0x23AB,"STIXSizeOneSym"], ext:[0x23AA,"STIXSizeOneSym"],bot:[0x23AD,"STIXSizeOneSym"],direction:"Vertical"}],
        0xE138: // horizontal line
         [[.315,"STIXNonUnicode"],{rep:[0xE138,"STIXNonUnicode"], direction:"Horizontal"}]
      }
    }
  });
  
  TEX.Definitions.mathchar0mi.hbar = ['210F',{variantForm: true}];
  TEX.Definitions.mathchar0mi.prime[1].variantForm = true;
  TEX.Definitions.mathchar0mi.emptyset[1].variantForm = true;
  TEX.Definitions.mathchar0mi.backslash[1].variantForm = true;
  TEX.Definitions.mathchar0mi.triangle[1].mathsize = "71%";

  TEX.Definitions.mathchar0mo.setminus = ['2216',{variantForm: true}],

  HTMLCSS.FONTDATA.FONTS['STIXGeneral'] = {
    directory: 'General/Regular',
    family: 'STIXGeneral',
    Ranges: [
      [0x0,0x7F,"BasicLatin"],
      [0xA0,0xFF,"Latin1Supplement"],
      [0x100,0x17F,"LatinExtendedA"],
      [0x180,0x24F,"LatinExtendedB"],
      [0x2B0,0x2FF,"SpacingModLetters"],
      [0x300,0x36F,"CombDiacritMarks"],
      [0x370,0x3FF,"GreekAndCoptic"],
      [0x400,0x4FF,"Cyrillic"],
      [0x1D00,0x1DBF,"PhoneticExtensions"],
      [0x1E00,0x1EFF,"LatinExtendedAdditional"],
      [0x2000,0x206F,"GeneralPunctuation"],
      [0x2070,0x209F,"SuperAndSubscripts"],
      [0x20A0,0x20CF,"CurrencySymbols"],
      [0x20D0,0x20FF,"CombDiactForSymbols"],
      [0x2100,0x214F,"LetterlikeSymbols"],
      [0x2150,0x218F,"NumberForms"],
      [0x2190,0x21FF,"Arrows"],
      [0x2200,0x22FF,"MathOperators"],
      [0x2300,0x23FF,"MiscTechnical"],
      [0x2400,0x243F,"ControlPictures"],
      [0x2460,0x24FF,"EnclosedAlphanum"],
      [0x2500,0x257F,"BoxDrawing"],
      [0x2580,0x259F,"BlockElements"],
      [0x25A0,0x25FF,"GeometricShapes"],
      [0x2600,0x26FF,"MiscSymbols"],
      [0x2700,0x27BF,"Dingbats"],
      [0x27C0,0x27EF,"MiscMathSymbolsA"],
      [0x27F0,0x27FF,"SupplementalArrowsA"],
      [0x2900,0x297F,"SupplementalArrowsB"],
      [0x2980,0x29FF,"MiscMathSymbolsB"],
      [0x2A00,0x2AFF,"SuppMathOperators"],
      [0x2B00,0x2BFF,"MiscSymbolsAndArrows"],
      [0x3000,0x303F,"CJK"],
      [0xFB00,0xFB4F,"AlphaPresentForms"],
      [0xFFF0,0xFFFF,"Specials"],
      [0x1D400,0x1D433,"MathBold"],
      [0x1D434,0x1D467,"MathItalic"],
      [0x1D468,0x1D49B,"MathBoldItalic"],
      [0x1D49C,0x1D4CF,"MathScript"],
      [0x1D4D0,0x1D503,"MathBoldScript"],
      [0x1D504,0x1D537,"Fraktur"],
      [0x1D538,0x1D56B,"BBBold"],
      [0x1D56C,0x1D59F,"BoldFraktur"],
      [0x1D5A0,0x1D5D3,"MathSS"],
      [0x1D5D4,0x1D607,"MathSSBold"],
      [0x1D608,0x1D63B,"MathSSItalic"],
      [0x1D63C,0x1D66F,"MathSSItalicBold"],
      [0x1D670,0x1D6A3,"MathTT"],
      [0x1D6A4,0x1D6A5,"ij"],
      [0x1D6A8,0x1D6E1,"GreekBold"],
      [0x1D6E2,0x1D71B,"GreekItalic"],
      [0x1D71C,0x1D755,"GreekBoldItalic"],
      [0x1D756,0x1D78F,"GreekSSBold"],
      [0x1D790,0x1D7C9,"GreekSSBoldItalic"],
      [0x1D7CE,0x1D7D7,"MathBold"],
      [0x1D7D8,0x1D7E1,"BBBold"],
      [0x1D7E2,0x1D7EB,"MathSS"],
      [0x1D7EC,0x1D7F6,"MathSSBold"],
      [0x1D7F6,0x1D7FF,"MathTT"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x21: [676,9,333,130,236],         // !
    0x22: [676,-431,408,77,331],       // "
    0x23: [662,0,500,6,495],           // #
    0x24: [727,87,500,44,458],         // $
    0x25: [706,19,747,61,686],         // %
    0x26: [676,13,778,42,750],         // &
    0x27: [676,-431,180,48,133],       // '
    0x28: [676,177,333,48,304],        // (
    0x29: [676,177,333,29,285],        // )
    0x2A: [676,-265,500,68,433],       // *
    0x2B: [547,41,685,48,636],         // +
    0x2C: [102,141,250,55,195],        // ,
    0x2D: [257,-194,333,39,285],       // -
    0x2E: [100,11,250,70,181],         // .
    0x2F: [676,14,278,-9,287],         // /
    0x30: [676,14,500,24,476],         // 0
    0x31: [676,0,500,111,394],         // 1
    0x32: [676,0,500,29,474],          // 2
    0x33: [676,14,500,41,431],         // 3
    0x34: [676,0,500,12,473],          // 4
    0x35: [688,14,500,31,438],         // 5
    0x36: [684,14,500,34,468],         // 6
    0x37: [662,8,500,20,449],          // 7
    0x38: [676,14,500,56,445],         // 8
    0x39: [676,22,500,30,459],         // 9
    0x3A: [459,11,278,81,192],         // :
    0x3B: [459,141,278,80,219],        // ;
    0x3C: [534,24,685,56,621],         // <
    0x3D: [386,-120,685,48,637],       // =
    0x3E: [534,24,685,56,621],         // >
    0x3F: [676,8,444,68,414],          // ?
    0x40: [676,14,921,116,809],        // @
    0x41: [674,0,722,15,707],          // A
    0x42: [662,0,667,17,593],          // B
    0x43: [676,14,667,28,633],         // C
    0x44: [662,0,722,16,685],          // D
    0x45: [662,0,611,12,597],          // E
    0x46: [662,0,556,11,546],          // F
    0x47: [676,14,722,32,709],         // G
    0x48: [662,0,722,18,703],          // H
    0x49: [662,0,333,18,315],          // I
    0x4A: [662,14,373,-6,354],         // J
    0x4B: [662,0,722,33,723],          // K
    0x4C: [662,0,611,12,598],          // L
    0x4D: [662,0,889,12,864],          // M
    0x4E: [662,11,722,12,707],         // N
    0x4F: [676,14,722,34,688],         // O
    0x50: [662,0,557,16,542],          // P
    0x51: [676,177,722,34,701],        // Q
    0x52: [662,0,667,17,660],          // R
    0x53: [676,14,556,43,491],         // S
    0x54: [662,0,611,17,593],          // T
    0x55: [662,14,722,14,705],         // U
    0x56: [662,11,722,16,697],         // V
    0x57: [662,11,944,5,932],          // W
    0x58: [662,0,722,10,704],          // X
    0x59: [662,0,722,22,703],          // Y
    0x5A: [662,0,612,10,598],          // Z
    0x5B: [662,156,333,88,299],        // [
    0x5C: [676,14,278,-9,287],         // \
    0x5D: [662,156,333,34,245],        // ]
    0x5E: [662,-297,469,24,446],       // ^
    0x5F: [-75,125,500,0,500],         // _
    0x60: [678,-507,333,18,242],       // `
    0x61: [460,10,444,37,442],         // a
    0x62: [683,10,500,3,468],          // b
    0x63: [460,10,444,25,412],         // c
    0x64: [683,10,500,27,491],         // d
    0x65: [460,10,444,25,424],         // e
    0x66: [683,0,333,20,383],          // f
    0x67: [460,218,500,28,470],        // g
    0x68: [683,0,500,9,487],           // h
    0x69: [683,0,278,16,253],          // i
    0x6A: [683,218,278,-70,194],       // j
    0x6B: [683,0,500,7,505],           // k
    0x6C: [683,0,278,19,257],          // l
    0x6D: [460,0,778,16,775],          // m
    0x6E: [460,0,500,16,485],          // n
    0x6F: [460,10,500,29,470],         // o
    0x70: [460,217,500,5,470],         // p
    0x71: [460,217,500,24,488],        // q
    0x72: [460,0,333,5,335],           // r
    0x73: [459,10,389,51,348],         // s
    0x74: [579,10,278,13,279],         // t
    0x75: [450,10,500,9,480],          // u
    0x76: [450,14,500,19,477],         // v
    0x77: [450,14,722,21,694],         // w
    0x78: [450,0,500,17,479],          // x
    0x79: [450,218,500,14,475],        // y
    0x7A: [450,0,444,27,418],          // z
    0x7B: [680,181,480,100,350],       // {
    0x7C: [676,14,200,67,133],         // |
    0x7D: [680,181,480,130,380],       // }
    0x7E: [325,-183,541,40,502],       // ~
    0xA0: [0,0,250,0,0],               //  
    0xA8: [622,-523,333,18,316],       // ¨
    0xAC: [393,-115,600,48,552],       // ¬
    0xAF: [601,-547,333,11,322],       // ¯
    0xB1: [502,87,685,48,637],         // ±
    0xB7: [310,-199,250,70,181],       // ·
    0xD7: [529,25,640,43,597],         // ×
    0xF7: [516,10,564,30,534],         // ÷
    0x131: [460,0,278,16,253],         // ı
    0x237: [460,218,278,-70,193],      // ȷ
    0x2C6: [674,-507,333,11,322],      // ˆ
    0x2C7: [674,-507,333,11,322],      // ˇ
    0x2C9: [601,-547,334,11,322],      // ˉ
    0x2CA: [679,-509,333,93,320],      // ˊ
    0x2CB: [679,-509,333,22,249],      // ˋ
    0x2D8: [664,-507,335,27,308],      // ˘
    0x2D9: [622,-523,333,118,217],     // ˙
    0x2DC: [638,-532,333,1,331],       // ˜
    0x300: [678,-507,0,109,333],       // ̀
    0x301: [678,-507,0,109,333],       // ́
    0x302: [674,-507,0,94,405],        // ̂
    0x303: [638,-532,0,85,415],        // ̃
    0x304: [601,-547,0,95,406],        // ̄
    0x306: [664,-507,0,107,388],       // ̆
    0x307: [622,-523,0,200,299],       // ̇
    0x308: [622,-523,0,101,399],       // ̈
    0x30A: [711,-512,0,151,350],       // ̊
    0x30B: [678,-507,0,79,458],        // ̋
    0x30C: [674,-507,0,95,406],        // ̌
    0x338: [662,156,0,100,511],        // ̸
    0x393: [662,0,587,11,577],         // Γ
    0x394: [674,0,722,48,675],         // Δ
    0x398: [676,14,722,34,688],        // Θ
    0x39B: [674,0,702,15,687],         // Λ
    0x39E: [662,0,643,29,614],         // Ξ
    0x3A0: [662,0,722,18,703],         // Π
    0x3A3: [662,0,624,30,600],         // Σ
    0x3A5: [674,0,722,29,703],         // Υ
    0x3A6: [662,0,763,35,728],         // Φ
    0x3A8: [690,0,746,22,724],         // Ψ
    0x3A9: [676,0,744,29,715],         // Ω
    0x2020: [676,149,500,59,442],      // †
    0x2021: [676,153,500,58,442],      // ‡
    0x2026: [100,11,1000,111,888],     // …
    0x2032: [678,-402,289,75,214],     // ′
    0x203E: [820,-770,500,0,500],      // ‾
    0x20D7: [760,-548,0,27,463],       // ⃗
    0x2111: [695,34,762,45,711],       // ℑ
    0x2118: [547,217,826,52,799],      // ℘
    0x211C: [704,22,874,50,829],       // ℜ
    0x2135: [677,13,682,43,634],       // ℵ
    0x2190: [449,-58,926,71,857],      // ←
    0x2191: [662,156,511,60,451],      // ↑
    0x2192: [448,-57,926,70,856],      // →
    0x2193: [662,156,511,60,451],      // ↓
    0x2194: [449,-57,926,38,888],      // ↔
    0x2195: [730,224,511,60,451],      // ↕
    0x2196: [662,156,926,70,856],      // ↖
    0x2197: [662,156,926,70,856],      // ↗
    0x2198: [662,156,926,70,856],      // ↘
    0x2199: [662,156,926,70,856],      // ↙
    0x21A6: [450,-57,926,70,857],      // ↦
    0x21A9: [553,-57,926,70,856],      // ↩
    0x21AA: [553,-57,926,70,856],      // ↪
    0x21BC: [494,-220,955,54,901],     // ↼
    0x21BD: [286,-12,955,54,901],      // ↽
    0x21C0: [494,-220,955,54,901],     // ⇀
    0x21C1: [286,-12,955,54,901],      // ⇁
    0x21CC: [539,33,926,70,856],       // ⇌
    0x21D0: [551,45,926,60,866],       // ⇐
    0x21D1: [662,156,685,45,641],      // ⇑
    0x21D2: [551,45,926,60,866],       // ⇒
    0x21D3: [662,156,685,45,641],      // ⇓
    0x21D4: [517,10,926,20,906],       // ⇔
    0x21D5: [730,224,685,45,641],      // ⇕
    0x2200: [662,0,560,2,558],         // ∀
    0x2202: [668,11,471,40,471],       // ∂
    0x2203: [662,0,560,73,487],        // ∃
    0x2205: [583,79,762,50,712],       // ∅
    0x2207: [662,12,731,63,667],       // ∇
    0x2208: [531,27,685,60,625],       // ∈
    0x2209: [662,157,685,60,625],      // ∉
    0x220B: [531,27,685,60,625],       // ∋
    0x220F: [763,259,1000,52,948],     // ∏
    0x2210: [763,259,1000,52,948],     // ∐
    0x2211: [763,259,914,58,856],      // ∑
    0x2212: [286,-220,685,64,621],     // −
    0x2213: [502,87,685,48,637],       // ∓
    0x2215: [710,222,523,46,478],      // ∕
    0x2216: [411,-93,428,25,403],      // ∖
    0x2217: [471,-33,523,67,457],      // ∗
    0x2218: [387,-117,350,40,310],     // ∘
    0x2219: [387,-117,350,40,310],     // ∙
    0x221A: [973,259,928,112,963],     // √
    0x221D: [430,0,685,41,643],        // ∝
    0x221E: [430,0,926,70,854],        // ∞
    0x2220: [547,0,685,23,643],        // ∠
    0x2223: [690,189,266,100,166],     // ∣
    0x2225: [690,189,523,129,394],     // ∥
    0x2227: [536,29,620,31,589],       // ∧
    0x2228: [536,29,620,31,589],       // ∨
    0x2229: [536,31,620,48,572],       // ∩
    0x222A: [536,31,620,48,572],       // ∪
    0x222B: [824,320,459,32,639],      // ∫
    0x223C: [362,-148,685,48,637],     // ∼
    0x2240: [547,42,286,35,249],       // ≀
    0x2243: [445,-55,685,48,637],      // ≃
    0x2245: [532,27,685,48,637],       // ≅
    0x2248: [475,-25,685,48,637],      // ≈
    0x224D: [498,-8,685,48,637],       // ≍
    0x2250: [611,-120,685,48,637],     // ≐
    0x2260: [662,156,685,48,637],      // ≠
    0x2261: [478,-28,685,48,637],      // ≡
    0x2264: [609,103,685,64,629],      // ≤
    0x2265: [609,103,685,64,629],      // ≥
    0x226A: [532,26,933,25,908],       // ≪
    0x226B: [532,26,933,25,908],       // ≫
    0x227A: [532,26,685,64,621],       // ≺
    0x227B: [532,26,685,64,621],       // ≻
    0x227C: [628,120,685,64,621],      // ≼
    0x227D: [629,119,685,64,621],      // ≽
    0x2282: [531,25,685,64,621],       // ⊂
    0x2283: [531,25,685,64,621],       // ⊃
    0x2286: [607,103,685,64,621],      // ⊆
    0x2287: [607,103,685,64,621],      // ⊇
    0x228E: [536,31,620,48,572],       // ⊎
    0x2291: [607,103,685,64,621],      // ⊑
    0x2292: [607,103,685,64,621],      // ⊒
    0x2293: [536,31,620,48,572],       // ⊓
    0x2294: [536,31,620,48,572],       // ⊔
    0x2295: [623,119,842,50,792],      // ⊕
    0x2296: [623,119,842,50,792],      // ⊖
    0x2297: [623,119,842,50,792],      // ⊗
    0x2298: [623,119,842,50,792],      // ⊘
    0x2299: [583,79,762,50,712],       // ⊙
    0x22A2: [662,0,685,64,621],        // ⊢
    0x22A3: [662,0,685,64,621],        // ⊣
    0x22A4: [662,0,685,48,637],        // ⊤
    0x22A5: [662,0,685,48,637],        // ⊥
    0x22A8: [662,0,685,64,621],        // ⊨
    0x22C0: [763,259,924,54,870],      // ⋀
    0x22C1: [763,259,924,54,870],      // ⋁
    0x22C2: [778,254,924,94,830],      // ⋂
    0x22C3: [768,264,924,94,830],      // ⋃
    0x22C4: [488,-16,523,26,497],      // ⋄
    0x22C5: [313,-193,286,83,203],     // ⋅
    0x22C6: [597,13,700,35,665],       // ⋆
    0x22C8: [582,80,810,54,756],       // ⋈
    0x22EE: [606,104,511,192,319],     // ⋮
    0x22EF: [316,-189,926,108,818],    // ⋯
    0x22F1: [520,18,926,194,732],      // ⋱
    0x2308: [713,213,469,188,447],     // ⌈
    0x2309: [713,213,469,27,286],      // ⌉
    0x230A: [713,213,469,188,447],     // ⌊
    0x230B: [713,213,469,27,286],      // ⌋
    0x2322: [360,-147,1019,54,965],    // ⌢
    0x2323: [360,-147,1019,54,965],    // ⌣
    0x23AF: [286,-220,315,0,315],      // ⎯
    0x23D0: [405,-101,511,222,288],    // ⏐
    0x25B3: [811,127,1145,35,1110],    // △
    0x25B9: [555,50,660,80,605],       // ▹
    0x25BD: [811,127,1145,35,1110],    // ▽
    0x25C3: [554,51,660,55,580],       // ◃
    0x25EF: [785,282,1207,70,1137],    // ◯
    0x2660: [609,99,685,34,651],       // ♠
    0x2661: [603,105,685,34,651],      // ♡
    0x2662: [609,105,685,41,643],      // ♢
    0x2663: [603,99,685,34,651],       // ♣
    0x266D: [768,10,426,57,346],       // ♭
    0x266E: [768,181,426,75,350],      // ♮
    0x266F: [768,181,426,41,386],      // ♯
    0x27E8: [713,213,400,77,335],      // ⟨
    0x27E9: [713,213,400,65,323],      // ⟩
    0x27EE: [676,177,233,56,211],      // ⟮
    0x27EF: [676,177,233,22,177],      // ⟯
    0x27F5: [449,-58,1574,55,1519],    // ⟵
    0x27F6: [449,-57,1574,55,1519],    // ⟶
    0x27F7: [449,-57,1574,55,1519],    // ⟷
    0x27F8: [551,45,1574,55,1519],     // ⟸
    0x27F9: [551,45,1574,55,1519],     // ⟹
    0x27FA: [517,10,1574,55,1519],     // ⟺
    0x27FB: [450,-57,1574,55,1519],    // ⟻
    0x27FC: [450,-57,1574,55,1519],    // ⟼
    0x29F5: [710,222,523,46,478],      // ⧵
    0x2A00: [763,259,1126,53,1073],    // ⨀
    0x2A01: [763,259,1126,53,1073],    // ⨁
    0x2A02: [763,259,1126,53,1073],    // ⨂
    0x2A03: [768,264,924,94,830],      // ⨃
    0x2A04: [768,264,924,94,830],      // ⨄
    0x2A05: [763,259,924,94,830],      // ⨅
    0x2A06: [763,259,924,94,830],      // ⨆
    0x2A3F: [662,0,694,30,664],        // ⨿
    0x2AAF: [609,103,685,64,621],      // ⪯
    0x2AB0: [609,103,685,64,621]       // ⪰
  };

  HTMLCSS.FONTDATA.FONTS['STIXGeneral-bold'] = {
    directory: 'General/Bold',
    family: 'STIXGeneral',
    weight: 'bold',
    Ranges: [
      [0x0,0x7F,"BasicLatin"],
      [0xA0,0xFF,"Latin1Supplement"],
      [0x100,0x17F,"LatinExtendedA"],
      [0x180,0x24F,"LatinExtendedB"],
      [0x2B0,0x2FF,"SpacingModLetters"],
      [0x300,0x36F,"CombDiacritMarks"],
      [0x370,0x3FF,"GreekAndCoptic"],
      [0x400,0x4FF,"Cyrillic"],
      [0x1D00,0x1DBF,"PhoneticExtensions"],
      [0x1E00,0x1EFF,"LatinExtendedAdditional"],
      [0x2000,0x206F,"GeneralPunctuation"],
      [0x2070,0x209F,"SuperAndSubscripts"],
      [0x20A0,0x20CF,"CurrencySymbols"],
      [0x20D0,0x20FF,"CombDiactForSymbols"],
      [0x2100,0x214F,"LetterlikeSymbols"],
      [0x2150,0x218F,"NumberForms"],
      [0x2190,0x21FF,"Arrows"],
      [0x2200,0x22FF,"MathOperators"],
      [0x2300,0x23FF,"MiscTechnical"],
      [0x2400,0x243F,"ControlPictures"],
      [0x2460,0x24FF,"EnclosedAlphanum"],
      [0x2500,0x257F,"BoxDrawing"],
      [0x25A0,0x25FF,"GeometricShapes"],
      [0x2600,0x26FF,"MiscSymbols"],
      [0x27C0,0x27EF,"MiscMathSymbolsA"],
      [0x2980,0x29FF,"MiscMathSymbolsB"],
      [0x2A00,0x2AFF,"SuppMathOperators"],
      [0xFB00,0xFB4F,"AlphaPresentForms"],
      [0x1D400,0x1D433,"MathBold"],
      [0x1D56C,0x1D59F,"BoldFraktur"],
      [0x1D5D4,0x1D607,"MathSSBold"],
      [0x1D6A8,0x1D6E1,"GreekBold"],
      [0x1D756,0x1D78F,"GreekSSBold"],
      [0x1D7CE,0x1D7D7,"MathBold"],
      [0x1D7EC,0x1D7F6,"MathSSBold"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x21: [691,13,333,81,251],         // !
    0x22: [691,-404,555,83,472],       // "
    0x23: [700,0,500,5,495],           // #
    0x24: [750,99,500,29,472],         // $
    0x25: [706,29,749,61,688],         // %
    0x26: [691,16,833,62,789],         // &
    0x27: [691,-404,278,75,204],       // '
    0x28: [694,168,333,46,306],        // (
    0x29: [694,168,333,27,287],        // )
    0x2A: [691,-255,500,56,448],       // *
    0x2B: [563,57,750,65,685],         // +
    0x2C: [155,180,250,39,223],        // ,
    0x2D: [287,-171,333,44,287],       // -
    0x2E: [156,13,250,41,210],         // .
    0x2F: [691,19,278,-24,302],        // /
    0x30: [688,13,500,24,476],         // 0
    0x31: [688,0,500,65,441],          // 1
    0x32: [688,0,500,17,478],          // 2
    0x33: [688,14,500,16,468],         // 3
    0x34: [688,0,500,19,476],          // 4
    0x35: [676,8,500,22,470],          // 5
    0x36: [688,13,500,28,475],         // 6
    0x37: [676,0,500,17,477],          // 7
    0x38: [688,13,500,28,472],         // 8
    0x39: [688,13,500,26,473],         // 9
    0x3A: [472,13,333,82,251],         // :
    0x3B: [472,180,333,82,266],        // ;
    0x3C: [534,24,750,80,670],         // <
    0x3D: [399,-107,750,68,682],       // =
    0x3E: [534,24,750,80,670],         // >
    0x3F: [689,13,500,57,445],         // ?
    0x40: [691,19,930,108,822],        // @
    0x41: [690,0,722,9,689],           // A
    0x42: [676,0,667,16,619],          // B
    0x43: [691,19,722,49,687],         // C
    0x44: [676,0,722,14,690],          // D
    0x45: [676,0,667,16,641],          // E
    0x46: [676,0,611,16,583],          // F
    0x47: [691,19,778,37,755],         // G
    0x48: [676,0,778,21,759],          // H
    0x49: [676,0,389,20,370],          // I
    0x4A: [676,96,500,3,478],          // J
    0x4B: [676,0,778,30,769],          // K
    0x4C: [677,0,667,19,638],          // L
    0x4D: [676,0,944,14,921],          // M
    0x4E: [676,18,722,16,701],         // N
    0x4F: [691,19,778,35,743],         // O
    0x50: [676,0,611,16,600],          // P
    0x51: [691,176,778,35,743],        // Q
    0x52: [676,0,722,26,716],          // R
    0x53: [692,19,556,35,513],         // S
    0x54: [676,0,667,31,636],          // T
    0x55: [676,19,722,16,701],         // U
    0x56: [676,18,722,16,701],         // V
    0x57: [676,15,1000,19,981],        // W
    0x58: [676,0,722,16,699],          // X
    0x59: [676,0,722,15,699],          // Y
    0x5A: [676,0,667,28,634],          // Z
    0x5B: [678,149,333,67,301],        // [
    0x5C: [691,19,278,-25,303],        // \
    0x5D: [678,149,333,32,266],        // ]
    0x5E: [676,-311,581,73,509],       // ^
    0x5F: [-75,125,500,0,500],         // _
    0x60: [713,-528,333,8,246],        // `
    0x61: [473,14,500,25,488],         // a
    0x62: [676,14,556,17,521],         // b
    0x63: [473,14,444,25,430],         // c
    0x64: [676,14,556,25,534],         // d
    0x65: [473,14,444,25,427],         // e
    0x66: [691,0,333,14,389],          // f
    0x67: [473,206,500,28,483],        // g
    0x68: [676,0,556,15,534],          // h
    0x69: [691,0,278,15,256],          // i
    0x6A: [691,203,333,-57,263],       // j
    0x6B: [676,0,556,22,543],          // k
    0x6C: [676,0,278,15,256],          // l
    0x6D: [473,0,833,15,814],          // m
    0x6E: [473,0,556,21,539],          // n
    0x6F: [473,14,500,25,476],         // o
    0x70: [473,205,556,19,524],        // p
    0x71: [473,205,556,34,536],        // q
    0x72: [473,0,444,28,434],          // r
    0x73: [473,14,389,25,361],         // s
    0x74: [630,12,333,19,332],         // t
    0x75: [461,14,556,16,538],         // u
    0x76: [461,14,500,21,485],         // v
    0x77: [461,14,722,23,707],         // w
    0x78: [461,0,500,12,484],          // x
    0x79: [461,205,500,16,482],        // y
    0x7A: [461,0,444,21,420],          // z
    0x7B: [698,175,394,22,340],        // {
    0x7C: [691,19,220,66,154],         // |
    0x7D: [698,175,394,54,372],        // }
    0x7E: [333,-173,520,29,491],       // ~
    0x393: [676,0,620,16,593],         // Γ
    0x394: [690,0,722,33,673],         // Δ
    0x398: [692,18,778,35,743],        // Θ
    0x39B: [690,0,707,9,674],          // Λ
    0x39E: [676,0,647,40,607],         // Ξ
    0x3A0: [676,0,778,21,759],         // Π
    0x3A3: [676,0,671,28,641],         // Σ
    0x3A5: [692,0,703,7,693],          // Υ
    0x3A6: [676,0,836,18,818],         // Φ
    0x3A8: [692,0,808,15,797],         // Ψ
    0x3A9: [692,0,768,28,740]          // Ω
  };

  HTMLCSS.FONTDATA.FONTS['STIXGeneral-italic'] = {
    directory: 'General/Italic',
    family: 'STIXGeneral',
    style: 'italic',
    Ranges: [
      [0x0,0x7F,"BasicLatin"],
      [0xA0,0xFF,"Latin1Supplement"],
      [0x100,0x17F,"LatinExtendedA"],
      [0x180,0x24F,"LatinExtendedB"],
      [0x2B0,0x2FF,"SpacingModLetters"],
      [0x370,0x3FF,"GreekAndCoptic"],
      [0x400,0x4FF,"Cyrillic"],
      [0x1E00,0x1EFF,"LatinExtendedAdditional"],
      [0x2000,0x206F,"GeneralPunctuation"],
      [0x20A0,0x20CF,"CurrencySymbols"],
      [0x20D0,0x20FF,"CombDiactForSymbols"],
      [0x2100,0x214F,"LetterlikeSymbols"],
      [0x2200,0x22FF,"MathOperators"],
      [0x2400,0x243F,"ControlPictures"],
      [0x2460,0x24FF,"EnclosedAlphanum"],
      [0x2500,0x257F,"BoxDrawing"],
      [0x2700,0x27BF,"Dingbats"],
      [0xFB00,0xFB4F,"AlphaPresentForms"],
      [0x1D434,0x1D467,"MathItalic"],
      [0x1D49C,0x1D4CF,"MathScript"],
      [0x1D608,0x1D63B,"MathSSItalic"],
      [0x1D6A4,0x1D6A5,"ij"],
      [0x1D6E2,0x1D71B,"GreekItalic"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x21: [667,11,333,39,304],         // !
    0x22: [666,-421,420,144,432],      // "
    0x23: [676,0,501,2,540],           // #
    0x24: [731,89,500,32,497],         // $
    0x25: [706,19,755,80,705],         // %
    0x26: [666,18,778,76,723],         // &
    0x27: [666,-421,214,132,241],      // '
    0x28: [669,181,333,42,315],        // (
    0x29: [669,180,333,16,289],        // )
    0x2A: [666,-255,500,128,492],      // *
    0x2B: [506,0,675,86,590],          // +
    0x2C: [101,129,250,-5,135],        // ,
    0x2D: [255,-192,333,49,282],       // -
    0x2E: [100,11,250,27,138],         // .
    0x2F: [666,18,278,-65,386],        // /
    0x30: [676,7,500,32,497],          // 0
    0x31: [676,0,500,50,409],          // 1
    0x32: [676,0,500,12,452],          // 2
    0x33: [676,7,500,16,465],          // 3
    0x34: [676,0,500,1,479],           // 4
    0x35: [666,7,500,15,491],          // 5
    0x36: [686,7,500,30,521],          // 6
    0x37: [666,8,500,75,537],          // 7
    0x38: [676,7,500,30,493],          // 8
    0x39: [676,17,500,23,492],         // 9
    0x3A: [441,11,333,50,261],         // :
    0x3B: [441,129,333,26,261],        // ;
    0x3C: [516,10,675,84,592],         // <
    0x3D: [386,-120,675,86,590],       // =
    0x3E: [516,10,675,84,592],         // >
    0x3F: [664,12,500,132,472],        // ?
    0x40: [666,18,920,118,806],        // @
    0x41: [668,0,611,-51,564],         // A
    0x42: [653,0,611,-8,588],          // B
    0x43: [666,18,667,66,689],         // C
    0x44: [653,0,722,-8,700],          // D
    0x45: [653,0,611,-1,634],          // E
    0x46: [653,0,611,8,645],           // F
    0x47: [666,18,722,52,722],         // G
    0x48: [653,0,722,-8,769],          // H
    0x49: [653,0,333,-8,384],          // I
    0x4A: [653,18,444,-6,491],         // J
    0x4B: [653,0,667,7,722],           // K
    0x4C: [653,0,556,-8,559],          // L
    0x4D: [653,0,833,-18,872],         // M
    0x4E: [653,15,667,-20,727],        // N
    0x4F: [667,18,722,60,699],         // O
    0x50: [653,0,611,0,605],           // P
    0x51: [666,182,722,59,699],        // Q
    0x52: [653,0,611,-13,588],         // R
    0x53: [667,18,500,17,508],         // S
    0x54: [653,0,556,59,633],          // T
    0x55: [653,18,722,102,765],        // U
    0x56: [653,18,611,76,688],         // V
    0x57: [653,18,833,71,906],         // W
    0x58: [653,0,611,-29,655],         // X
    0x59: [653,0,556,78,633],          // Y
    0x5A: [653,0,556,-6,606],          // Z
    0x5B: [663,153,389,21,391],        // [
    0x5C: [666,18,278,-41,319],        // \
    0x5D: [663,153,389,12,382],        // ]
    0x5E: [666,-301,422,0,422],        // ^
    0x5F: [-75,125,500,0,500],         // _
    0x60: [664,-492,333,120,311],      // `
    0x61: [441,11,501,17,476],         // a
    0x62: [683,11,500,23,473],         // b
    0x63: [441,11,444,30,425],         // c
    0x64: [683,13,500,15,527],         // d
    0x65: [441,11,444,31,412],         // e
    0x66: [678,207,278,-147,424],      // f
    0x67: [441,206,500,8,471],         // g
    0x68: [683,9,500,19,478],          // h
    0x69: [654,11,278,49,264],         // i
    0x6A: [652,207,278,-124,279],      // j
    0x6B: [683,11,444,14,461],         // k
    0x6C: [683,11,278,41,279],         // l
    0x6D: [441,9,722,12,704],          // m
    0x6E: [441,9,500,14,474],          // n
    0x6F: [441,11,500,27,468],         // o
    0x70: [441,205,504,-75,472],       // p
    0x71: [441,209,500,25,484],        // q
    0x72: [441,0,389,45,412],          // r
    0x73: [442,13,389,16,366],         // s
    0x74: [546,11,278,38,296],         // t
    0x75: [441,11,500,42,475],         // u
    0x76: [441,18,444,20,426],         // v
    0x77: [441,18,667,15,648],         // w
    0x78: [441,11,444,-27,447],        // x
    0x79: [441,206,444,-24,426],       // y
    0x7A: [428,81,389,-2,380],         // z
    0x7B: [687,177,400,51,407],        // {
    0x7C: [666,18,275,105,171],        // |
    0x7D: [687,177,400,-7,349],        // }
    0x7E: [323,-183,541,40,502],       // ~
    0x131: [441,11,278,47,235],        // ı
    0x237: [441,207,278,-124,246],     // ȷ
    0x393: [653,0,611,8,645],          // Γ
    0x394: [668,0,611,-32,526],        // Δ
    0x398: [667,18,722,60,699],        // Θ
    0x39B: [668,0,611,-51,564],        // Λ
    0x39E: [653,0,651,-6,680],         // Ξ
    0x3A0: [653,0,722,-8,769],         // Π
    0x3A3: [653,0,620,-6,659],         // Σ
    0x3A5: [668,0,556,78,648],         // Υ
    0x3A6: [653,0,741,50,731],         // Φ
    0x3A8: [667,0,675,77,778],         // Ψ
    0x3A9: [666,0,762,-6,739],         // Ω
    0x3B1: [441,11,552,27,549],        // α
    0x3B2: [678,205,506,-40,514],      // β
    0x3B3: [435,206,410,19,438],       // γ
    0x3B4: [668,11,460,24,460],        // δ
    0x3B5: [441,11,444,30,425],        // ε
    0x3B6: [683,185,454,30,475],       // ζ
    0x3B7: [441,205,474,14,442],       // η
    0x3B8: [678,11,480,27,494],        // θ
    0x3B9: [441,11,278,49,235],        // ι
    0x3BA: [441,13,444,14,465],        // κ
    0x3BB: [678,16,458,-12,431],       // λ
    0x3BC: [428,205,526,-33,483],      // μ
    0x3BD: [441,18,470,20,459],        // ν
    0x3BE: [683,185,454,30,446],       // ξ
    0x3BF: [441,11,500,27,468],        // ο
    0x3C0: [428,18,504,19,536],        // π
    0x3C1: [441,205,504,-40,471],      // ρ
    0x3C2: [441,185,454,30,453],       // ς
    0x3C3: [428,11,498,27,531],        // σ
    0x3C4: [428,11,410,12,426],        // τ
    0x3C5: [441,10,478,19,446],        // υ
    0x3C6: [441,205,622,27,590],       // φ
    0x3C7: [441,207,457,-108,498],     // χ
    0x3C8: [441,205,584,15,668],       // ψ
    0x3C9: [439,11,686,27,654],        // ω
    0x3D1: [678,10,556,19,526],        // ϑ
    0x3D5: [683,205,627,27,595],       // ϕ
    0x3D6: [428,11,792,17,832],        // ϖ
    0x3F1: [441,205,516,27,484],       // ϱ
    0x3F5: [441,11,444,30,420],        // ϵ
    0x2113: [687,11,579,48,571]        // ℓ
  };

  HTMLCSS.FONTDATA.FONTS['STIXIntegralsD'] = {
    directory: 'IntegralsD/Regular',
    family: 'STIXIntegralsD',
    Ranges: [
      [0x222B,0x2233,"All"],
      [0x2A0B,0x2A1C,"All"]
    ],
    0x222B: [2000,269,585,56,1035],    // ∫
    0x222E: [2000,269,635,56,1035]     // ∮
  };

  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode'] = {
    directory: 'NonUnicode/Regular',
    family: 'STIXNonUnicode',
    Ranges: [
      [0xE000,0xF8FF,"PrivateUse"]
    ],
    0xE000: [610,25,1184,829,895],     // 
    0xE001: [667,-41,1184,829,1211],   // 
    0xE138: [634,-584,480,-10,490],    // 
    0xE139: [-127,177,480,-10,490],    // 
    0xE13B: [955,-512,897,-25,908],    // 
    0xE13C: [955,-512,897,-11,922],    // 
    0xE13D: [182,261,897,-25,908],     // 
    0xE13E: [182,261,897,-11,922],     // 
    0xE140: [1218,-820,1844,-10,1854], // 
    0xE141: [-126,524,1844,-10,1854],  // 
    0xE14A: [955,-820,633,-1,634],     // 
    0xE14B: [-126,261,633,-1,634],     // 
    0xE261: [422,10,523,41,481],       // 
    0xE265: [421,0,523,127,405],       // 
    0xE269: [421,0,523,68,455],        // 
    0xE26D: [424,198,523,47,463],      // 
    0xE271: [420,198,523,58,480],      // 
    0xE275: [421,198,523,66,457],      // 
    0xE279: [612,8,523,37,486],        // 
    0xE27D: [421,198,523,25,490],      // 
    0xE281: [606,12,523,47,477],       // 
    0xE285: [421,200,523,41,483],      // 
    0xE28F: [135,0,325,-1,326],        // 
    0xE290: [135,0,633,-1,634]         // 
  };

  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode-bold'] = {
    directory: 'NonUnicode/Bold',
    family: 'STIXNonUnicode',
    weight: 'bold',
    Ranges: [
      [0xE000,0xF8FF,"PrivateUse"]
    ]
  
  };

  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode-italic'] = {
    directory: 'NonUnicode/Italic',
    family: 'STIXNonUnicode',
    style: 'italic',
    Ranges: [
      [0xE000,0xF8FF,"PrivateUse"]
    ],
    0xE22D: [677,45,852,43,812],       // 
    0xE22E: [670,3,724,35,709],        // 
    0xE22F: [671,11,569,43,586],       // 
    0xE230: [662,0,801,34,788],        // 
    0xE231: [670,4,553,40,599],        // 
    0xE232: [662,0,652,43,710],        // 
    0xE233: [671,131,580,40,580],      // 
    0xE234: [664,21,831,41,845],       // 
    0xE235: [662,0,575,38,591],        // 
    0xE236: [662,120,632,31,785],      // 
    0xE237: [670,13,809,30,783],       // 
    0xE238: [670,7,693,30,653],        // 
    0xE239: [671,45,1166,40,1128],     // 
    0xE23A: [795,37,957,40,1064],      // 
    0xE23B: [669,10,737,38,729],       // 
    0xE23C: [662,0,667,38,709],        // 
    0xE23D: [671,131,744,43,704],      // 
    0xE23E: [662,3,854,38,816],        // 
    0xE23F: [671,0,634,38,671],        // 
    0xE240: [721,0,509,41,730],        // 
    0xE241: [672,13,817,37,950],       // 
    0xE242: [677,33,638,33,680],       // 
    0xE243: [685,32,956,33,998],       // 
    0xE244: [672,13,692,38,739],       // 
    0xE245: [675,131,719,34,763],      // 
    0xE246: [664,94,752,38,714]        // 
  };

  HTMLCSS.FONTDATA.FONTS['STIXSizeOneSym'] = {
    directory: 'SizeOneSym/Regular',
    family: 'STIXSizeOneSym',
    Ranges: [
      [0x20,0x7F,"All"],
      [0x300,0x338,"All"],
      [0x20D0,0x20EF,"All"],
      [0x220F,0x2211,"All"],
      [0x221A,0x221C,"All"],
      [0x22C0,0x22C3,"All"],
      [0x2308,0x230B,"All"],
      [0x2320,0x2321,"All"],
      [0x239B,0x23B9,"All"],
      [0x23DC,0x23E1,"All"],
      [0x2772,0x2773,"All"],
      [0x27E6,0x27EB,"All"],
      [0x2983,0x2986,"All"],
      [0x29F8,0x29F9,"All"],
      [0x2A00,0x2A0A,"All"],
      [0x2AFC,0x2AFF,"All"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x28: [1066,164,468,139,382],      // (
    0x29: [1066,164,468,86,329],       // )
    0x2F: [1066,164,579,25,552],       // /
    0x5B: [1066,164,383,180,363],      // [
    0x5C: [1066,164,579,27,552],       // \
    0x5D: [1066,164,383,20,203],       // ]
    0x7B: [1066,164,575,114,466],      // {
    0x7D: [1066,164,575,109,461],      // }
    0x302: [767,-554,0,0,560],         // ̂
    0x303: [750,-598,0,-2,558],        // ̃
    0x220F: [1500,-49,1355,50,1305],   // ∏
    0x2210: [1500,-49,1355,50,1305],   // ∐
    0x2211: [1499,-49,1292,90,1202],   // ∑
    0x221A: [1552,295,1057,112,1089],  // √
    0x22C0: [1500,-49,1265,60,1205],   // ⋀
    0x22C1: [1500,-49,1265,60,1205],   // ⋁
    0x22C2: [1510,-49,1265,118,1147],  // ⋂
    0x22C3: [1500,-39,1265,118,1147],  // ⋃
    0x2308: [1066,164,453,180,426],    // ⌈
    0x2309: [1066,164,453,25,273],     // ⌉
    0x230A: [1066,164,453,180,428],    // ⌊
    0x230B: [1066,164,453,27,273],     // ⌋
    0x239B: [700,305,450,50,400],      // ⎛
    0x239C: [705,305,450,50,174],      // ⎜
    0x239D: [705,300,450,50,400],      // ⎝
    0x239E: [700,305,450,50,400],      // ⎞
    0x239F: [705,305,450,276,400],     // ⎟
    0x23A0: [705,300,450,50,400],      // ⎠
    0x23A1: [682,323,450,50,415],      // ⎡
    0x23A2: [687,323,450,50,150],      // ⎢
    0x23A3: [687,318,450,50,415],      // ⎣
    0x23A4: [682,323,450,35,400],      // ⎤
    0x23A5: [687,323,450,300,400],     // ⎥
    0x23A6: [687,318,450,35,400],      // ⎦
    0x23A7: [700,305,640,260,600],     // ⎧
    0x23A8: [705,305,640,40,380],      // ⎨
    0x23A9: [705,300,640,260,600],     // ⎩
    0x23AA: [705,305,640,260,380],     // ⎪
    0x23AB: [700,305,640,40,380],      // ⎫
    0x23AC: [705,305,640,260,600],     // ⎬
    0x23AD: [705,300,640,40,380],      // ⎭
    0x23AE: [610,25,688,294,394],      // ⎮
    0x23B0: [700,301,600,35,566],      // ⎰
    0x23B1: [700,301,600,35,566],      // ⎱
    0x23B7: [1510,345,1184,112,895],   // ⎷
    0x23B8: [1566,289,721,0,66],       // ⎸
    0x23B9: [1566,289,721,655,721],    // ⎹
    0x23DE: [136,89,926,0,925],        // ⏞
    0x23DF: [789,-564,926,0,925],      // ⏟
    0x27E8: [1066,164,578,116,462],    // ⟨
    0x27E9: [1066,164,578,116,462],    // ⟩
    0x2A00: [1500,-49,1555,52,1503],   // ⨀
    0x2A01: [1500,-49,1555,52,1503],   // ⨁
    0x2A02: [1500,-49,1555,52,1503],   // ⨂
    0x2A04: [1500,-39,1265,118,1147],  // ⨄
    0x2A05: [1500,-49,1153,82,1071],   // ⨅
    0x2A06: [1500,-49,1153,82,1071]    // ⨆
  };

  HTMLCSS.FONTDATA.FONTS['STIXSizeTwoSym'] = {
    directory: 'SizeTwoSym/Regular',
    family: 'STIXSizeTwoSym',
    Ranges: [
      [0x20,0x7F,"All"],
      [0x300,0x338,"All"],
      [0x20D0,0x20EF,"All"],
      [0x221A,0x221C,"All"],
      [0x2308,0x230B,"All"],
      [0x239B,0x23B9,"All"],
      [0x23DC,0x23E1,"All"],
      [0x2772,0x2773,"All"],
      [0x27E6,0x27EB,"All"],
      [0x2983,0x2986,"All"],
      [0x2AFC,0x2AFF,"All"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x28: [1566,279,589,139,503],      // (
    0x29: [1566,279,608,114,478],      // )
    0x2F: [1566,279,806,25,781],       // /
    0x5B: [1566,279,459,190,422],      // [
    0x5C: [1566,279,806,25,781],       // \
    0x5D: [1566,279,459,37,269],       // ]
    0x7B: [1566,279,717,124,531],      // {
    0x7D: [1566,279,717,186,593],      // }
    0x302: [777,-564,0,0,979],         // ̂
    0x303: [760,-608,0,-2,977],        // ̃
    0x221A: [2056,404,1124,110,1157],  // √
    0x2308: [1566,279,524,190,479],    // ⌈
    0x2309: [1566,279,526,47,336],     // ⌉
    0x230A: [1566,279,524,190,479],    // ⌊
    0x230B: [1566,279,526,47,336],     // ⌋
    0x23DE: [143,81,1460,0,1460],      // ⏞
    0x23DF: [797,-573,1460,0,1460],    // ⏟
    0x27E8: [1566,279,622,95,531],     // ⟨
    0x27E9: [1566,279,622,91,527]      // ⟩
  };

  HTMLCSS.FONTDATA.FONTS['STIXSizeThreeSym'] = {
    directory: 'SizeThreeSym/Regular',
    family: 'STIXSizeThreeSym',
    Ranges: [
      [0x20,0x7F,"All"],
      [0x300,0x338,"All"],
      [0x20D0,0x20EF,"All"],
      [0x221A,0x221C,"All"],
      [0x2308,0x230B,"All"],
      [0x239B,0x23B9,"All"],
      [0x23DC,0x23E1,"All"],
      [0x2772,0x2773,"All"],
      [0x27E6,0x27EB,"All"],
      [0x2983,0x2986,"All"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x28: [2066,394,750,182,667],      // (
    0x29: [2066,394,750,83,568],       // )
    0x2F: [2066,394,1101,30,1071],     // /
    0x5B: [2066,394,508,225,491],      // [
    0x5C: [2066,394,1101,30,1071],     // \
    0x5D: [2066,394,508,17,283],       // ]
    0x7B: [2066,394,906,143,717],      // {
    0x7D: [2066,394,906,189,763],      // }
    0x302: [777,-564,0,0,1460],        // ̂
    0x303: [774,-608,0,-2,1458],       // ̃
    0x221A: [2565,510,1076,112,1110],  // √
    0x2308: [2066,394,565,225,550],    // ⌈
    0x2309: [2066,394,565,15,340],     // ⌉
    0x230A: [2066,394,565,225,550],    // ⌊
    0x230B: [2066,394,565,15,340],     // ⌋
    0x23DE: [157,86,1886,0,1886],      // ⏞
    0x23DF: [815,-572,1886,0,1886],    // ⏟
    0x27E8: [2066,394,765,96,670],     // ⟨
    0x27E9: [2066,394,765,95,669]      // ⟩
  };

  HTMLCSS.FONTDATA.FONTS['STIXSizeFourSym'] = {
    directory: 'SizeFourSym/Regular',
    family: 'STIXSizeFourSym',
    Ranges: [
      [0x20,0x7F,"All"],
      [0x300,0x338,"All"],
      [0x20D0,0x20EF,"All"],
      [0x221A,0x221C,"All"],
      [0x2308,0x230B,"All"],
      [0x239B,0x23B9,"All"],
      [0x23DC,0x23E1,"All"],
      [0x2772,0x2773,"All"],
      [0x27E6,0x27EB,"All"],
      [0x2983,0x2986,"All"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x28: [2566,509,808,124,732],      // (
    0x29: [2566,509,808,76,684],       // )
    0x2F: [2566,509,1309,16,1293],     // /
    0x5B: [2566,509,661,295,634],      // [
    0x5C: [2566,509,1309,16,1293],     // \
    0x5D: [2566,509,661,27,366],       // ]
    0x7B: [2566,509,1076,173,882],     // {
    0x7D: [2566,509,1076,194,903],     // }
    0x302: [796,-573,0,0,1886],        // ̂
    0x303: [771,-608,0,0,1886],        // ̃
    0x221A: [1510,345,1184,112,895],   // √
    0x2308: [2566,509,682,295,655],    // ⌈
    0x2309: [2566,509,682,27,387],     // ⌉
    0x230A: [2566,509,682,295,655],    // ⌊
    0x230B: [2566,509,682,27,387],     // ⌋
    0x23DE: [175,90,2328,0,2328],      // ⏞
    0x23DF: [837,-572,2328,0,2328],    // ⏟
    0x27E8: [2566,509,908,113,796],    // ⟨
    0x27E9: [2566,509,908,112,795]     // ⟩
  };

  HTMLCSS.FONTDATA.FONTS['STIXSizeFiveSym'] = {
    directory: 'SizeFiveSym/Regular',
    family: 'STIXSizeFiveSym',
    Ranges: [
      [0x20,0x7F,"All"],
      [0x300,0x338,"All"],
      [0x20D0,0x20EF,"All"],
      [0x239B,0x23B9,"All"],
      [0x23DC,0x23E1,"All"]
    ],
    0x20: [0,0,250,0,0],               //  
    0x302: [816,-572,0,0,2328],        // ̂
    0x303: [780,-617,0,0,2328],        // ̃
    0x23DE: [181,90,3238,0,3238],      // ⏞
    0x23DF: [844,-573,3238,0,3238]     // ⏟
  };

  HTMLCSS.FONTDATA.FONTS['STIXVariants'] = {
    directory: 'Variants/Regular',
    family: 'STIXVariants',
    Ranges: [
      [0x77,0x7C,"All"],
      [0x19B,0x19B,"All"],
      [0x2032,0x2057,"All"],
      [0x2140,0x2140,"All"],
      [0x2190,0x2193,"All"],
      [0x21D1,0x21E2,"All"],
      [0x2205,0x22ED,"All"],
      [0x2322,0x2323,"All"],
      [0x2423,0x2423,"All"],
      [0x25A9,0x25A9,"All"],
      [0x2A3C,0x2AEE,"All"]
    ],
    0x2032: [565,-28,340,44,295],      // ′
    0x210F: [683,10,579,47,547],       // ℏ
    0x2205: [729,74,523,28,502],       // ∅
    0x2216: [710,222,523,46,478],      // ∖
    0x221A: [943,11,737,67,767]        // √
  };

  HTMLCSS.FONTDATA.FONTS['STIXGeneral'][0x22EE][0] += 400;  // adjust height for \vdots
  HTMLCSS.FONTDATA.FONTS['STIXGeneral'][0x22F1][0] += 500;  // adjust height for \ddots
  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode'][0xE14A][0] += 200;  // adjust height for brace extender
  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode'][0xE14A][1] += 200;  // adjust depth for brace extender
  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode'][0xE14B][0] += 200;  // adjust height for brace extender
  HTMLCSS.FONTDATA.FONTS['STIXNonUnicode'][0xE14B][1] += 200;  // adjust depth for brace extender

  MathJax.Ajax.loadComplete(HTMLCSS.fontDir + "/fontdata.js");

})(MathJax.OutputJax["HTML-CSS"],MathJax.InputJax.TeX);

