/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Typewriter/Regular/CombDiacritMarks.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Typewriter'],
  {
    0x300: [611,-485,0,116,330],       // ̀
    0x301: [611,-485,0,194,408],       // ́
    0x302: [612,-459,0,95,428],        // ̂
    0x303: [611,-466,0,87,437],        // ̃
    0x304: [578,-500,0,72,451],        // ̄
    0x306: [612,-503,0,79,447],        // ̆
    0x308: [612,-518,0,104,421],       // ̈
    0x30A: [619,-499,0,131,293],       // ̊
    0x30C: [577,-449,0,97,426]         // ̌
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Typewriter/Regular/CombDiacritMarks.js");
