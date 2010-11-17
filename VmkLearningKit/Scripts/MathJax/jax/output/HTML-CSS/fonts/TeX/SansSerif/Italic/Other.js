/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Italic/Other.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_SansSerif-italic'],
  {
    0xA0: [0,0,250,0,0],               //  
    0x131: [444,0,239,74,258],         // ı
    0x237: [444,204,267,-96,286],      // ȷ
    0x300: [694,-527,0,230,413],       // ̀
    0x301: [694,-527,0,310,563],       // ́
    0x302: [694,-527,0,190,533],       // ̂
    0x303: [677,-543,0,199,560],       // ̃
    0x304: [631,-552,0,186,564],       // ̄
    0x306: [694,-508,0,216,573],       // ̆
    0x307: [680,-576,0,320,446],       // ̇
    0x308: [680,-582,0,227,540],       // ̈
    0x30A: [694,-527,0,261,486],       // ̊
    0x30B: [694,-527,0,213,563],       // ̋
    0x30C: [654,-487,0,217,560],       // ̌
    0x393: [691,0,542,87,646],         // Γ
    0x394: [694,0,833,42,790],         // Δ
    0x398: [715,22,778,119,804],       // Θ
    0x39B: [694,0,611,28,582],         // Λ
    0x39E: [688,0,667,42,765],         // Ξ
    0x3A0: [691,0,708,86,768],         // Π
    0x3A3: [694,0,722,55,813],         // Σ
    0x3A5: [716,0,778,173,843],        // Υ
    0x3A6: [694,0,722,124,743],        // Φ
    0x3A8: [694,0,778,171,854],        // Ψ
    0x3A9: [716,0,722,44,769],         // Ω
    0x2013: [312,-236,500,50,565],     // –
    0x2014: [312,-236,1000,50,1065],   // —
    0x2018: [694,-471,278,190,336],    // ‘
    0x2019: [694,-471,278,190,335],    // ’
    0x201C: [694,-471,500,274,614],    // “
    0x201D: [694,-471,500,133,472]     // ”
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Italic/Other.js");
