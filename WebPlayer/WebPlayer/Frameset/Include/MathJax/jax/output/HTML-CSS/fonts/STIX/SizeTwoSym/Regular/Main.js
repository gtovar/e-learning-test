/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeTwoSym/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeTwoSym'] = {
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

MathJax.OutputJax["HTML-CSS"].initFont("STIXSizeTwoSym");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeTwoSym/Regular/Main.js");
