/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/SizeFiveSym/Regular/All.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXSizeFiveSym'],
  {
    0x20: [0,0,250,0,0],               //  
    0x302: [816,-572,0,0,2328],        // ̂
    0x303: [780,-617,0,0,2328],        // ̃
    0x305: [820,-770,0,0,3000],        // ̅
    0x30C: [816,-572,0,0,2328],        // ̌
    0x330: [-117,280,0,0,2328],        // ̰
    0x332: [-127,177,0,0,3000],        // ̲
    0x338: [960,454,0,119,557],        // ̸
    0x20D0: [749,-584,0,0,3000],       // ⃐
    0x20D1: [749,-584,0,0,3000],       // ⃑
    0x20D6: [735,-482,0,0,3000],       // ⃖
    0x20D7: [735,-482,0,0,3000],       // ⃗
    0x20EC: [-123,288,0,0,3000],       // ⃬
    0x20ED: [-123,288,0,0,3000],       // ⃭
    0x20EE: [-26,279,0,0,3000],        // ⃮
    0x20EF: [-26,279,0,0,3000],        // ⃯
    0x23B4: [766,-544,3237,90,3147],   // ⎴
    0x23B5: [139,83,3237,90,3147],     // ⎵
    0x23DC: [80,189,3237,0,3237],      // ⏜
    0x23DD: [842,-573,3237,0,3237],    // ⏝
    0x23DE: [181,90,3238,0,3238],      // ⏞
    0x23DF: [844,-573,3238,0,3238]     // ⏟
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SizeFiveSym/Regular/All.js");
