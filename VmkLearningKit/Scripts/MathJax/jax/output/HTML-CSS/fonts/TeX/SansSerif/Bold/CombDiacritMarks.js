/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Bold/CombDiacritMarks.js
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
    0x30C: [658,-500,50,108,441]       // ̌
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Bold/CombDiacritMarks.js");
