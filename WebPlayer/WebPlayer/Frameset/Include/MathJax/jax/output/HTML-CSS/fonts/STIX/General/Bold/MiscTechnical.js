/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/General/Bold/MiscTechnical.js
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
    0x2302: [774,0,926,55,871],        // ⌂
    0x2308: [731,193,469,164,459],     // ⌈
    0x2309: [731,193,469,10,305],      // ⌉
    0x230A: [732,193,469,164,459],     // ⌊
    0x230B: [732,193,469,10,305],      // ⌋
    0x2310: [399,-108,750,65,685],     // ⌐
    0x2319: [399,-108,750,65,685],     // ⌙
    0x2322: [378,-129,1026,37,990],    // ⌢
    0x2323: [378,-129,1026,37,990],    // ⌣
    0x2329: [732,193,445,69,399],      // 〈
    0x232A: [732,193,445,46,376],      // 〉
    0x2336: [751,156,926,85,841],      // ⌶
    0x233D: [694,190,924,80,844],      // ⌽
    0x233F: [732,200,728,55,673],      // ⌿
    0x23AF: [297,-209,315,0,315]       // ⎯
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/General/Bold/MiscTechnical.js");
