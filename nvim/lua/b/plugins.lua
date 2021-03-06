vim.cmd 'packadd paq-nvim'         -- Load package

local Paq = require('paq-nvim')
local paq = Paq.paq
paq {'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq {'junegunn/fzf', run=function() vim.cmd(":call fzf#install()") end}
paq 'junegunn/fzf.vim'

paq 'nvim-lua/plenary.nvim'
paq 'tjdevries/astronauta.nvim'

paq 'b3nj5m1n/kommentary'

paq 'tpope/vim-surround'

paq 'ulwlu/elly.vim'

paq 'nvim-treesitter/nvim-treesitter'
paq 'neovim/nvim-lspconfig'
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'glepnir/lspsaga.nvim'

paq 'akinsho/flutter-tools.nvim'
paq 'akinsho/nvim-toggleterm.lua'

paq 'bagrat/vim-buffet'

paq 'windwp/nvim-autopairs'

paq 'lewis6991/gitsigns.nvim'

paq 'kyazdani42/nvim-tree.lua'
paq 'kyazdani42/nvim-web-devicons'
