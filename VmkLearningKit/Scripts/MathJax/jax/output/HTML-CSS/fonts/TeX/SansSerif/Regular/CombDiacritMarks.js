/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Regular/CombDiacritMarks.js
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
    0x30C: [654,-487,0,78,421]         // ̌
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Regular/CombDiacritMarks.js");
