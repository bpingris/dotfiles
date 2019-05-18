import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    oni.input.bind("<c-a>", () => alert("Control+Enter was pressed"));

    const currentFile = () => oni.editors.activeEditor.activeBuffer.filePath;
    const currentExtension = () =>
        oni.editors.activeEditor.activeBuffer.language;
    const currentProject = () => oni.workspace.activeWorkspace;

    const isVisualMode = () => oni.editors.activeEditor.mode === "visual";
    const isNormalMode = () => oni.editors.activeEditor.mode === "normal";
    const isNotInsertMode = () => oni.editors.activeEditor.mode !== "insert";
    const isNotCommandLine = () =>
        oni.editors.activeEditor.mode !== "cmdline_normal";
    const isMenuOpen = () => oni.menu.isMenuOpen();

    oni.input.bind("<s-c-6>", "sidebar.decreaseWidth")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
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
    "experimental.vcs.sidebar": true,
}
