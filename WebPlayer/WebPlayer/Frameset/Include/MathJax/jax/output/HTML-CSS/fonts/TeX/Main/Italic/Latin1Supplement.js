/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Main/Italic/Latin1Supplement.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Main-italic'],
  {
    0xA0: [0,0,250,0,0],               //  
    0xA3: [714,11,769,87,699]          // £
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Main/Italic/Latin1Supplement.js");
