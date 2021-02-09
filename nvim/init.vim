call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'lewis6991/gitsigns.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'

call plug#end()

colorscheme palenight

lua << EOF
require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitGutterAdd'},
    change       = {hl = 'GitGutterChange'},
    delete       = {hl = 'GitGutterDelete'},
    topdelete    = {hl = 'GitGutterDelete'},
    changedelete = {hl = 'GitGutterChange'},
  },
  numhl = false
})
EOF

let mapleader = " "

inoremap jk <Esc>
inoremap <silent> <C-s> <C-o>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>u :UndotreeShow<CR>
vnoremap <leader>y "+y
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap Q <Nop>
nnoremap J :BufferPrevious<CR>
nnoremap K :BufferNext<CR>
nmap <C-e> :BufferClose<CR>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup beben
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup end

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_follow = 1

command! GitPush Git -c push.default=current push
