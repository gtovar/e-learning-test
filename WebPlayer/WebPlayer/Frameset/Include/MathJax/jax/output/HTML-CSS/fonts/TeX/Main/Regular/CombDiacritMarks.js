/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Regular/CombDiacritMarks.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Main'],
  {
    0x300: [699,-505,0,106,295],       // ̀
    0x301: [699,-505,0,203,393],       // ́
    0x302: [694,-531,0,112,387],       // ̂
    0x303: [668,-565,0,83,416],        // ̃
    0x304: [590,-544,0,69,430],        // ̄
    0x306: [694,-515,0,92,407],        // ̆
    0x307: [669,-549,0,190,309],       // ̇
    0x308: [669,-554,0,95,404],        // ̈
    0x30A: [715,-542,0,147,352],       // ̊
    0x30B: [701,-510,0,122,420],       // ̋
    0x30C: [644,-513,0,114,385],       // ̌
    0x338: [716,215,0,139,638]         // ̸
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Regular/CombDiacritMarks.js");
