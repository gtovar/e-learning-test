/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/Regular/PhoneticExtensions.js
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
    0x1D00: [468,0,510,15,495],        // ᴀ
    0x1D07: [464,0,504,21,481],        // ᴇ
    0x1D1C: [464,14,583,21,560],       // ᴜ
    0x1D81: [683,287,528,27,491],      // ᶁ
    0x1D84: [683,287,542,7,505],       // ᶄ
    0x1D85: [683,287,294,19,257],      // ᶅ
    0x1D8A: [459,287,389,51,348],      // ᶊ
    0x1D8D: [450,287,516,17,479],      // ᶍ
    0x1D8E: [450,287,453,27,416]       // ᶎ
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/Regular/PhoneticExtensions.js");
