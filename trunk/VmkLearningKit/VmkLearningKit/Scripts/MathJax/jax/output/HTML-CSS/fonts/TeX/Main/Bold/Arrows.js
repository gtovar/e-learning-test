/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Bold/Arrows.js
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
    0x2190: [519,18,1150,64,1085],     // ←
    0x2191: [694,193,575,13,562],      // ↑
    0x2192: [519,18,1150,65,1085],     // →
    0x2193: [694,194,575,13,562],      // ↓
    0x2194: [519,18,1150,64,1085],     // ↔
    0x2195: [767,267,575,13,562],      // ↕
    0x2196: [724,195,1150,64,1084],    // ↖
    0x2197: [724,193,1150,64,1086],    // ↗
    0x2198: [695,224,1150,65,1085],    // ↘
    0x2199: [694,224,1150,64,1085],    // ↙
    0x21A6: [519,18,1150,65,1085],     // ↦
    0x21A9: [519,18,1282,64,1219],     // ↩
    0x21AA: [519,18,1282,65,1217],     // ↪
    0x21BC: [518,-220,1150,64,1084],   // ↼
    0x21BD: [281,17,1150,64,1084],     // ↽
    0x21C0: [518,-220,1150,65,1085],   // ⇀
    0x21C1: [281,17,1150,64,1085],     // ⇁
    0x21CC: [718,17,1150,64,1085],     // ⇌
    0x21D0: [548,46,1150,63,1085],     // ⇐
    0x21D1: [694,194,703,29,672],      // ⇑
    0x21D2: [548,47,1150,64,1084],     // ⇒
    0x21D3: [694,194,703,30,673],      // ⇓
    0x21D4: [548,46,1150,47,1102],     // ⇔
    0x21D5: [768,267,703,29,673]       // ⇕
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Bold/Arrows.js");
