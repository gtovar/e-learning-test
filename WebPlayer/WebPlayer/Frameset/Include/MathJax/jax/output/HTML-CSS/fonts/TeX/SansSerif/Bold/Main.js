/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/SansSerif/Bold/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_SansSerif-bold'] = {
  directory: 'SansSerif/Bold',
  family: 'MathJax_SansSerif',
  weight: 'bold',
  testString: "MathJax SansSerif",
  Ranges: [
    [0x0,0x7F,"BasicLatin"],
    [0x80,0xFFFF,"Other"],
    [0x300,0x36F,"CombDiacritMarks"]
  ]

};

MathJax.OutputJax["HTML-CSS"].initFont("MathJax_SansSerif-bold");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/SansSerif/Bold/Main.js");
