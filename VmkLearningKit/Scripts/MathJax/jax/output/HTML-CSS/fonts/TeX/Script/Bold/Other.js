/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Script/Bold/Other.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Script-bold'],
  {
    0xA0: [0,0,250,0,0],               //  
    0xA7: [700,106,582,63,509],        // §
    0x2111: [698,9,627,31,596],        // ℑ
    0x211C: [704,12,936,30,936],       // ℜ
    0x2135: [689,-1,875,88,779]        // ℵ
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Script/Bold/Other.js");
