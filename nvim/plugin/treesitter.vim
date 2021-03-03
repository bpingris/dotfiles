lua << EOF

require'nvim-treesitter.configs'.setup{
    ensure_installed = {'bash', 'c', 'cpp', 'go', 'javascript', 'json', 'lua', 'typescript', 'dart'},
    highlight = {
        enable = true,
        disable = {"go"}
    },
    indent = {
        enable = false,
        disable = {"go"}
    },
    rainbow = {
        enable = true,
        disable = {"go"}
    },
}

EOF
