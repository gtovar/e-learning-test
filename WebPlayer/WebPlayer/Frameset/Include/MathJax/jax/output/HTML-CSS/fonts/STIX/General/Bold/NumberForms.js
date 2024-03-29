/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/Bold/NumberForms.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXGeneral-bold'],
  {
    0x2153: [688,12,750,-7,763],       // ⅓
    0x2154: [688,12,750,28,763],       // ⅔
    0x2155: [688,12,750,-7,775],       // ⅕
    0x2156: [688,12,750,28,775],       // ⅖
    0x2157: [688,12,750,23,775],       // ⅗
    0x2158: [688,12,750,22,775],       // ⅘
    0x2159: [688,12,750,-7,758],       // ⅙
    0x215A: [688,12,750,49,758],       // ⅚
    0x215B: [688,12,750,-7,775],       // ⅛
    0x215C: [688,12,750,23,775],       // ⅜
    0x215D: [688,12,750,49,775],       // ⅝
    0x215E: [688,12,750,30,775]        // ⅞
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/Bold/NumberForms.js");
