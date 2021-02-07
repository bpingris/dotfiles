set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nu
set number
set signcolumn=yes
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=4
set completeopt=menuone,noinsert,noselect

set updatetime=50
set shortmess+=c

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

call plug#end()

colorscheme palenight

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' -',
        color_devicons = true,
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-s>"] = actions.goto_file_selection_split,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-c>"] = actions.close,
                ["jk"] = actions.close,
            },
        }
    }
}
EOF

let mapleader = " "

inoremap jk <Esc>
nnoremap <A-f> :lua require('telescope.builtin').grep_string()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
inoremap <silent> <C-s> <C-o>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>u :UndotreeShow<CR>
vnoremap <leader>y "+y

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup beben
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup end
