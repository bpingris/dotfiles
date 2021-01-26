vim.cmd('packadd paq-nvim')

local paq = require'paq-nvim'.paq

paq {'savq/paq-nvim', opt=true}

paq 'christianchiarulli/nvcode-color-schemes.vim'
paq 'datwaft/bubbly.nvim'
paq 'kyazdani42/nvim-web-devicons'
paq 'kyazdani42/nvim-tree.lua'
-- paq {'junegunn/fzf', hook=function() vim.cmd('call fzf#install()')end }
-- paq 'junegunn/fzf.vim'

-- paq 'neovim/nvim-lsp'
-- paq 'neovim/nvim-lspconfig'
-- paq 'nvim-lua/completion-nvim'
-- paq {'ms-jpq/chadtree', branch='chad'} -- Run :CHADdeps after install
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

paq {'nvim-treesitter/nvim-treesitter', hook=function() vim.cmd('TSUpdate') end}
paq {'neoclide/coc.nvim', branch='release'}
paq 'romgrk/barbar.nvim'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-surround'

paq 'pantharshit00/vim-prisma'

paq 'honza/vim-snippets'

-- end plugins


require'plugins.colorscheme'
require'plugins.statusline'
-- require'plugins.lsp'
require'plugins.treesitter'
require'plugins.telescope'
require'plugins.coc'
require'plugins.explorer'
