/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/Italic/GeneralPunctuation.js
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
 *
 */

MathJax.Hub.Insert(
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXGeneral-italic'],
  {
    0x2010: [257,-191,333,49,282],     // ‐
    0x2011: [257,-191,333,49,282],     // ‑
    0x2012: [258,-192,500,-8,508],     // ‒
    0x2013: [243,-197,500,-6,505],     // –
    0x2014: [243,-197,889,-6,894],     // —
    0x2018: [666,-436,333,171,310],    // ‘
    0x2019: [666,-436,333,151,290],    // ’
    0x201A: [101,129,333,44,183],      // ‚
    0x201B: [666,-436,333,169,290],    // ‛
    0x201C: [666,-436,556,166,514],    // “
    0x201D: [666,-436,556,151,499],    // ”
    0x201E: [101,129,556,57,405],      // „
    0x201F: [666,-436,556,169,499],    // ‟
    0x2020: [666,159,500,101,488],     // †
    0x2021: [666,143,500,22,491],      // ‡
    0x2022: [444,-59,523,70,455],      // •
    0x2026: [100,11,889,57,762],       // …
    0x2030: [706,19,1117,80,1067],     // ‰
    0x2031: [706,19,1479,80,1429],     // ‱
    0x2039: [403,-37,333,51,281],      // ‹
    0x203A: [403,-37,333,52,282],      // ›
    0x203E: [582,-532,500,0,500],      // ‾
    0x2044: [676,10,167,-169,337]      // ⁄
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/Italic/GeneralPunctuation.js");
