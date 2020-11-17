" It requires neovim 0.5 (at least) as it uses neovim builtin lsp

let g:mapleader=' '

if exists('g:vscode')
	" hmmm nice
	source $HOME/.config/nvim/mappings.vim
	finish
endif


set hidden
set splitbelow
set splitright

set ttimeout
set ttimeoutlen=50

set updatetime=100
set undofile

set mouse=a


"" Commands
:command! Q q
:command! W w


source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/appearance.vim
source $HOME/.config/nvim/statusline.vim
source $HOME/.config/nvim/lsp.vim
