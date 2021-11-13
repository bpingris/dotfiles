if true then
    require("github-theme").setup(
        {
            theme_style = "dark_default",
            hide_end_of_buffer = false
        }
    )

    vim.cmd [[
highlight Normal guibg=NONE ctermbg=NONE
]]
end
