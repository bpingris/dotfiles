local create_augroups = require'b.utils'.create_augroups
local opt = vim.opt

opt.relativenumber=true
opt.number=true
opt.scrolloff=4
opt.completeopt="menuone,noinsert,noselect"
opt.hidden=true
opt.updatetime=50
opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.wrap=false
opt.smartcase=true
opt.incsearch=false
opt.hlsearch=false
opt.swapfile=false
opt.backup=false
opt.undodir="~/.vim/undodir"
opt.undofile=true
opt.shortmess="filnxtToOFc"
opt.mouse="a"
opt.lazyredraw=true
opt.termguicolors=true

create_augroups{
    hightlight_yank = {
        "TextYankPost * silent! lua vim.highlight.on_yank{ timeout=300 }"
    },
    FiletypeIndentation = {
        "BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact"
    }
}

vim.cmd [[
syntax enable
colorscheme tokyonight

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %l:%c
set statusline+=\ 
]]

