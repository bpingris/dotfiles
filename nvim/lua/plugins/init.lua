vim.cmd('packadd paq-nvim')

local Paq = require('paq-nvim')
local paq = Paq.paq

-- paq {'savq/paq-nvim', opt=true}
-- paq 'nvim-lua/plenary.nvim'

-- paq 'christianchiarulli/nvcode-color-schemes.vim'
-- paq 'datwaft/bubbly.nvim'
-- paq 'kyazdani42/nvim-web-devicons'
-- paq 'kyazdani42/nvim-tree.lua'

-- paq {'junegunn/fzf', hook=function() vim.cmd(':call fzf#install()') end}
-- paq 'junegunn/fzf.vim'

-- paq {'nvim-treesitter/nvim-treesitter', hook=function() vim.cmd(':TSUpdate') end}
-- paq {'neoclide/coc.nvim', branch='release'}
-- paq 'romgrk/barbar.nvim'
-- paq 'tpope/vim-fugitive'
-- paq 'tpope/vim-surround'
-- paq 'tpope/vim-commentary'

-- paq 'honza/vim-snippets'
-- paq 'lewis6991/gitsigns.nvim'
-- paq 'dart-lang/dart-vim-plugin'

-- paq 'mbbill/undotree'
-- paq 'fatih/vim-go'

-- -- -- paq "neovim/nvim-lspconfig"
-- -- -- paq "hrsh7th/nvim-compe"
-- -- -- paq "glepnir/lspsaga.nvim"
-- paq "tmsvg/pear-tree"

-- end plugins

-- require('plugins.lsp')

-- colorscheme
vim.cmd [[ set background=dark ]]
vim.cmd [[ colorscheme palenight ]]

-- statusline

vim.g.bubbly_palette = {
  background = "#292D3E",
  foreground = "#959dcb",
  black = "#434759",
  red = "#f07178",
  green = "#c3e88d",
  yellow = "#ffcb6b",
  blue = "#82aaff",
  purple = "#c792ea",
  cyan = "#89ddff",
  white = "#c5cdd9",
  lightgrey = "#57595e",
  darkgrey = "#404247",
}

-- treesitter
require'nvim-treesitter.configs'.setup{
  ensure_installed = 'all',
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

-- fzf
vim.cmd [[ let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7, 'highlight': 'Comment' } } ]]
vim.cmd [[ let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'" ]]

-- coc
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-snippets',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-emmet',
  'coc-css',
  'coc-flutter-tools',
  'coc-vetur',
  'coc-pyright'
}

-- explorer
vim.cmd('let g:nvim_tree_follow = 1')

-- gitsigns
require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitGutterAdd'},
    change       = {hl = 'GitGutterChange'},
    delete       = {hl = 'GitGutterDelete'},
    topdelete    = {hl = 'GitGutterDelete'},
    changedelete = {hl = 'GitGutterChange'},

  },
  numhl = false
})


