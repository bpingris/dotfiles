vim.lsp.enable({
	"astro",
	"biome",
	"clangd",
	"gopls",
	"jsonls",
	"lua_ls",
	"marksma",
	"ols",
	"postgres-lsp",
	"ruff",
	"tailwindcss",
	"terraformls",
	-- "ts_ls",
	"ty",
	"zls",
	"ts_go_ls",
	-- "vtsls",
	"oxfmt",
	"oxlint",
})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, {})
