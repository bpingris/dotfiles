--[[ 
  vim.
    o  = global
    bo = buffer
    wo = window
]]
local g, o, wo, bo, cmd = vim.g, vim.o, vim.wo, vim.bo, vim.cmd

g.mapleader = ' '
wo.wrap = false
wo.number = true
wo.relativenumber = true

cmd('filetype plugin indent on')
cmd('syntax enable')

o.incsearch = true
o.hlsearch = false

o.backup = false
o.writebackup = false
o.swapfile = false
o.encoding = 'utf-8'

o.expandtab = true
bo.expandtab = true
o.tabstop = 2
bo.tabstop = 2
o.shiftwidth = o.tabstop
bo.shiftwidth = o.tabstop
o.softtabstop = o.tabstop
bo.softtabstop = o.tabstop

o.ignorecase = true
o.smartcase = true
o.lazyredraw = true
o.hidden = true
o.mouse = 'a'


cmd('set smartindent')

g.python3_host_prog = '/usr/bin/python3'
