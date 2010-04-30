/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Bold/GreekAndCoptic.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Main-bold'],
  {
    0x393: [680,0,692,39,643],         // Γ
    0x394: [698,0,958,56,901],         // Δ
    0x398: [696,10,894,64,829],        // Θ
    0x39B: [699,0,806,40,765],         // Λ
    0x39E: [675,0,767,48,718],         // Ξ
    0x3A0: [680,0,900,39,860],         // Π
    0x3A3: [686,0,831,63,766],         // Σ
    0x3A5: [697,0,894,64,829],         // Υ
    0x3A6: [686,0,831,64,766],         // Φ
    0x3A8: [686,0,894,64,829],         // Ψ
    0x3A9: [696,1,831,51,780]          // Ω
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Bold/GreekAndCoptic.js");
