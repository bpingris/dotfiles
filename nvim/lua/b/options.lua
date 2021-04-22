local apply_options = require'b.utils'.apply_options
local create_augroups = require'b.utils'.create_augroups

apply_options{
	relativenumber=true,
	number=true,
	scrolloff=4,
	exrc=true,
	completeopt="menuone,noinsert,noselect",
	hidden=true,
	updatetime=50,
	tabstop=4,
	softtabstop=4,
	shiftwidth=4,
	expandtab=true,
	wrap=false,
	smartcase=true,
	incsearch=false,
	hlsearch=false,
	swapfile=false,
	backup=false,
	undodir="~/.vim/undodir",
	undofile=true,
	shortmess="filnxtToOFc",
	mouse="a",
    lazyredraw=true,
    termguicolors=true
}

create_augroups{
    hightlight_yank = {
        "TextYankPost * silent! lua vim.highlight.on_yank{ timeout=300 }"
    }
}

vim.cmd [[
syntax enable
colorscheme one-nvim

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

