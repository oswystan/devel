// ==UserScript==
// @name         feishu
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://*.feishu.cn/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=feishu.cn
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    window.addEventListener("load", (event) => {
        setTimeout(()=>{
            // console.log("DEBUG");
            let e = document.getElementById("zh-CN");
            if(e == null) {
                return;
            }
            e.style.fontFamily = "yuanti sc";
        }, 2000);
    });

})();

