/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Greek/BoldItalic/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Greek-bold-italic'] = {
  directory: 'Greek/BoldItalic',
  family: 'MathJax_Greek',
  weight: 'bold',
  style: 'italic',
  testString: String.fromCharCode(0x393)+" "+String.fromCharCode(0x3A5)+" "+String.fromCharCode(0x39B),
  skew: {
    0x393: 0.0958,
    0x394: 0.192,
    0x398: 0.0958,
    0x39B: 0.192,
    0x39E: 0.0958,
    0x3A0: 0.0639,
    0x3A3: 0.0958,
    0x3A5: 0.0639,
    0x3A6: 0.0958,
    0x3A8: 0.0639,
    0x3A9: 0.0958,
    0x3B1: 0.0319,
    0x3B2: 0.0958,
    0x3B4: 0.0639,
    0x3B5: 0.0958,
    0x3B6: 0.0958,
    0x3B7: 0.0639,
    0x3B8: 0.0958,
    0x3B9: 0.0639,
    0x3BC: 0.0319,
    0x3BD: 0.0319,
    0x3BE: 0.128,
    0x3BF: 0.0639,
    0x3C1: 0.0958,
    0x3C2: 0.0958,
    0x3C4: 0.0319,
    0x3C5: 0.0319,
    0x3C6: 0.0958,
    0x3C7: 0.0639,
    0x3C8: 0.128,
    0x3D1: 0.0958,
    0x3D5: 0.0958,
    0x3F1: 0.0958,
    0x3F5: 0.0639
  },
  0x20: [0,0,250,0,0],               //  
  0xA0: [0,0,250,0,0],               //  
  0x393: [680,0,657,43,777],         // Γ
  0x394: [711,0,958,59,904],         // Δ
  0x398: [702,17,867,54,844],        // Θ
  0x39B: [711,0,806,44,776],         // Λ
  0x39E: [675,0,841,62,867],         // Ξ
  0x3A0: [680,0,982,43,1026],        // Π
  0x3A3: [686,0,885,69,902],         // Σ
  0x3A5: [703,0,671,32,802],         // Υ
  0x3A6: [686,0,767,29,737],         // Φ
  0x3A8: [686,0,714,22,790],         // Ψ
  0x3A9: [703,0,879,93,886],         // Ω
  0x3B1: [452,8,761,39,712],         // α
  0x3B2: [701,194,660,28,637],       // β
  0x3B3: [451,211,590,5,617],        // γ
  0x3B4: [725,8,522,39,513],         // δ
  0x3B5: [461,17,529,36,481],        // ε
  0x3B6: [711,202,508,48,521],       // ζ
  0x3B7: [452,211,600,24,600],       // η
  0x3B8: [702,8,562,40,554],         // θ
  0x3B9: [452,8,412,38,386],         // ι
  0x3BA: [452,8,668,45,642],         // κ
  0x3BB: [694,13,671,40,652],        // λ
  0x3BC: [452,211,708,33,682],       // μ
  0x3BD: [452,2,577,38,608],         // ν
  0x3BE: [711,201,508,23,490],       // ξ
  0x3BF: [452,8,585,39,576],         // ο
  0x3C0: [444,8,682,23,674],         // π
  0x3C1: [451,211,612,34,603],       // ρ
  0x3C2: [451,105,424,33,457],       // ς
  0x3C3: [444,8,686,35,677],         // σ
  0x3C4: [444,13,521,23,610],        // τ
  0x3C5: [453,8,631,24,604],         // υ
  0x3C6: [452,216,747,53,703],       // φ
  0x3C7: [452,201,718,32,685],       // χ
  0x3C8: [694,202,758,24,732],       // ψ
  0x3C9: [453,8,718,24,691],         // ω
  0x3D1: [701,8,692,24,656],         // ϑ
  0x3D5: [694,202,712,51,693],       // ϕ
  0x3D6: [444,8,975,23,961],         // ϖ
  0x3F1: [451,194,612,75,603],       // ϱ
  0x3F5: [444,7,483,44,450]          // ϵ
};

MathJax.OutputJax["HTML-CSS"].initFont("MathJax_Greek-bold-italic");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Greek/BoldItalic/Main.js");
