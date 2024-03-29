/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/BoldItalic/GeneralPunctuation.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXGeneral-bold-italic'],
  {
    0x2010: [282,-166,333,-4,273],     // ‐
    0x2011: [282,-166,333,-4,273],     // ‑
    0x2012: [282,-166,500,-40,477],    // ‒
    0x2013: [269,-178,500,-40,477],    // –
    0x2014: [269,-178,1000,-40,977],   // —
    0x2018: [685,-369,333,128,332],    // ‘
    0x2019: [685,-369,333,98,302],     // ’
    0x201A: [134,182,333,-5,199],      // ‚
    0x201B: [685,-369,333,128,302],    // ‛
    0x201C: [685,-369,500,53,513],     // “
    0x201D: [685,-369,500,53,513],     // ”
    0x201E: [134,182,500,-57,403],     // „
    0x201F: [685,-369,500,92,513],     // ‟
    0x2020: [685,145,500,91,494],      // †
    0x2021: [685,139,500,10,493],      // ‡
    0x2022: [462,-42,560,70,490],      // •
    0x2026: [135,13,1000,40,852],      // …
    0x2030: [706,29,1118,80,1068],     // ‰
    0x2031: [706,29,1480,80,1430],     // ‱
    0x2039: [415,-32,333,32,303],      // ‹
    0x203A: [415,-32,333,10,281],      // ›
    0x203E: [637,-565,500,0,500],      // ‾
    0x2044: [688,12,183,-168,345]      // ⁄
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/BoldItalic/GeneralPunctuation.js");
