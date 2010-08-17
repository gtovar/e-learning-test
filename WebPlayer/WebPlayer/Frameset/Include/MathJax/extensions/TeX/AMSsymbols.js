/*************************************************************
 *
 *  MathJax/extensions/TeX/AMSsymbols.js
 *  
 *  Implements macros for accessing the AMS symbol fonts.
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
MathJax.Hub.Register.StartupHook("TeX Jax Ready",function () {
  var MML = MathJax.ElementJax.mml;
  
  MathJax.Hub.Insert(MathJax.InputJax.TeX.Definitions,{

    mathchar0mi: {
      // Lowercase Greek letters
      digamma:                '03DD',
      varkappa:               '03F0',
      
      // Uppercase Greek letters
      varGamma:               ['0393',{mathvariant: MML.VARIANT.ITALIC}],
      varDelta:               ['0394',{mathvariant: MML.VARIANT.ITALIC}],
      varTheta:               ['0398',{mathvariant: MML.VARIANT.ITALIC}],
      varLambda:              ['039B',{mathvariant: MML.VARIANT.ITALIC}],
      varXi:                  ['039E',{mathvariant: MML.VARIANT.ITALIC}],
      varPi:                  ['03A0',{mathvariant: MML.VARIANT.ITALIC}],
      varSigma:               ['03A3',{mathvariant: MML.VARIANT.ITALIC}],
      varUpsilon:             ['03A5',{mathvariant: MML.VARIANT.ITALIC}],
      varPhi:                 ['03A6',{mathvariant: MML.VARIANT.ITALIC}],
      varPsi:                 ['03A8',{mathvariant: MML.VARIANT.ITALIC}],
      varOmega:               ['03A9',{mathvariant: MML.VARIANT.ITALIC}],

      // Hebrew letters
      beth:                   '2136',
      gimel:                  '2137',
      daleth:                 '2138',

      // Miscellaneous symbols
//    hbar:                   '0127',  // in MathJax_Main
      backprime:              ['2035',{variantForm: true}],
      hslash:                 ['210F',{variantForm: true}],
      varnothing:             ['2205',{variantForm: true}],
      blacktriangle:          '25B2',
      triangledown:           '25BD',
      blacktriangledown:      '25BC',
      square:                 '25A1',
      Box:                    '25A1',
      blacksquare:            '25A0',
      lozenge:                '25CA',
      Diamond:                '25CA',
      blacklozenge:           '29EB',
      circledS:               ['24C8',{mathvariant: MML.VARIANT.NORMAL}],
      bigstar:                '2605',
//    angle:                  '2220',  // in MathJax_Main
      sphericalangle:         '2222',
      measuredangle:          '2221',
      nexists:                '2204',
      complement:             '2201',
      mho:                    '2127',
      eth:                    ['00F0',{mathvariant: MML.VARIANT.NORMAL}],
      Finv:                   '2132',
      diagup:                 '2571',
      Game:                   '2141',
      diagdown:               '2572',
      Bbbk:                   ['006B',{mathvariant: MML.VARIANT.DOUBLESTRUCK}],
      
      yen:                    '00A5',
      circledR:               '00AE',
      checkmark:              '2713',
      maltese:                '2720'
    },

    mathchar0mo: {
      // Binary operators
      dotplus:                '2214',
      ltimes:                 '22C9',
      smallsetminus:          ['2216',{variantForm: true}],
      rtimes:                 '22CA',
      Cap:                    '22D2',
      doublecap:              '22D2',
      leftthreetimes:         '22CB',
      Cup:                    '22D3',
      doublecup:              '22D3',
      rightthreetimes:        '22CC',
      barwedge:               '22BC',
      curlywedge:             '22CF',
      veebar:                 '22BB',
      curlyvee:               '22CE',
      doublebarwedge:         '2A5E',
      boxminus:               '229F',
      circleddash:            '229D',
      boxtimes:               '22A0',
      circledast:             '229B',
      boxdot:                 '22A1',
      circledcirc:            '229A',
      boxplus:                '229E',
      centerdot:              '22C5',
      divideontimes:          '22C7',
      intercal:               '22BA',

      // Binary relations
      leqq:                   '2266',
      geqq:                   '2267',
      leqslant:               '2A7D',
      geqslant:               '2A7E',
      eqslantless:            '2A95',
      eqslantgtr:             '2A96',
      lesssim:                '2272',
      gtrsim:                 '2273',
      lessapprox:             '2A85',
      gtrapprox:              '2A86',
      approxeq:               '224A',
      lessdot:                '22D6',
      gtrdot:                 '22D7',
      lll:                    '22D8',
      llless:                 '22D8',
      ggg:                    '22D9',
      gggtr:                  '22D9',
      lessgtr:                '2276',
      gtrless:                '2277',
      lesseqgtr:              '22DA',
      gtreqless:              '22DB',
      lesseqqgtr:             '2A8B',
      gtreqqless:             '2A8C',
      doteqdot:               '2251',
      Doteq:                  '2251',
      eqcirc:                 '2256',
      risingdotseq:           '2253',
      circeq:                 '2257',
      fallingdotseq:          '2252',
      triangleq:              '225C',
      backsim:                '223D',
      thicksim:               ['223C',{variantForm: true}],
      backsimeq:              '22CD',
      thickapprox:            '2248',
      subseteqq:              '2AC5',
      supseteqq:              '2AC6',
      Subset:                 '22D0',
      Supset:                 '22D1',
      sqsubset:               '228F',
      sqsupset:               '2290',
      preccurlyeq:            '227C',
      succcurlyeq:            '227D',
      curlyeqprec:            '22DE',
      curlyeqsucc:            '22DF',
      precsim:                '227E',
      succsim:                '227F',
      precapprox:             '2AB7',
      succapprox:             '2AB8',
      vartriangleleft:        '22B2',
      lhd:                    '22B2',
      vartriangleright:       '22B3',
      rhd:                    '22B3',
      trianglelefteq:         '22B4',
      unlhd:                  '22B4',
      trianglerighteq:        '22B5',
      unrhd:                  '22B5',
      vDash:                  '22A8',
      Vdash:                  '22A9',
      Vvdash:                 '22AA',
      smallsmile:             '2323',
      shortmid:               ['2223',{variantForm: true}],
      smallfrown:             '2322',
      shortparallel:          ['2225',{variantForm: true}],
      bumpeq:                 '224F',
      between:                '226C',
      Bumpeq:                 '224E',
      pitchfork:              '22D4',
      varpropto:              '221D',
      backepsilon:            '220D',
      blacktriangleleft:      '25C0',
      blacktriangleright:     '25B6',
      therefore:              '2234',
      because:                '2235',
      eqsim:                  '2242',
      vartriangle:            ['25B3',{variantForm: true}],
      Join:                   '22C8',

      // Negated relations
      nless:                  '226E',
      ngtr:                   '226F',
      nleq:                   '2270',
      ngeq:                   '2271',
      nleqslant:              ['2A87',{variantForm: true}],
      ngeqslant:              ['2A88',{variantForm: true}],
      nleqq:                  ['2270',{variantForm: true}],
      ngeqq:                  ['2271',{variantForm: true}],
      lneq:                   '2A87',
      gneq:                   '2A88',
      lneqq:                  '2268',
      gneqq:                  '2269',
      lvertneqq:              ['2268',{variantForm: true}],
      gvertneqq:              ['2269',{variantForm: true}],
      lnsim:                  '22E6',
      gnsim:                  '22E7',
      lnapprox:               '2A89',
      gnapprox:               '2A8A',
      nprec:                  '2280',
      nsucc:                  '2281',
      npreceq:                ['22E0',{variantForm: true}],
      nsucceq:                ['22E1',{variantForm: true}],
      precneqq:               '2AB5',
      succneqq:               '2AB6',
      precnsim:               '22E8',
      succnsim:               '22E9',
      precnapprox:            '2AB9',
      succnapprox:            '2ABA',
      nsim:                   '2241',
      ncong:                  '2246',
      nshortmid:              ['2224',{variantForm: true}],
      nshortparallel:         ['2226',{variantForm: true}],
      nmid:                   '2224',
      nparallel:              '2226',
      nvdash:                 '22AC',
      nvDash:                 '22AD',
      nVdash:                 '22AE',
      nVDash:                 '22AF',
      ntriangleleft:          '22EA',
      ntriangleright:         '22EB',
      ntrianglelefteq:        '22EC',
      ntrianglerighteq:       '22ED',
      nsubseteq:              '2288',
      nsupseteq:              '2289',
      nsubseteqq:             ['2288',{variantForm: true}],
      nsupseteqq:             ['2289',{variantForm: true}],
      subsetneq:              '228A',
      supsetneq:              '228B',
      varsubsetneq:           ['228A',{variantForm: true}],
      varsupsetneq:           ['228B',{variantForm: true}],
      subsetneqq:             '2ACB',
      supsetneqq:             '2ACC',
      varsubsetneqq:          ['2ACB',{variantForm: true}],
      varsupsetneqq:          ['2ACC',{variantForm: true}],


      // Arrows
      leftleftarrows:         '21C7',
      rightrightarrows:       '21C9',
      leftrightarrows:        '21C6',
      rightleftarrows:        '21C4',
      Lleftarrow:             '21DA',
      Rrightarrow:            '21DB',
      twoheadleftarrow:       '219E',
      twoheadrightarrow:      '21A0',
      leftarrowtail:          '21A2',
      rightarrowtail:         '21A3',
      looparrowleft:          '21AB',
      looparrowright:         '21AC',
      leftrightharpoons:      '21CB',
      rightleftharpoons:      '21CC',
      curvearrowleft:         '21B6',
      curvearrowright:        '21B7',
      circlearrowleft:        '21BA',
      circlearrowright:       '21BB',
      Lsh:                    '21B0',
      Rsh:                    '21B1',
      upuparrows:             '21C8',
      downdownarrows:         '21CA',
      upharpoonleft:          '21BF',
      upharpoonright:         '21BE',
      downharpoonleft:        '21C3',
      restriction:            '21C3',
      multimap:               '22B8',
      downharpoonright:       '21C2',
      leftrightsquigarrow:    '21AD',
      rightsquigarrow:        '21DD',
      leadsto:                '21DD',
      dashrightarrow:         '21E2',
      dashleftarrow:          '21E0',

      // Negated arrows
      nleftarrow:             '219A',
      nrightarrow:            '219B',
      nLeftarrow:             '21CD',
      nRightarrow:            '21CF',
      nleftrightarrow:        '21AE',
      nLeftrightarrow:        '21CE'
    },
    
    delimiter: {
      // corners
      "\\ulcorner":           '250C',
      "\\urcorner":           '2510',
      "\\llcorner":           '2514',
      "\\lrcorner":           '2518'
    },
    
    macros: {
      implies:    ['Macro','\\;\\Longrightarrow\\;'],
      impliedby:  ['Macro','\\;\\Longleftarrow\\;']
    }
    
  });
  
  var ORD   = [0,0],
      OP    = [1,2,MML.TEXCLASS.OP],
      BIN   = [4,4,MML.TEXCLASS.BIN],
      REL   = [5,5,MML.TEXCLASS.REL],
      OPEN  = [1,2,MML.TEXCLASS.OPEN],
      CLOSE = [0,2,MML.TEXCLASS.CLOSE],
      INNER = [0,0,MML.TEXCLASS.INNER];

  MathJax.Hub.Insert(MML.mo.prototype,{
    OPTABLE: {
      infix: MML.FIXUNICODE({
        '&#x219A;': REL,  // nleftarrow
        '&#x219B;': REL,  // nrightarrow
        '&#x219E;': REL,  // twoheadleftarrow
        '&#x21A0;': REL,  // twoheadrightarrow
        '&#x21A2;': REL,  // leftarrowtail
        '&#x21A3;': REL,  // rightarrowtail
        '&#x21AB;': REL,  // looparrowleft
        '&#x21AC;': REL,  // looparrowright
        '&#x21AD;': REL,  // rightsquigarrow
        '&#x21AE;': REL,  // nleftrightarrow
        '&#x21B0;': REL,  // Lsh
        '&#x21B1;': REL,  // Rsh
        '&#x21B6;': REL,  // curvearrowleft
        '&#x21B7;': REL,  // curvearrowright
        '&#x21BA;': REL,  // circlearrowleft
        '&#x21BB;': REL,  // circlearrowright
        '&#x21BE;': REL,  // upharpoonright
        '&#x21BF;': REL,  // upharpoonleft
        '&#x21C2;': REL,  // downharpoonright
        '&#x21C3;': REL,  // downharpoonleft
        '&#x21C4;': REL,  // rightleftarrows
        '&#x21C6;': REL,  // leftrightarrows
        '&#x21C7;': REL,  // leftleftarrows
        '&#x21C8;': REL,  // upuparrows
        '&#x21C9;': REL,  // rightrightarrows
        '&#x21CA;': REL,  // downdownarrows
        '&#x21CB;': REL,  // leftrightharpoons
        '&#x21CC;': REL,  // rightleftharpoons
        '&#x21CD;': REL,  // nLeftarrow
        '&#x21CE;': REL,  // nLeftrightarrow
        '&#x21CF;': REL,  // nRightarrow
        '&#x21DA;': REL,  // Lleftarrow
        '&#x21DB;': REL,  // Rrightarrow
        '&#x21DC;': REL,  // leftrightsquigarrow
        '&#x21E0;': REL,  // dashleftarrow
        '&#x21E2;': REL,  // dashrightarrow
        '&#x220D;': REL,  // backepsilon
        '&#x2214;': BIN,  // dotplus
        '&#x2216;': BIN,  // smallsetminus
        '&#x221D;': REL,  // varpropto
        '&#x2223;': REL,  // shortmid
        '&#x2224;': REL,  // nmid
        '&#x2225;': REL,  // shortparallel
        '&#x2226;': REL,  // nparallel
        '&#x2234;': REL,  // therefore
        '&#x2235;': REL,  // because
        '&#x223C;': REL,  // thicksim
        '&#x223D;': REL,  // backsim
        '&#x2241;': REL,  // nsim
        '&#x2242;': REL,  // eqsim
        '&#x2246;': REL,  // ncong
        '&#x2248;': REL,  // thickapprox
        '&#x224A;': REL,  // approxeq
        '&#x224E;': REL,  // Bumpeq
        '&#x224F;': REL,  // bumpeq
        '&#x2251;': REL,  // doteqdot
        '&#x2252;': REL,  // fallingdotseq
        '&#x2253;': REL,  // risingdotseq
        '&#x2256;': REL,  // eqcirc
        '&#x2257;': REL,  // circeq
        '&#x225C;': REL,  // triangleq
        '&#x2266;': REL,  // leqq
        '&#x2267;': REL,  // geqq
        '&#x2268;': REL,  // lneqq
        '&#x2269;': REL,  // gneqq
        '&#x226C;': REL,  // between
        '&#x226E;': REL,  // nless
        '&#x226F;': REL,  // ngtr
        '&#x2270;': REL,  // nleq
        '&#x2271;': REL,  // ngeq
        '&#x2272;': REL,  // lesssim
        '&#x2273;': REL,  // gtrsim
        '&#x2276;': REL,  // lessgtr
        '&#x2277;': REL,  // gtrless
        '&#x227C;': REL,  // preccurlyeq
        '&#x227D;': REL,  // succcurlyeq
        '&#x227E;': REL,  // precsim
        '&#x227F;': REL,  // succsim
        '&#x2280;': REL,  // nprec
        '&#x2281;': REL,  // nsucc
        '&#x2288;': REL,  // nsubseteq
        '&#x2289;': REL,  // nsupseteq
        '&#x228A;': REL,  // subsetneq
        '&#x228B;': REL,  // supsetneq
        '&#x228F;': REL,  // sqsubset
        '&#x2290;': REL,  // sqsupset
        '&#x229A;': BIN,  // circledcirc
        '&#x229B;': BIN,  // circledast
        '&#x229D;': BIN,  // circleddash
        '&#x229E;': BIN,  // boxplus
        '&#x229F;': BIN,  // boxminus
        '&#x22A0;': BIN,  // boxtimes
        '&#x22A1;': BIN,  // boxdot
        '&#x22A8;': REL,  // vDash
        '&#x22A9;': REL,  // Vdash
        '&#x22AA;': REL,  // Vvdash
        '&#x22AC;': REL,  // nvdash
        '&#x22AD;': REL,  // nvDash
        '&#x22AE;': REL,  // nVdash
        '&#x22AF;': REL,  // nVDash
        '&#x22B2;': REL,  // vartriangleleft
        '&#x22B3;': REL,  // vartriangleright
        '&#x22B4;': REL,  // trianglelefteq
        '&#x22B5;': REL,  // trianglerighteq
        '&#x22B8;': REL,  // multimap
        '&#x22BA;': BIN,  // intercal
        '&#x22BB;': BIN,  // veebar
        '&#x22BC;': BIN,  // barwedge
        '&#x22C5;': BIN,  // centerdot
        '&#x22C7;': BIN,  // divideontimes
        '&#x22C9;': BIN,  // ltimes
        '&#x22CA;': BIN,  // rtimes
        '&#x22CB;': BIN,  // leftthreetimes
        '&#x22CC;': BIN,  // rightthreetimes
        '&#x22CD;': REL,  // backsimeq
        '&#x22CE;': BIN,  // curlyvee
        '&#x22CF;': BIN,  // curlywedge
        '&#x22D0;': REL,  // Subset
        '&#x22D1;': REL,  // Supset
        '&#x22D2;': BIN,  // Cap
        '&#x22D3;': BIN,  // Cup
        '&#x22D4;': REL,  // pitchfork
        '&#x22D6;': BIN,  // lessdot
        '&#x22D7;': BIN,  // gtrdot
        '&#x22D8;': REL,  // lll
        '&#x22D9;': REL,  // ggg
        '&#x22DA;': REL,  // lesseqgtr
        '&#x22DB;': REL,  // gtreqless
        '&#x22DE;': REL,  // curlyeqprec
        '&#x22DF;': REL,  // curlyeqsucc
        '&#x22E0;': REL,  // npreceq
        '&#x22E1;': REL,  // nsucceq
        '&#x22E6;': REL,  // lnsim
        '&#x22E7;': REL,  // gnsim
        '&#x22E8;': REL,  // precnsim
        '&#x22E9;': REL,  // succnsim
        '&#x22EA;': REL,  // ntriangleleft
        '&#x22EB;': REL,  // ntriangleright
        '&#x22EC;': REL,  // ntrianglelefteq
        '&#x22ED;': REL,  // ntrianglerighteq
        '&#x2322;': REL,  // smallfrown
        '&#x2323;': REL,  // smallsmile
        '&#x25B3;': REL,  // vartriangle
        '&#x25B6;': REL,  // blacktriangleright
        '&#x25B8;': REL,  // blacktriangleright
        '&#x25C0;': REL,  // blacktriangleleft
        '&#x25C2;': REL,  // blacktriangleleft (STIX)
        '&#x2A5E;': BIN,  // doublebarwedge
        '&#x2A7D;': REL,  // leqslant
        '&#x2A7E;': REL,  // geqslant
        '&#x2A85;': REL,  // lessapprox
        '&#x2A86;': REL,  // gtrapprox
        '&#x2A87;': REL,  // lneq
        '&#x2A88;': REL,  // gneq
        '&#x2A89;': REL,  // lnapprox
        '&#x2A8A;': REL,  // gnapprox
        '&#x2A8B;': REL,  // lesseqqgtr
        '&#x2A8C;': REL,  // gtreqqless
        '&#x2A95;': REL,  // eqslantless
        '&#x2A96;': REL,  // eqslantgtr
        '&#x2AB5;': REL,  // precneqq
        '&#x2AB6;': REL,  // succneqq
        '&#x2AB7;': REL,  // precapprox
        '&#x2AB8;': REL,  // succapprox
        '&#x2AB9;': REL,  // precnapprox
        '&#x2ABA;': REL,  // succnapprox
        '&#x2AC5;': REL,  // subseteqq
        '&#x2AC6;': REL,  // supseteqq
        '&#x2ACB;': REL,  // subsetneqq
        '&#x2ACC;': REL,  // supsetneqq
        '&#xE006;': REL,  // nshortmid
        '&#xE007;': REL,  // nshortparallel
        '&#xE00C;': REL,  // lvertneqq
        '&#xE00D;': REL,  // gvertneqq
        '&#xE00E;': REL,  // ngeqq
        '&#xE00F;': REL,  // ngeqslant
        '&#xE010;': REL,  // nleqslant
        '&#xE011;': REL,  // nleqq
        '&#xE016;': REL,  // nsubseteqq
        '&#xE017;': REL,  // varsubsetneqq
        '&#xE018;': REL,  // nsupseteqq
        '&#xE019;': REL,  // varsupsetneqq
        '&#xE01A;': REL,  // varsubsetneq
        '&#xE01B;': REL,  // varsupsetneq
        '&#xE04B;': REL,  // npreceq
        '&#xE04F;': REL   // nsucceq
      })
    }
  });

  if (MathJax.Hub.Browser.isMSIE) {
    MathJax.InputJax.TeX.Definitions.mathchar0mi.digamma  = ['03DC',{variantForm: true}];
    MathJax.InputJax.TeX.Definitions.mathchar0mi.varkappa = ['03F0',{variantForm: true}];
  }
});

MathJax.Hub.Register.StartupHook("HTML-CSS Jax Ready",function () {
  var HTMLCSS = MathJax.OutputJax["HTML-CSS"];
  var TEXDEF = MathJax.InputJax.TeX.Definitions;
  var VARIANT = HTMLCSS.FONTDATA.VARIANT;
  if (HTMLCSS.fontInUse === "TeX") {
    VARIANT["-TeX-variant"] = {
      fonts: ["MathJax_AMS","MathJax_Main","MathJax_Size1"],
      remap: {0x2268: 0xE00C, 0x2269: 0xE00D, 0x2270: 0xE011, 0x2271: 0xE00E,
              0x2A87: 0xE010, 0x2A88: 0xE00F, 0x2224: 0xE006, 0x2226: 0xE007,
              0x2288: 0xE016, 0x2289: 0xE018, 0x228A: 0xE01A, 0x228B: 0xE01B,
              0x2ACB: 0xE017, 0x2ACC: 0xE019, 0x03DC: 0xE008, 0x03F0: 0xE009}
    };
    if (HTMLCSS.msieIE6) {
      MathJax.Hub.Insert(VARIANT["-TeX-variant"].remap,{
        0x2190:[0xE2C1,"-WinIE6"], 0x2192:[0xE2C0,"-WinIE6"],
        0x2223:[0xE2C2,"-WinIE6"], 0x2225:[0xE2C3,"-WinIE6"],
        0x223C:[0xE2C4,"-WinIE6"], 0x25B3:[0xE2D3,"-WinIE6"]
      });
    }
  }
  if (HTMLCSS.fontInUse === "STIX") {
    TEXDEF.mathchar0mi.varnothing = '2205';
    TEXDEF.mathchar0mi.hslash = '210F';
    TEXDEF.mathchar0mi.blacktriangle = '25B4';
    TEXDEF.mathchar0mi.blacktriangledown = '25BE';
    TEXDEF.mathchar0mi.square = '25FB';
    TEXDEF.mathchar0mi.blacksquare = '25FC';
    TEXDEF.mathchar0mi.vartriangle = ['25B3',{mathsize:"71%"}];
    TEXDEF.mathchar0mi.triangledown = ['25BD',{mathsize:"71%"}];
    TEXDEF.mathchar0mo.blacktriangleleft = '25C2';
    TEXDEF.mathchar0mo.blacktriangleright = '25B8';
    TEXDEF.mathchar0mo.smallsetminus = '2216';
    MathJax.Hub.Insert(VARIANT["-STIX-variant"],{
      remap: {0x2A87: 0xE010, 0x2A88: 0xE00F, 0x2270: 0xE011, 0x2271: 0xE00E,
              0x22E0: 0xE04B, 0x22E1: 0xE04F, 0x2288: 0xE016, 0x2289: 0xE018}
    });
  }
  
  MathJax.Hub.Startup.signal.Post("TeX AMSsymbols Ready");
  
});


MathJax.Ajax.loadComplete("[MathJax]/extensions/TeX/AMSsymbols.js");
