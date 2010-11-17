/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/Bold/MiscMathSymbolsB.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXGeneral-bold'],
  {
    0x2980: [705,200,675,105,570],     // ⦀
    0x29B6: [634,130,864,50,814],      // ⦶
    0x29B7: [634,130,864,50,814],      // ⦷
    0x29B8: [634,130,864,50,814],      // ⦸
    0x29C0: [634,130,864,50,814],      // ⧀
    0x29C1: [634,130,864,50,814],      // ⧁
    0x29C4: [661,158,910,45,865],      // ⧄
    0x29C5: [661,158,910,45,865],      // ⧅
    0x29C6: [661,158,910,45,865],      // ⧆
    0x29C7: [661,158,910,45,865]       // ⧇
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/Bold/MiscMathSymbolsB.js");
