// ==UserScript==
// @name         github
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       ticktechman
// @match        https://github.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=github.com
// @grant        GM_addStyle
// ==/UserScript==
GM_addStyle("body {font-family: sans;}");
GM_addStyle(".markdown-body, .etRDmr {font-family: sans;}");
GM_addStyle("pre, code, .blob-code, .blob-code-content, .blob-code-marker, .react-blob-print-hide, .react-code-text {font-family: monospace; font-size: 1.1em}");
(function() {
    'use strict';
    console.log("wystan:DEBUG");
    window.addEventListener("load", (event) => {
        setTimeout(()=>{
            GM_addStyle(".markdown-body, .etRDmr {font-family: sans;}");
        }, 1000);
    });
})();
