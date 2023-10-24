// ==UserScript==
// @name         feishu
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  change base font family for feishu
// @author       wystan
// @match        https://*.feishu.cn/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=feishu.cn
// @grant        GM_addStyle
// ==/UserScript==
(function() {
    'use strict';

    window.addEventListener("load", (event) => {
        setTimeout(()=>{
            // console.log("DEBUG");
            let e = document.getElementById("zh-CN");
            if(!e) {
                e = document.getElementById("en-US");
            }
            if(e != null) {
                e.style.fontFamily = "sans";
            }
            // code block style
            GM_addStyle(".editor-kit-code-block .code-block-content {font-family: monospace; font-size: 1.2em;}");

            // inline code style
            GM_addStyle(".inline-code {font-family: monospace; font-size: 1.1em;}");
        }, 2000);
    });
})();
