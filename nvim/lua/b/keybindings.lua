local k = require "astronauta.keymap"

local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap
local tnoremap = k.tnoremap
local tmap = k.tmap

vim.g.mapleader = " "

nnoremap {'Q', '<Nop>'}

inoremap {'jk', '<Esc>'}
inoremap {'<C-s>', '<C-o>:w<CR>'}
nnoremap {'<C-s>', ':w<CR>'}

vnoremap {">", ">gv"}
vnoremap {"<", "<gv"}
vnoremap {"J", ":m '>+1<CR>gv=gv"}
vnoremap {"K", ":m '<-2<CR>gv=gv"}
vnoremap {"<leader>y", '"+y'}
nnoremap {"<leader>/", ":noh<CR>"}

nnoremap {"J", ":BufPrev<CR>"}
nnoremap {"K", ":BufNext<CR>"}

nnoremap {"<C-p>", ":Telescope find_files<CR>"}

tnoremap {"jk", "<C-\\><C-n>"}

tmap {"<C-w>h", "jk<C-w>h"}
tmap {"<C-w>j", "jk<C-w>j"}
tmap {"<C-w>k", "jk<C-w>k"}
tmap {"<C-w>l", "jk<C-w>l"}
