// ==UserScript==
// @description stop autoplay on Hooktube URLs
// @name HooktubeNoAutoplay
// @include *hooktube.com/watch*
// @author Unaligned Coder
// @version 0.1.5
// @license GPLv3 - http://www.gnu.org/licenses/gpl-3.0.txt
// @namespace https://github.com/unalignedcoder/Hooktube-No-Autoplay-Userscript/
// @downloadURL https://github.com/unalignedcoder/Hooktube-No-Autoplay-Userscript/raw/master/hooktube-no-autoplay.user.js
// @run-at document-start
// @grant none
// ==/UserScript==

// Copyright 2018 Unaligned Coder
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


function concat_ht(str) {
    str=str.concat("&autoplay=0");
    return str;
}

let loc = window.location.href;
if (!loc.endsWith("&autoplay=0")){loc = concat_ht(loc);}
if (window.location.href !== loc) {
    window.location.href = loc;
}
