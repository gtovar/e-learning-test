/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeTwoSym/Bold/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeTwoSym-bold'] = {
  directory: 'SizeTwoSym/Bold',
  family: 'STIXSizeTwoSym',
  weight: 'bold',
  Ranges: [
    [0x20,0x7F,"All"],
    [0x221A,0x221C,"All"],
    [0x2308,0x230B,"All"],
    [0x27E6,0x27EB,"All"]
  ],
  0x20: [0,0,250,0,0],               //  
  0x28: [1604,241,608,110,512],      // (
  0x29: [1604,241,608,96,498],       // )
  0x2F: [1604,241,802,4,798],        // /
  0x5B: [1604,241,485,197,467],      // [
  0x5C: [1604,241,802,4,798],        // \
  0x5D: [1604,241,485,18,288],       // ]
  0x7B: [1604,241,681,69,514],       // {
  0x7D: [1604,241,681,167,612],      // }
  0x221A: [2095,355,1130,106,1185],  // √
  0x2308: [1604,241,538,185,510],    // ⌈
  0x2309: [1604,241,538,28,355],     // ⌉
  0x230A: [1604,241,538,185,512],    // ⌊
  0x230B: [1604,241,538,28,353],     // ⌋
  0x27E8: [1604,241,622,98,572],     // ⟨
  0x27E9: [1604,241,622,50,524]      // ⟩
};

MathJax.OutputJax["HTML-CSS"].initFont("STIXSizeTwoSym-bold");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeTwoSym/Bold/Main.js");
