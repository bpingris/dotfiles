vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.pack.add({
	"https://github.com/BirdeeHub/lze",
}, { load = true })

vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/nvim-mini/mini.bracketed",
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-rhubarb",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/folke/ts-comments.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/supermaven-inc/supermaven-nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
}, { load = function() end, confirm = true })

require("lze").load({
	{ "vim-fugitive", lazy = false },
	{ "vim-rhubarb", lazy = false },
	{ "vim-sleuth", lazy = false },
	{ "vim-tmux-navigator", lazy = false },

	{
		"nvim-tree.lua",
		keys = {
			{ "<leader>bo", ":NvimTreeFindFileToggle<cr>", silent = true },
			{ "<leader>bf", ":NvimTreeFindFile<cr>", silent = true },
		},
		after = function()
			require("nvim-tree").setup({ view = { side = "right" } })
		end,
	},

	{
		"tokyonight.nvim",
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
		"fzf-lua",
		keys = {
			{ "<leader>fp", ":FzfLua files<cr>" },
			{ "<leader>ff", ":FzfLua live_grep<cr>" },
		},
		after = function()
			require("fzf-lua").setup({
				previewers = {
					builtin = { syntax_limit_b = 1024 * 100 },
				},
				fzf_opts = { ["--cycle"] = true },
			})
			require("fzf-lua").register_ui_select()
		end,
	},
	{
		"mason.nvim",
		cmd = "Mason",
		after = function()
			require("mason").setup()
		end,
	},
	{
		"nvim-autopairs",
		event = "InsertEnter",
		after = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"mini.bracketed",
		lazy = false,
		after = function()
			require("mini.bracketed").setup()
		end,
	},
	{
		"nvim-surround",
		event = "DeferredUIEnter",
		after = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"ts-comments.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("ts-comments").setup()
		end,
	},
	{
		"conform.nvim",
		lazy = false,
		after = function()
			local get_js_formatter = function(bufnr)
				if require("conform").get_formatter_info("biome", bufnr).available then
					return { "biome", lsp_format = "never", stop_after_first = true }
				end
				return {}
			end

			require("conform").setup({
				notify_on_error = false,
				format_on_save = function(bufnr)
					local disable_filetypes = { c = true, cpp = true }
					return {
						timeout_ms = 2000,
						lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
					}
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					typescript = get_js_formatter,
					typescriptreact = get_js_formatter,
					javascript = get_js_formatter,
					javascriptreact = get_js_formatter,
					c = { "clang_format" },
				},
				clang_format = {
					prepend_args = { "--style=file", "--fallback-style=LLVM" },
				},
			})
		end,
	},
	{
		"nvim-treesitter",
		lazy = false,
		after = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"diff",
					"html",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"query",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "ruby" },
				},
				indent = { enable = true, disable = { "ruby" } },
				disable = function(_, buf)
					local max_file_size = 200 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_file_size then
						return true
					end
				end,
			})
		end,
	},
	{
		"blink.cmp",
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
		"supermaven-nvim",
		event = "InsertEnter",
		after = function()
			require("supermaven-nvim").setup({ keymaps = { accept_suggestion = "<C-o>" } })
		end,
	},

	{
		"oc",
		keys = {
			{ "<leader>oc", ":OC ", mode = { "v", "n" } },
			{ "<leader>os", require("oc").submit_prompt },
		},
		after = function()
			require("oc").setup()
		end,
	},
})
