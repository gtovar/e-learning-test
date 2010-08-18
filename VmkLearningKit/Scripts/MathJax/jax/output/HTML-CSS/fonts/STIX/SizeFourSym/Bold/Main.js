/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeFourSym/Bold/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeFourSym-bold'] = {
  directory: 'SizeFourSym/Bold',
  family: 'STIXSizeFourSym',
  weight: 'bold',
  Ranges: [
    [0x20,0x7F,"All"],
    [0x221A,0x221C,"All"],
    [0x2308,0x230B,"All"],
    [0x27E6,0x27EB,"All"]
  ],
  0x20: [0,0,250,0,0],               //  
  0x28: [2604,471,818,115,761],      // (
  0x29: [2604,471,818,57,703],       // )
  0x2F: [2604,471,1321,3,1318],      // /
  0x5B: [2604,471,699,314,691],      // [
  0x5C: [2604,471,1321,3,1318],      // \
  0x5D: [2604,471,699,8,385],        // ]
  0x7B: [2604,471,1119,197,944],     // {
  0x7D: [2604,471,1119,175,922],     // }
  0x221A: [1510,345,1184,101,915],   // √
  0x2308: [2604,471,720,314,712],    // ⌈
  0x2309: [2604,471,720,8,406],      // ⌉
  0x230A: [2604,471,720,314,712],    // ⌊
  0x230B: [2604,471,720,8,406],      // ⌋
  0x27E8: [2604,471,908,120,841],    // ⟨
  0x27E9: [2604,471,908,67,788]      // ⟩
};

MathJax.OutputJax["HTML-CSS"].initFont("STIXSizeFourSym-bold");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeFourSym/Bold/Main.js");
