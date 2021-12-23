require("lualine").setup(
    {
        options = {
            theme = "tokyonight",
            -- section_separators = {left = "", right = ""}, -- e0b4 / e0b6 : https://www.nerdfonts.com/cheat-sheet
            -- component_separators = {left = "", right = ""} -- e0b5 / e0b7
            section_separators = {left = "", right = ""}, -- e0b4 / e0b6 : https://www.nerdfonts.com/cheat-sheet
            component_separators = {left = "", right = ""} -- e0b5 / e0b7
        },
        sections = {
            lualine_x = {"filetype"}
        }
    }
)
