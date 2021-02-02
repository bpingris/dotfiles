--[[ 
  vim.
    o  = global
    bo = buffer
    wo = window
]]
local g, o, wo, bo, cmd = vim.g, vim.o, vim.wo, vim.bo, vim.cmd

function glob(opt, v)
  o[opt] = v
end

function win(opt, v)
  wo[opt] = v
  glob(opt, v)
end

function buf(opt, v)
  bo[opt] = v
  glob(opt, v)
end

g.mapleader = ' '
win('wrap', false)
win('number', true)
win('relativenumber', true)

cmd('filetype plugin indent on')
cmd('syntax enable')

glob('termguicolors', true)
glob('incsearch', true)
glob('hlsearch', false)
glob('backup', false)
glob('writebackup', false)
glob('swapfile', false)
glob('encoding', 'utf-8')

buf('expandtab', true)
buf('tabstop', 2)
buf('shiftwidth', 2)
buf('softtabstop', 2)

glob('ignorecase', true)
glob('smartcase', true)
glob('lazyredraw', true)
glob('hidden', true)
glob('mouse', 'a')

win('scrolloff', 4)

cmd('set smartindent')

cmd('set undodir=$HOME/.undodir')

cmd('set undofile')

g.python3_host_prog = '/usr/bin/python3'

