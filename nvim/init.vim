call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/astronauta.nvim'

Plug 'b3nj5m1n/kommentary'

Plug 'tpope/vim-surround'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'akinsho/flutter-tools.nvim'
Plug 'akinsho/nvim-toggleterm.lua'

Plug 'windwp/nvim-autopairs'

Plug 'lewis6991/gitsigns.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ayu-theme/ayu-vim'

Plug 'sbdchd/neoformat'

Plug 'akinsho/nvim-bufferline.lua'

call plug#end()

lua require'lol'
