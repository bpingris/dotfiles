import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    oni.input.bind("<c-enter>", () => alert("Control+Enter was pressed"))
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
