/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Italic/GreekAndCoptic.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Main-italic'],
  {
    0x393: [680,0,627,54,706],         // Γ
    0x394: [717,1,818,70,751],         // Δ
    0x398: [704,22,767,149,788],       // Θ
    0x39B: [717,0,692,58,646],         // Λ
    0x39E: [678,1,664,74,754],         // Ξ
    0x3A0: [680,0,743,54,859],         // Π
    0x3A3: [683,1,716,80,782],         // Σ
    0x3A5: [706,0,767,213,833],        // Υ
    0x3A6: [683,1,716,158,728],        // Φ
    0x3A8: [683,0,767,207,824],        // Ψ
    0x3A9: [705,0,716,100,759]         // Ω
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Italic/GreekAndCoptic.js");
