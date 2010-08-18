/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Size3/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Size3'] = {
  directory: 'Size3/Regular',
  family: 'MathJax_Size3',
  testString: "() [] {}",
  0x20: [0,0,250,0,0],               //  
  0x28: [40,2359,736,209,701],       // (
  0x29: [41,2359,736,34,526],        // )
  0x2F: [40,2359,1044,55,989],       // /
  0x5B: [40,2359,528,247,516],       // [
  0x5C: [40,2359,1044,56,988],       // \
  0x5D: [40,2359,528,11,280],        // ]
  0x7B: [40,2359,750,130,618],       // {
  0x7D: [41,2359,750,131,618],       // }
  0xA0: [0,0,250,0,0],               //  
  0x302: [772,-564,0,-4,1447],       // ̂
  0x303: [749,-610,0,1,1442],        // ̃
  0x221A: [40,2361,1000,111,1020],   // √
  0x2308: [40,2359,583,246,571],     // ⌈
  0x2309: [40,2359,583,11,336],      // ⌉
  0x230A: [40,2359,583,246,571],     // ⌊
  0x230B: [40,2359,583,11,336],      // ⌋
  0x27E8: [40,2360,750,126,654],     // ⟨
  0x27E9: [40,2360,750,94,623]       // ⟩
};

MathJax.OutputJax["HTML-CSS"].initFont("MathJax_Size3");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Size3/Regular/Main.js");
