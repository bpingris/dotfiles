return function()
	local lspconfig = require("lspconfig")
	local null_ls = require("null-ls")
	local keymap = require("b.utils").keymap

	local custom_config = function(server_name, client)
		if server_name == "tsserver" or server_name == "sumneko_lua" then
			client.server_capabilities.documentFormattingProvider = false
		end
	end

	local custom_settings = {
		sumneko_lua = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			},
		},
	}

	vim.api.nvim_create_user_command("LspFormat", function()
		vim.lsp.buf.format()
	end, {})

	local on_attach = function(_, bufnr)
		local map = function(mode, lhs, rhs)
			keymap(mode, lhs, rhs, { buffer = bufnr })
		end
		local lsp_cmd = function(cmd)
			return ":lua vim.lsp." .. cmd .. "<cr>"
		end
		local diag_cmd = function(cmd)
			return ":lua vim.diagnostic." .. cmd .. "<cr>"
		end

		map("n", "gh", "")
		map("n", "gd", lsp_cmd("buf.definition()"))
		map("n", "gh", lsp_cmd("buf.hover()"))
		map("n", "gr", ":Telescope lsp_references<cr>")
		map("n", "gn", lsp_cmd("buf.rename()"))
		map("n", "<leader>k", lsp_cmd("buf.signature_help()"))
		map("n", "<leader>a", lsp_cmd("buf.code_action()"))
		map("x", "<leader>a", lsp_cmd("buf.range_code_action()"))

		map("n", "<leader>e", diag_cmd("open_float()"))
		map("n", "d[", diag_cmd("goto_prev()"))
		map("n", "d]", diag_cmd("goto_next()"))
	end

	require("mason").setup()
	require("mason-lspconfig").setup()
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = function(c, b)
					custom_config(server_name, c)
					on_attach(c, b)
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = custom_settings[server_name],
			})
		end,
	})
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local code_actions = null_ls.builtins.code_actions

	null_ls.setup({
		sources = {
			formatting.eslint_d,
			diagnostics.eslint_d,
			code_actions.eslint_d,
			formatting.stylua,
		},
		on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					desc = "Auto format before save",
					pattern = "<buffer>",
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end
