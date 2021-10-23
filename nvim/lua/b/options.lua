local opt = vim.opt

vim.g.mapleader = " "

opt.timeoutlen = 500
opt.hidden = true
opt.mouse = "a"

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.completeopt = "menu,menuone,noselect"
opt.swapfile = false

opt.undofile = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true

opt.pumheight = 10

opt.termguicolors = true
opt.wrap = false

 

vim.cmd[[
set shortmess+=c
syntax on
filetype plugin on
]]

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.go,*.c,*.h FormatWrite
-- augroup END
-- ]], true)
--
vim.cmd[[
function _Gci()
    execute 'silent !gci -local cocoon -w %'
    e
endfunction

command Gci :call _Gci()
]]

vim.cmd[[
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
]]
