if exists('g:vscode')
else
  imap jk <Esc>
syntax on

set relativenumber
set nu
set noerrorbells
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set clipboard=unnamedplus

call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'jwalton512/vim-blade'
Plug 'jiangmiao/auto-pairs'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'bagrat/vim-buffet'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'fatih/vim-go'

call plug#end()

let mapleader=" "

colorscheme nord

nnoremap <leader><space> :noh<CR>

"" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:NetrwOpen = 0

function! ToggleNetrw()
  if g:NetrwOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i -= 1
    endwhile
    let g:NetrwOpen=0
  else
    let g:NetrwOpen=1
    silent Lexplore
  endif
endfunction

nnoremap <silent> <C-b> :call ToggleNetrw()<CR>
inoremap <silent> <C-b> :call ToggleNetrw()<CR>


"" vim buffet
let g:buffet_always_show_tabline = 0

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=4 ctermfg=8 guibg=#00FF00 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=8 ctermfg=7 guibg=#00FF00 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=8 ctermfg=7 guibg=#00FF00 guifg=#000000
endfunction

"" CHADtree
nnoremap <C-b> :CHADopen<CR>
inoremap <C-b> :CHADopen<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <C-space> coc#refresh()

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <F2> <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

command! -nargs=0 Format :call CocAction('format')

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }


nnoremap <C-p> :Files<CR>
nnoremap <Leader>p :Buffers<CR>

map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>

nnoremap <M-j> :resize -2 <CR>
nnoremap <M-k> :resize +2 <CR>
nnoremap <M-h> :vertical resize -2 <CR>
nnoremap <M-l> :vertical resize +2 <CR>


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

endif
