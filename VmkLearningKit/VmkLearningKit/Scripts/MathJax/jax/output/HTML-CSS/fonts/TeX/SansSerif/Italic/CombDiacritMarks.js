/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Italic/CombDiacritMarks.js
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
    0x30C: [654,-487,0,217,560]        // ̌
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Italic/CombDiacritMarks.js");
