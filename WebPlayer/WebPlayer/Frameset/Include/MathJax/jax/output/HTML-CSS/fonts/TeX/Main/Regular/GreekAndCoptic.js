/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Regular/GreekAndCoptic.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Main'],
  {
    0x393: [681,0,625,25,582],         // Γ
    0x394: [716,0,833,46,786],         // Δ
    0x398: [705,22,778,56,722],        // Θ
    0x39B: [717,0,694,32,661],         // Λ
    0x39E: [677,0,667,42,624],         // Ξ
    0x3A0: [680,0,750,25,724],         // Π
    0x3A3: [683,1,722,55,666],         // Σ
    0x3A5: [705,0,778,55,722],         // Υ
    0x3A6: [683,0,722,56,665],         // Φ
    0x3A8: [683,0,778,54,722],         // Ψ
    0x3A9: [704,1,722,44,677]          // Ω
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Regular/GreekAndCoptic.js");
