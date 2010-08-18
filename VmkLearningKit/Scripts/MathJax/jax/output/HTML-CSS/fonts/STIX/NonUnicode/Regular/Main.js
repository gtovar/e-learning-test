/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/STIX/NonUnicode/Regular/Main.js
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

MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['STIXNonUnicode'] = {
  directory: 'NonUnicode/Regular',
  family: 'STIXNonUnicode',
  Ranges: [
    [0xE000,0xF8FF,"PrivateUse"]
  ],
  0xE000: [610,25,1184,829,895],     // 
  0xE001: [667,-41,1184,829,1211],   // 
  0xE138: [634,-584,480,-10,490],    // 
  0xE139: [-127,177,480,-10,490],    // 
  0xE13B: [955,-512,897,-25,908],    // 
  0xE13C: [955,-512,897,-11,922],    // 
  0xE13D: [182,261,897,-25,908],     // 
  0xE13E: [182,261,897,-11,922],     // 
  0xE140: [1218,-820,1844,-10,1854], // 
  0xE141: [-126,524,1844,-10,1854],  // 
  0xE14A: [955,-820,633,-1,634],     // 
  0xE14B: [-126,261,633,-1,634],     // 
  0xE261: [422,10,523,41,481],       // 
  0xE265: [421,0,523,127,405],       // 
  0xE269: [421,0,523,68,455],        // 
  0xE26D: [424,198,523,47,463],      // 
  0xE271: [420,198,523,58,480],      // 
  0xE275: [421,198,523,66,457],      // 
  0xE279: [612,8,523,37,486],        // 
  0xE27D: [421,198,523,25,490],      // 
  0xE281: [606,12,523,47,477],       // 
  0xE285: [421,200,523,41,483],      // 
  0xE28F: [135,0,325,-1,326],        // 
  0xE290: [135,0,633,-1,634]         // 
};

MathJax.OutputJax["HTML-CSS"].initFont("STIXNonUnicode");

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/NonUnicode/Regular/Main.js");
