imap jk <Esc>
imap jj <Esc>

vnoremap <s-k> :move-2<CR>gv
vnoremap <s-j> :move'>+<CR>gv

nnoremap H ^
nnoremap L $

nnoremap <leader>/ :noh<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>p "*p
vnoremap <leader>y "*y
nnoremap <leader>i :Neoformat<cr>
"nnoremap <leader>p :Files<cr>
nnoremap <leader>p :lua require'telescope.builtin'.git_files()<cr>
nnoremap <leader>p :lua require'telescope.builtin'.find_files()<cr>

inoremap <c-s> <c-o>:update<cr>
nnoremap <c-s> :update<cr>

nnoremap <silent> <c-b> :LuaTreeToggle<cr>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

nnoremap <S-j> :BufferPrevious<cr>
nnoremap <S-k> :BufferNext<cr>
nnoremap <S-q> :BufferClose<cr>
