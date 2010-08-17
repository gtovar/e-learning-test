/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Size4/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Size4'] = {
  directory: 'Size4/Regular',
  family: 'MathJax_Size4',
  testString: "() [] {}",
  0x20: [0,0,250,0,0],               //  
  0x28: [40,2959,792,237,758],       // (
  0x29: [41,2960,792,33,554],        // )
  0x2F: [40,2959,1278,56,1221],      // /
  0x5B: [40,2959,583,269,577],       // [
  0x5C: [40,2959,1278,56,1221],      // \
  0x5D: [40,2959,583,5,313],         // ]
  0x7B: [40,2960,806,144,662],       // {
  0x7D: [41,2959,806,144,662],       // }
  0xA0: [0,0,250,0,0],               //  
  0x302: [845,-561,0,-14,1902],      // ̂
  0x303: [823,-583,0,1,1885],        // ̃
  0x221A: [40,2961,1000,111,1020],   // √
  0x2308: [40,2959,639,269,633],     // ⌈
  0x2309: [40,2959,639,5,369],       // ⌉
  0x230A: [40,2959,639,269,633],     // ⌊
  0x230B: [40,2959,639,5,369],       // ⌋
  0x27E8: [40,2959,806,140,703],     // ⟨
  0x27E9: [41,2959,806,103,665]      // ⟩
};

MathJax.OutputJax["HTML-CSS"].initFont("MathJax_Size4");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Size4/Regular/Main.js");
