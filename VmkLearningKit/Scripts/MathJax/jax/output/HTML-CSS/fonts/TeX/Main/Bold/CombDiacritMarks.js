/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Bold/CombDiacritMarks.js
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
    0x300: [706,-503,0,114,338],       // ̀
    0x301: [706,-503,0,236,460],       // ́
    0x302: [694,-520,0,126,448],       // ̂
    0x303: [694,-551,0,96,478],        // ̃
    0x304: [607,-540,0,80,494],        // ̄
    0x306: [694,-500,0,102,472],       // ̆
    0x307: [695,-525,0,202,372],       // ̇
    0x308: [695,-535,0,96,478],        // ̈
    0x30A: [703,-536,0,160,414],       // ̊
    0x30B: [714,-511,0,133,493],       // ̋
    0x30C: [660,-515,0,130,444],       // ̌
    0x338: [711,210,0,160,733]         // ̸
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Bold/CombDiacritMarks.js");
