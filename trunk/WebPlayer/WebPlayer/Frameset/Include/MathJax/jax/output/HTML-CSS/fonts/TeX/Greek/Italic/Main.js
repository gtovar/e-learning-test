/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Greek/Italic/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Greek-italic'] = {
  directory: 'Greek/Italic',
  family: 'MathJax_Greek',
  style: 'italic',
  testString: String.fromCharCode(0x393)+" "+String.fromCharCode(0x3A5)+" "+String.fromCharCode(0x39B),
  skew: {
    0x393: 0.0833,
    0x394: 0.167,
    0x398: 0.0833,
    0x39B: 0.167,
    0x39E: 0.0833,
    0x3A0: 0.0556,
    0x3A3: 0.0833,
    0x3A5: 0.0556,
    0x3A6: 0.0833,
    0x3A8: 0.0556,
    0x3A9: 0.0833,
    0x3B1: 0.0278,
    0x3B2: 0.0833,
    0x3B4: 0.0556,
    0x3B5: 0.0833,
    0x3B6: 0.0833,
    0x3B7: 0.0556,
    0x3B8: 0.0833,
    0x3B9: 0.0556,
    0x3BC: 0.0278,
    0x3BD: 0.0278,
    0x3BE: 0.111,
    0x3BF: 0.0556,
    0x3C1: 0.0833,
    0x3C2: 0.0833,
    0x3C4: 0.0278,
    0x3C5: 0.0278,
    0x3C6: 0.0833,
    0x3C7: 0.0556,
    0x3C8: 0.111,
    0x3D1: 0.0833,
    0x3D5: 0.0833,
    0x3F1: 0.0833,
    0x3F5: 0.0556
  },
  0x20: [0,0,250,0,0],               //  
  0xA0: [0,0,250,0,0],               //  
  0x393: [680,-1,615,31,721],        // Γ
  0x394: [716,0,833,48,788],         // Δ
  0x398: [704,22,763,50,740],        // Θ
  0x39B: [716,0,694,35,670],         // Λ
  0x39E: [678,0,742,53,777],         // Ξ
  0x3A0: [681,0,831,31,887],         // Π
  0x3A3: [683,0,780,58,806],         // Σ
  0x3A5: [705,0,583,28,700],         // Υ
  0x3A6: [683,0,667,24,642],         // Φ
  0x3A8: [683,0,612,21,692],         // Ψ
  0x3A9: [704,0,772,80,786],         // Ω
  0x3B1: [442,11,640,34,603],        // α
  0x3B2: [705,194,566,23,573],       // β
  0x3B3: [441,216,518,11,543],       // γ
  0x3B4: [717,10,444,36,451],        // δ
  0x3B5: [452,22,466,27,428],        // ε
  0x3B6: [704,204,438,44,471],       // ζ
  0x3B7: [442,216,497,21,503],       // η
  0x3B8: [705,10,469,35,462],        // θ
  0x3B9: [442,10,354,48,332],        // ι
  0x3BA: [442,11,576,49,554],        // κ
  0x3BB: [694,12,583,47,556],        // λ
  0x3BC: [442,216,603,23,580],       // μ
  0x3BD: [442,2,494,45,530],         // ν
  0x3BE: [704,205,438,21,443],       // ξ
  0x3BF: [441,11,485,34,476],        // ο
  0x3C0: [431,11,570,19,573],        // π
  0x3C1: [442,216,517,23,510],       // ρ
  0x3C2: [442,107,363,31,405],       // ς
  0x3C3: [431,11,571,31,572],        // σ
  0x3C4: [431,13,437,18,517],        // τ
  0x3C5: [443,10,540,21,523],        // υ
  0x3C6: [442,218,654,50,618],       // φ
  0x3C7: [442,204,626,25,600],       // χ
  0x3C8: [694,205,651,21,634],       // ψ
  0x3C9: [443,11,622,15,604],        // ω
  0x3D1: [705,11,591,21,563],        // ϑ
  0x3D5: [694,205,596,43,579],       // ϕ
  0x3D6: [431,10,828,19,823],        // ϖ
  0x3F1: [442,194,517,67,510],       // ϱ
  0x3F5: [431,11,406,40,382]         // ϵ
};

MathJax.OutputJax["HTML-CSS"].initFont("MathJax_Greek-italic");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Greek/Italic/Main.js");
