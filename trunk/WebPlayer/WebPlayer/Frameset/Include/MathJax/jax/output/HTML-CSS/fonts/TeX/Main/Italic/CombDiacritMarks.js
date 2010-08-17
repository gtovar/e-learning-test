/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Italic/CombDiacritMarks.js
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
    0x300: [697,-500,0,289,437],       // ̀
    0x301: [697,-500,0,338,550],       // ́
    0x302: [694,-527,0,260,528],       // ̂
    0x303: [668,-558,0,246,571],       // ̃
    0x304: [590,-544,0,229,565],       // ̄
    0x306: [695,-515,0,274,573],       // ̆
    0x307: [669,-548,0,346,470],       // ̇
    0x308: [669,-554,0,260,556],       // ̈
    0x30A: [716,-542,0,312,514],       // ̊
    0x30B: [697,-503,0,263,576],       // ̋
    0x30C: [638,-501,0,275,540]        // ̌
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Italic/CombDiacritMarks.js");
