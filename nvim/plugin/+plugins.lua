vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazypack").setup({
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-rhubarb",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/christoomey/vim-tmux-navigator",

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
		"https://github.com/folke/ts-comments.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("ts-comments").setup()
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
		"https://github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		after = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input", "fff_input" },
			})
		end,
	},
	{
		"https://github.com/kylechui/nvim-surround",
		event = "DeferredUIEnter",
		after = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"https://github.com/nvim-mini/mini.bracketed",
		after = function()
			require("mini.bracketed").setup()
		end,
	},
	{
		"https://github.com/stevearc/conform.nvim",
		after = function()
			local get_js_formatter = function(bufnr)
				if require("conform").get_formatter_info("oxfmt", bufnr).available then
					return { "oxfmt", lsp_format = "never", stop_after_first = true }
				end
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
		"https://github.com/mason-org/mason.nvim",
		after = function()
			require("mason").setup()
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

	{
		"https://github.com/nvim-treesitter/nvim-treesitter",
		after = function()
			local ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"typescript",
			}

			local already_installed = require("nvim-treesitter.config").get_installed()
			local available_parsers = require("nvim-treesitter").get_available()

			local parsers_to_install = vim.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(already_installed, parser)
				end)
				:totable()

			require("nvim-treesitter").install(parsers_to_install)

			local function treesitter_try_attach(buf, language)
				if not vim.treesitter.language.add(language) then
					return
				end
				vim.treesitter.start(buf, language)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- enables treesitter based folds
				-- for more info on folds see `:help folds`
				-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- vim.wo.foldmethod = "expr"
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local buf, filetype = args.buf, args.match

					local language = vim.treesitter.language.get_lang(filetype)
					if not language then
						return
					end

					local installed_parsers = require("nvim-treesitter").get_installed("parsers")

					if vim.tbl_contains(installed_parsers, language) then
						treesitter_try_attach(buf, language)
					elseif vim.tbl_contains(available_parsers, language) then
						require("nvim-treesitter").install(language):await(function()
							treesitter_try_attach(buf, language)
						end)
					else
						treesitter_try_attach(buf, language)
					end
				end,
			})
		end,
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		if event.data.updated then
			require("fff.download").download_or_build_binary()
		end
	end,
})
