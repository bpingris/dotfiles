"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    oni.input.bind("<c-a>", function () { return alert("Control+Enter was pressed"); });
    var currentFile = function () { return oni.editors.activeEditor.activeBuffer.filePath; };
    var currentExtension = function () {
        return oni.editors.activeEditor.activeBuffer.language;
    };
    var currentProject = function () { return oni.workspace.activeWorkspace; };
    var isVisualMode = function () { return oni.editors.activeEditor.mode === "visual"; };
    var isNormalMode = function () { return oni.editors.activeEditor.mode === "normal"; };
    var isNotInsertMode = function () { return oni.editors.activeEditor.mode !== "insert"; };
    var isNotCommandLine = function () {
        return oni.editors.activeEditor.mode !== "cmdline_normal";
    };
    var isMenuOpen = function () { return oni.menu.isMenuOpen(); };
    oni.input.bind("<s-c-6>", "sidebar.decreaseWidth");
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
