/*************************************************************
 *
 *  MathJax/jax/output/HTML-CSS/fonts/TeX/Script/Regular/BasicLatin.js
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
  MathJax.OutputJax['HTML-CSS'].FONTDATA.FONTS['MathJax_Script'],
  {
    0x20: [0,0,250,0,0],               //  
    0x41: [688,14,771,-8,737],         // A
    0x42: [714,3,761,42,682],          // B
    0x43: [700,15,603,70,561],         // C
    0x44: [718,-5,830,48,762],         // D
    0x45: [707,11,608,69,530],         // E
    0x46: [702,14,649,37,707],         // F
    0x47: [698,132,604,73,524],        // G
    0x48: [695,13,885,33,877],         // H
    0x49: [690,14,431,28,402],         // I
    0x4A: [698,129,506,27,467],        // J
    0x4B: [698,12,823,30,796],         // K
    0x4C: [697,7,715,31,632],          // L
    0x4D: [700,26,982,26,959],         // M
    0x4E: [706,14,774,28,801],         // N
    0x4F: [685,21,708,71,630],         // O
    0x50: [719,11,661,43,637],         // P
    0x51: [702,26,663,74,615],         // Q
    0x52: [720,8,723,31,709],          // R
    0x53: [706,17,542,46,480],         // S
    0x54: [696,12,587,26,666],         // T
    0x55: [698,16,714,25,689],         // U
    0x56: [709,14,665,28,637],         // V
    0x57: [709,9,989,25,962],          // W
    0x58: [711,11,717,49,693],         // X
    0x59: [703,138,596,26,499],        // Y
    0x5A: [700,16,657,58,632],         // Z
    0x7B: [730,177,320,-3,292],        // {
    0x7D: [735,177,320,21,321]         // }
  }
);

MathJax.Ajax.loadComplete(MathJax.OutputJax["HTML-CSS"].fontDir + "/Script/Regular/BasicLatin.js");
