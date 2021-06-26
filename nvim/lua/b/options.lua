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
opt.incsearch=true
opt.hlsearch=true
opt.swapfile=false
opt.backup=false
opt.undofile=true
opt.shortmess="filnxtToOFc"
opt.mouse="a"
opt.lazyredraw=true
opt.termguicolors=true
opt.signcolumn="yes"

create_augroups{
    hightlight_yank = {
        "TextYankPost * silent! lua vim.highlight.on_yank{ timeout=300 }"
    }
}

vim.cmd [[
set undodir=~/.vim/undodir
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

