/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/Regular/AlphaPresentForms.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXGeneral'],
  {
    0xFB00: [683,0,605,20,655],        // ﬀ
    0xFB01: [683,0,558,32,523],        // ﬁ
    0xFB02: [683,0,556,31,522],        // ﬂ
    0xFB03: [683,0,832,20,797],        // ﬃ
    0xFB04: [683,0,830,20,796]         // ﬄ
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/Regular/AlphaPresentForms.js");
