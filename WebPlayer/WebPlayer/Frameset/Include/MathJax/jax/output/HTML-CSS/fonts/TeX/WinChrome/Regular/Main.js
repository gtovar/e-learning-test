/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/WinChrome/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_WinChrome'] = {
  directory: 'WinChrome/Regular',
  family: 'MathJax_WinChrome',
  testString: "@ B C T d "+String.fromCharCode(0x230A)+" "+String.fromCharCode(0x2A04),
  skew: {
    0x54: 0.0278
  },
  0x20: [0,0,250,0,0],               //  
  0x40: [705,11,778,56,722],         // @
  0x42: [687,0,818,39,753],          // B
  0x43: [705,21,716,150,812],        // C
  0x54: [717,69,545,34,834],         // T
  0x64: [694,11,511,100,567],        // d
  0xA0: [0,0,250,0,0],               //  
  0x230A: [40,1759,528,224,511],     // ⌊
  0x2A04: [0,1399,1111,55,1055]      // ⨄
};

MathJax.OutputJax["HTML-CSS"].initFont("MathJax_WinChrome");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/WinChrome/Regular/Main.js");
