local opt = vim.opt

vim.g.mapleader = " "

opt.timeoutlen = 500
opt.hidden = true
opt.mouse = "a"

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.completeopt = "menuone,noinsert,noselect"

opt.undofile = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.pumheight = 10

opt.termguicolors = true

 

vim.cmd[[
set shortmess+=c
syntax on
filetype plugin on

highlight Normal guibg=NONE ctermbg=NONE
]]

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.go,*.c,*.h FormatWrite
augroup END
]], true)
