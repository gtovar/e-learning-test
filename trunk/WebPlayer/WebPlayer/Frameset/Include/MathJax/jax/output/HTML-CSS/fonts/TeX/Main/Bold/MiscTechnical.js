/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Bold/MiscTechnical.js
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
    0x2308: [750,248,511,194,493],     // ⌈
    0x2309: [750,248,511,17,317],      // ⌉
    0x230A: [749,248,511,194,493],     // ⌊
    0x230B: [749,248,511,17,317],      // ⌋
    0x2322: [405,-108,1150,64,1084],   // ⌢
    0x2323: [393,-126,1150,64,1085]    // ⌣
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Bold/MiscTechnical.js");