/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Regular/Other.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_SansSerif'],
  {
    0xA0: [0,0,250,0,0],               //  
    0x131: [444,0,239,74,164],         // ı
    0x237: [444,205,267,-59,192],      // ȷ
    0x300: [694,-527,0,83,301],        // ̀
    0x301: [694,-527,0,198,416],       // ́
    0x302: [694,-527,0,78,421],        // ̂
    0x303: [677,-543,0,83,416],        // ̃
    0x304: [631,-552,0,69,430],        // ̄
    0x306: [694,-508,0,73,426],        // ̆
    0x307: [680,-576,0,198,302],       // ̇
    0x308: [680,-582,0,103,396],       // ̈
    0x30A: [694,-527,0,98,318],        // ̊
    0x30B: [694,-527,0,101,416],       // ̋
    0x30C: [654,-487,0,78,421],        // ̌
    0x393: [691,0,542,87,499],         // Γ
    0x394: [694,0,833,42,790],         // Δ
    0x398: [716,21,778,56,722],        // Θ
    0x39B: [694,0,611,28,582],         // Λ
    0x39E: [688,0,667,42,624],         // Ξ
    0x3A0: [691,0,708,86,621],         // Π
    0x3A3: [694,0,722,55,666],         // Σ
    0x3A5: [717,0,778,55,722],         // Υ
    0x3A6: [694,0,722,55,666],         // Φ
    0x3A8: [694,0,778,55,722],         // Ψ
    0x3A9: [716,0,722,44,677],         // Ω
    0x2013: [312,-236,500,0,499],      // –
    0x2014: [312,-236,1000,0,999],     // —
    0x2018: [694,-471,278,90,189],     // ‘
    0x2019: [694,-471,278,89,188],     // ’
    0x201C: [694,-471,500,174,467],    // “
    0x201D: [694,-471,500,32,325]      // ”
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Regular/Other.js");
