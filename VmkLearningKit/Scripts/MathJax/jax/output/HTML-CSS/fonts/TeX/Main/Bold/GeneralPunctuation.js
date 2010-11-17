/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Bold/GeneralPunctuation.js
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
    0x2006: [0,0,167,0,0],             //  
    0x2013: [300,-249,575,0,574],      // –
    0x2014: [300,-249,1150,0,1149],    // —
    0x2018: [694,-329,319,58,245],     // ‘
    0x2019: [694,-329,319,74,261],     // ’
    0x201C: [694,-329,603,110,564],    // “
    0x201D: [694,-329,603,38,492],     // ”
    0x2020: [702,211,511,64,446],      // †
    0x2021: [702,203,511,64,446],      // ‡
    0x2026: [171,-1,1295,74,1221],     // …
    0x2032: [563,-33,344,35,332]       // ′
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Bold/GeneralPunctuation.js");
