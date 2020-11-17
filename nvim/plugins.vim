call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiangmiao/auto-pairs'
Plug 'arcticicestudio/nord-vim'

Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'kyazdani42/nvim-tree.lua'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'

Plug 'romgrk/barbar.nvim'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

let g:neoformat_javascript_prettier = {
    \ 'exe': './node_modules/.bin/prettier',
    \ 'args': ['--stdin-filepath %:p', '--config $(./node_modules/.bin/prettier --find-config-path %:p)'],
    \ 'stdin': 1,
    \ }
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']

