require("paq")({
	"savq/paq-nvim",
	"lewis6991/impatient.nvim",
	"nvim-lua/plenary.nvim",

	"folke/tokyonight.nvim",
	"christoomey/vim-tmux-navigator",
	"nvim-lualine/lualine.nvim",

	"gpanders/editorconfig.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-eunuch",

	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			vim.cmd("TSUpdate")
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-ts-autotag",

	"kylechui/nvim-surround",
	"windwp/nvim-autopairs",

	"nvim-neo-tree/neo-tree.nvim",
	"kyazdani42/nvim-web-devicons",
	"MunifTanjim/nui.nvim",

	"j-hui/fidget.nvim",
	"VonHeikemen/lsp-zero.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"L3MON4D3/LuaSnip",
	"jose-elias-alvarez/null-ls.nvim",
	"b0o/SchemaStore.nvim",
	"echasnovski/mini.bracketed",

	"folke/neoconf.nvim",

	{ "chipsenkbeil/distant.nvim", branch = "v0.2" },

	"jcdickinson/codeium.nvim",
})
