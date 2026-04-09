-- Example: How to use lazypack to replace the two-step workflow
-- This file demonstrates the new simplified API

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazypack").setup({
	-- Simple plugins - loaded immediately
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-rhubarb",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/christoomey/vim-tmux-navigator",

	-- Complex plugins with lazy loading and setup
	{
		"https://github.com/nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>bo", ":NvimTreeFindFileToggle<cr>", silent = true },
			{ "<leader>bf", ":NvimTreeFindFile<cr>", silent = true },
		},
		after = function()
			require("nvim-tree").setup({ view = { side = "right" } })
		end,
	},

	{
		"https://github.com/folke/tokyonight.nvim",
		colorscheme = "tokyonight-night",
		after = function()
			require("tokyonight").setup({
				transparent = true,
				on_highlights = function(hl)
					local fg = "#928f8e"
					hl.LineNrAbove = { fg = fg }
					hl.LineNrBelow = { fg = fg }
				end,
			})
		end,
	},

	{
		"https://github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		after = function()
			require("nvim-autopairs").setup()
		end,
	},

	{
		"https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
		event = "InsertEnter",
		after = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "default",
					["<tab>"] = { "select_and_accept", "fallback" },
					["<c-h>"] = { "snippet_backward", "fallback" },
					["<c-l>"] = { "snippet_forward", "fallback" },
				},
				completion = { documentation = { auto_show = true } },
				signature = { enabled = true },
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
			})
		end,
	},

	{
		"https://github.com/supermaven-inc/supermaven-nvim",
		event = "InsertEnter",
		after = function()
			require("supermaven-nvim").setup({
				keymaps = { accept_suggestion = "<C-o>" },
				ignore_filetypes = { "fff_input" },
			})
		end,
	},

	{
		"https://github.com/dmtrKovalenko/fff.nvim",
		keys = {
			{
				"<leader>fp",
				function()
					require("fff").find_files()
				end,
			},
			{
				"<leader>ff",
				function()
					require("fff").live_grep()
				end,
			},
		},
	},

	-- Add more plugins as needed...
})

-- Optional: Keep the PackChanged autocmd if needed
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		if event.data.updated then
			require("fff.download").download_or_build_binary()
		end
	end,
})
