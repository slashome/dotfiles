// ==UserScript==
// @description Redirects Youtube URLs to Hooktube URLs
// @name HooktubeRedirect
// @include http://www.youtube.com/*
// @include https://www.youtube.com/*
// @version 0.1.0
// @run-at document-start
// @grant none
// ==/UserScript==

// Copyright 2017 Hyleus
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

function replace_beginning(str, beginning, replacement) {
    if (str.startsWith(beginning)) {
        return replacement + str.slice(beginning.length);
    }

    return str;
}

function urls_list(str) {
  return [str, "http://" + str, "https://" + str];
}

function replace_yt(str) {
    yt_list = [];
    yt_list = yt_list.concat(urls_list("www.youtube.com/watch"));

    yt_list.forEach((b) => {
        str = replace_beginning(str, b, "https://invidio.us/watch");
    });

    return str;
}

let loc = window.location.href;
loc = replace_yt(loc);
if (window.location.href !== loc) {
    window.location.href = loc;
}
