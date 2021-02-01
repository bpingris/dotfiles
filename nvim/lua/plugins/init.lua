vim.cmd('packadd paq-nvim')

local Paq = require('paq-nvim')
local paq = Paq.paq

paq {'savq/paq-nvim', opt=true}

paq 'christianchiarulli/nvcode-color-schemes.vim'
paq 'datwaft/bubbly.nvim'
paq 'kyazdani42/nvim-web-devicons'
paq 'kyazdani42/nvim-tree.lua'

paq {'junegunn/fzf', hook=function() vim.cmd(':call fzf#install()') end}
paq 'junegunn/fzf.vim'

paq {'nvim-treesitter/nvim-treesitter', hook=function() vim.cmd(':TSUpdate') end}
paq {'neoclide/coc.nvim', branch='release'}
paq 'romgrk/barbar.nvim'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-surround'
paq 'tpope/vim-commentary'

paq 'honza/vim-snippets'
paq 'mhinz/vim-signify'

paq 'jiangmiao/auto-pairs'
paq 'mbbill/undotree'

-- end plugins


require'plugins.colorscheme'
require'plugins.statusline'
require'plugins.treesitter'
require'plugins.fzf'
require'plugins.coc'
require'plugins.explorer'

