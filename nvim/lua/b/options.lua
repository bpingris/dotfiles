local opt = vim.opt

opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.completeopt = "menuone,noselect"
opt.termguicolors = true
opt.wrap = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true
vim.cmd([[colorscheme nightfly]])

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
