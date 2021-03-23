require 'b.buffet'
-- require 'b.plugins'
vim.cmd("so " .. vim.fn.stdpath('config') .. '/plugins.vim')
require 'b.keybindings'
require 'b.options'
require 'b.lsp'
require 'b.treesitter'
require 'b.terminal'
require 'b.misc'

