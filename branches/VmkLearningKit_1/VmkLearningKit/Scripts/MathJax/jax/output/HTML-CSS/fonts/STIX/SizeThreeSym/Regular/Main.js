/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeThreeSym/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeThreeSym'] = {
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

MathJax.OutputJax["HTML-CSS"].initFont("STIXSizeThreeSym");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeThreeSym/Regular/Main.js");
