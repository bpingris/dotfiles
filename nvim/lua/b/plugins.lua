local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[ packadd packer.nvim ]])
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = require("b.lsp"),
	})

	use({ "folke/tokyonight.nvim", config = require("b.tokyonight") })
	use({ "kylechui/nvim-surround", config = require("b.surround") })
	--
	use({ "windwp/nvim-autopairs", config = require("b.autopairs") })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		config = require("b.neotree"),
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	--
	use({
		"nvim-telescope/telescope.nvim",
		config = require("b.telescope"),
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = require("b.treesitter"),
		requires = { "nvim-treesitter/nvim-treesitter-context" },
	})
	use({
		"numToStr/Comment.nvim",
		config = require("b.comment"),
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
	})

	use({
		"christoomey/vim-tmux-navigator",
		"gpanders/editorconfig.nvim",
	})

	use({
		"tpope/vim-fugitive",
		"tpope/vim-rhubarb",
		"tpope/vim-eunuch",
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "WhoIsSethDaniel/lualine-lsp-progress.nvim" },
		config = require("b.lualine"),
	})

	if is_bootstrap then
		require("packer").sync()
	end
end)

if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("plugins.lua"),
})
