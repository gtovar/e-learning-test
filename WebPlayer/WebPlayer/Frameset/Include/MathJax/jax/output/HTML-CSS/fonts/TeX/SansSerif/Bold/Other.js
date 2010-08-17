/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Bold/Other.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_SansSerif-bold'],
  {
    0xA0: [0,0,250,0,0],               //  
    0x131: [459,1,256,54,201],         // ı
    0x237: [459,205,286,-71,232],      // ȷ
    0x300: [695,-537,50,92,332],       // ̀
    0x301: [694,-536,50,216,457],      // ́
    0x302: [694,-537,50,108,441],      // ̂
    0x303: [694,-547,50,92,457],       // ̃
    0x304: [660,-560,50,76,473],       // ̄
    0x306: [695,-552,50,80,470],       // ̆
    0x307: [695,-596,28,182,345],      // ̇
    0x308: [696,-594,50,91,460],       // ̈
    0x30A: [694,-537,0,118,365],       // ̊
    0x30B: [695,-536,50,110,457],      // ̋
    0x30C: [658,-500,50,108,441],      // ̌
    0x393: [692,1,581,92,535],         // Γ
    0x394: [695,0,917,60,856],         // Δ
    0x398: [716,22,856,62,793],        // Θ
    0x39B: [695,1,672,41,630],         // Λ
    0x39E: [688,1,733,45,687],         // Ξ
    0x3A0: [691,1,794,92,702],         // Π
    0x3A3: [695,0,794,61,733],         // Σ
    0x3A5: [716,1,856,61,794],         // Υ
    0x3A6: [695,0,794,62,732],         // Φ
    0x3A8: [695,0,856,61,794],         // Ψ
    0x3A9: [716,1,794,48,745],         // Ω
    0x2013: [327,-240,550,0,549],      // –
    0x2014: [327,-240,1100,0,1099],    // —
    0x2018: [695,-443,306,81,226],     // ‘
    0x2019: [694,-441,306,80,226],     // ’
    0x201C: [695,-443,558,138,521],    // “
    0x201D: [694,-441,558,37,420]      // ”
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Bold/Other.js");
