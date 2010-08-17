/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeFourSym/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeFourSym'] = {
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

MathJax.OutputJax["HTML-CSS"].initFont("STIXSizeFourSym");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeFourSym/Regular/Main.js");
