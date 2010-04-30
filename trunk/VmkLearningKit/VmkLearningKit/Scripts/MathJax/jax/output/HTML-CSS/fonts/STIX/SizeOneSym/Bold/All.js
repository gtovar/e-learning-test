/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeOneSym/Bold/All.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeOneSym-bold'],
  {
    0x20: [0,0,250,0,0],               //  
    0x28: [1104,126,468,158,439],      // (
    0x29: [1104,126,468,29,310],       // )
    0x2F: [1104,126,579,14,564],       // /
    0x5B: [1104,126,408,186,407],      // [
    0x5C: [1104,126,579,14,564],       // \
    0x5D: [1104,126,408,1,222],        // ]
    0x7B: [1104,126,595,115,503],      // {
    0x7D: [1104,126,595,92,480],       // }
    0x220F: [1500,-49,1355,35,1321],   // ∏
    0x2210: [1500,-49,1355,34,1320],   // ∐
    0x2211: [1500,-49,1292,60,1215],   // ∑
    0x221A: [1588,241,1061,109,1119],  // √
    0x2308: [1104,126,476,186,470],    // ⌈
    0x2309: [1104,126,476,6,292],      // ⌉
    0x230A: [1104,126,476,184,470],    // ⌊
    0x230B: [1104,126,476,6,290],      // ⌋
    0x27E8: [1104,126,579,99,481],     // ⟨
    0x27E9: [1104,126,579,98,480]      // ⟩
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeOneSym/Bold/All.js");
