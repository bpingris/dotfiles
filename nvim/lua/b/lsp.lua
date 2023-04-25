require("fidget").setup()

local cmp = require("cmp")
local lsp = require("lsp-zero")
local null_ls = require("null-ls")

lsp.preset("recommended")

-- cmp.setup({
-- 	{ name = "path" },
-- 	{ name = "nvim_lsp" },
-- 	{ keyword_length = 3, name = "buffer" },
-- 	{ keyword_length = 2, name = "luasnip" },
-- 	{ name = "codeium" },
-- })
--
local cmp_mapping = lsp.defaults.cmp_mappings()

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp_mapping["<C-p>"] = cmp.mapping.select_prev_item(cmp_select)
cmp_mapping["<C-n>"] = cmp.mapping.select_next_item(cmp_select)
cmp_mapping["<Tab>"] = cmp.mapping.confirm({ select = true })

local format_on_save = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			desc = "Auto format before save",
			pattern = "<buffer>",
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
			end,
		})
	end
end

lsp.setup_nvim_cmp({
	mapping = cmp_mapping,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "codeium" },
		{ name = "path" },
		{ keyword_length = 3, name = "buffer" },
		{ keyword_length = 2, name = "luasnip" },
	},
})

lsp.set_preferences({
	set_lsp_keymaps = false,
})

lsp.configure("tsserver", {
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,
})

lsp.configure("jsonls", {
	settings = {
		json = {
			format = {
				enable = true,
			},
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,
})

lsp.configure("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = { "className" },
			experimental = {
				classRegex = { "taxClassName" },
			},
		},
	},
})

local function get_python_path(workspace)
	local util = require("lspconfig/util")
	local path = util.path
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
		if match ~= "" then
			return path.join(path.dirname(match), "bin", "python")
		end
	end

	-- Fallback to system Python.
	return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end
lsp.configure("pyright", {
	before_init = function(_, config)
		local python_path = get_python_path(config.root_dir)
		print(python_path)
		config.settings.python.pythonPath = python_path
		vim.g.python_host_prog = python_path
		vim.g.python3_host_prog = python_path
	end,

	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lsp.on_attach(function(client, bufnr)
	format_on_save(client, bufnr)
	local map = function(mode, lhs, rhs)
		local opts = { remap = false, buffer = bufnr }
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- LSP actions
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
	map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
	map("n", "gr", "<cmd>Telescope lsp_references<cr>") --lua vim.lsp.buf.references()<cr>")
	map("n", "gn", "<cmd>lua vim.lsp.buf.rename()<cr>")
	map("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	map("x", "<leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

	-- Diagnostics
	map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
end)

local null_opts = lsp.build_options("null-ls", {
	on_attach = function(client, bufnr)
		format_on_save(client, bufnr)
	end,
})

null_ls.setup({
	on_attach = null_opts.on_attach,
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
	},
})

lsp.setup()
