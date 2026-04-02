// ==UserScript==
// @name         Block Site with Status Check
// @match        *://*.youtube.com/*
// @grant        GM_xmlhttpRequest
// @connect      localhost
// @run-at       document-start
// ==/UserScript==


(function() {
    'use strict';

    GM_xmlhttpRequest({
        method: "GET",
        url: "http://localhost:8080/check",
    });
})();
