"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    oni.input.bind("<c-enter>", function () { return alert("Control+Enter was pressed"); });
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    //add custom config here, such as
    "ui.colorscheme": "onedark",
    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    //"oni.loadInitVim": false,
    "editor.fontSize": "16px",
    //"editor.fontFamily": "Monaco",
    "editor.fontFamily": "Droid Sans Mono",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "autoUpdate.enabled": true,
    "experimental.vcs.sidebar": true
};
