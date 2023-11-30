vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local read_local_config = function()
	local cwd = vim.fn.getcwd()
	local config_file_name = ".nvim-config.json"
	if vim.fn.filereadable(cwd .. config_file_name) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(cwd .. config_file_name))
	end
end

local local_config = read_local_config()

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	"christoomey/vim-tmux-navigator",

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {}, tag = "legacy" },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{ "windwp/nvim-autopairs", opts = {} },

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
		},
		enable = false,
	},

	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = "|",
				section_separators = "",
				globalstatus = true,
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		main = "ibl",
		opts = {
			indent = {
				char = "┊",
			},
			whitespace = {
				remove_blankline_trail = false,
			},
		},
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		"nvim-tree/nvim-tree.lua",
		keys = { { "<leader>b", ":NvimTreeFindFileToggle<cr>", desc = "NvimTree" } },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "right",
					width = 45,
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	-- require 'b.plugins.autoformat',
	require("b.theme"),
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
	require("b.telescope"),
	-- require("b.autoformat"),
	-- require("b.copilot"),
	require("b.codeium"),

	{
		"echasnovski/mini.bracketed",
		config = function()
			require("mini.bracketed").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		event = { "BufWritePre" },
		config = function()
			local prettier = { "biome", "eslint_d", "prettierd" }

			local default_formatters = {
				lua = { "stylua" },
				javascript = { prettier },
				javascriptreact = { prettier },
				typescript = { prettier },
				typescriptreact = { prettier },
				css = { prettier },
				html = { prettier },
				json = { prettier },
				jsonc = { prettier },
				yaml = { prettier },
				markdown = { prettier },
				python = { "ruff_format" },
				["_"] = { "trim_whitespace", "tim_newlines" },
			}

			if local_config then
				default_formatters = vim.tbl_deep_extend("force", default_formatters, local_config.formatters)
			end

			require("conform").setup({
				formatters_by_ft = default_formatters,
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			local default_linters = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "ruff" },
			}

			if local_config then
				default_linters = vim.tbl_deep_extend("force", default_linters, local_config.linters)
			end

			require("lint").linters_by_ft = default_linters

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
		enable = false,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 1,
			})
		end,
	},
}, {})

-- [[ Setting options ]]
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.completeopt = "menuone,noselect"
vim.opt.termguicolors = true
vim.opt.showtabline = 1
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.scrolloff = 5
vim.opt.winbar = "%f"

-- [[ Basic Keymaps ]]

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ "n", "v" }, "gh", "0", { silent = true })
vim.keymap.set({ "n", "v" }, "gl", "$", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-s>", "<esc>:update<cr>", { silent = true })
vim.keymap.set("n", "<leader>/", ":noh<cr>", { silent = true })

vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-l>", "<Right>")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

vim.keymap.set("i", "jk", "<Esc>")
-- See `:help telescope.builtin`

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
	sync_install = true,
	modules = {},
	ignore_install = {},
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "tsx", "typescript", "vimdoc", "vim" },

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = false,

	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("gn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- tsserver = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Setup neovim lua configuration

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers

local setup_lsp = function()
	require("neodev").setup()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	-- Ensure the servers above are installed
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

	mason_lspconfig.setup_handlers({
		function(server_name)
			local config = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
			}

			require("lspconfig")[server_name].setup(config)
		end,
	})

	-- nvim-cmp setup
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	luasnip.config.setup({})

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete({}),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping.complete(),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	})
end

local setup_coc = function()
	function _G.show_docs()
		local cw = vim.fn.expand("<cword>")
		if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
			vim.api.nvim_command("h " .. cw)
		elseif vim.api.nvim_eval("coc#rpc#ready()") then
			vim.fn.CocActionAsync("doHover")
		else
			vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
		end
	end

	function _G.check_back_space()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
	end

	local keyset = vim.keymap.set

	keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

	-- Add `:Format` command to format current buffer
	vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

	vim.api.nvim_create_augroup("CocGroup", {})
	vim.api.nvim_create_autocmd("CursorHold", {
		group = "CocGroup",
		command = "silent call CocActionAsync('highlight')",
		desc = "Highlight symbol under cursor on CursorHold",
	})

	local opts = { silent = true, nowait = true }
	keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
	keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
	-- GoTo code navigation
	keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
	keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
	keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
	keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
	keyset("n", "gn", "<Plug>(coc-rename)", { silent = true })
	keyset("i", "<c-n>", "coc#pum#visible() ? coc#pum#next(1) : coc#refresh()", { silent = true, expr = true })
	keyset("i", "<Tab>", 'coc#pum#visible() ? coc#pum#confirm() : "<Tab>"', { silent = true, expr = true })

	keyset("n", "<leader>ca", "<Plug>(coc-codeaction)", opts)
	keyset("n", "<leader>e", "<Plug>(coc-diagnostic-info)", opts)
end

-- setup_coc()

setup_lsp()

vim.g.nvim_tree_disable_netrw = 0

-- vim: ts=2 sts=2 sw=2 et
