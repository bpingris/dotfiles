local k = require "astronauta.keymap"

local nmap = k.nmap
local vmap = k.vmap
local omap = k.omap
local xmap = k.xmap
local tmap = k.tmap

local noremap = k.noremap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap
local tnoremap = k.tnoremap

vim.g.mapleader = " "

vim.cmd [[
function! FZFOpen(command_str)
  if (expand('%') =~# 'NvimTree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
]]

inoremap {'jk', '<Esc>'}
inoremap {'<C-s>', '<C-o>:w<CR>'}
nnoremap {'<C-s>', ':w<CR>'}

vnoremap {">", ">gv"}
vnoremap {"<", "<gv"}
vnoremap {"J", ":m '>+1<CR>gv=gv"}
vnoremap {"K", ":m '<-2<CR>gv=gv"}
vnoremap {"<leader>y", '"+y'}

nnoremap {"Q", "<Nop>"}
nnoremap {"<leader>/", ":noh<CR>"}

nnoremap {"<A-f>", ":call FZFOpen(':Ag')<CR>"}
nnoremap {"<C-p>", ":call FZFOpen(':Files')<CR>"}
nnoremap {"<leader>p", ":call FZFOpen(':GitFiles')<CR>"}

nnoremap {"<C-b>", ":NvimTreeToggle<CR>"}

nmap {"J", ":BufferLineCyclePrev<CR>"}
nmap {"K", ":BufferLineCycleNext<CR>"}
nmap {"<C-e>", ":bd<CR>"}
nmap {"<leader>/", ":noh<CR>"}

tnoremap {"<A-d>", "<C-\\><C-n>:lua require('terminal').toggle()<CR>"}
tnoremap {"jk", "<C-\\><C-n>"}
nnoremap {" <A-d>", ":lua require('terminal').toggle()<CR>"}

tmap {"<C-w>h", "jk<C-w>h"}
tmap {"<C-w>j", "jk<C-w>j"}
tmap {"<C-w>k", "jk<C-w>k"}
tmap {"<C-w>l", "jk<C-w>l"}

vim.cmd "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy'] "

nnoremap {"gd", ":lua vim.lsp.buf.definition()<CR>"}
nnoremap {"gi", ":lua vim.lsp.buf.implementation()<CR>"}
nnoremap {"gr", ":lua vim.lsp.buf.references()<CR>"}
nnoremap {"gn", ":Lspsaga rename<CR>"}
nnoremap {"gh", ":lua vim.lsp.buf.hover()<CR>"}
nnoremap {"gs", ":lua vim.lsp.buf.signature_help()<CR>"}
nnoremap {"<leader>a", ":Lspsaga code_action<CR>"}
nnoremap {"<leader>f", ":lua vim.lsp.buf.formatting()<CR>"}
nnoremap {"<leader>s", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"}
nnoremap {"d[", ":lua vim.lsp.diagnostic.goto_prev()<CR>"}
nnoremap {"d]", ":lua vim.lsp.diagnostic.goto_next()<CR>"}

vim.cmd[[
inoremap <expr> <C-Space> compe#complete()
inoremap <expr> <Tab> compe#confirm('<Tab>')
inoremap <expr> <C-e> compe#close('<C-e>')

imap <expr> <C-j> vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-j>'

" Expand or jump
imap <expr> <C-l> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

]]


