---@type vim.lsp.Config
return {
	cmd = { "typescript-language-server", "--stdio" },
	cmd_env = { NODE_OPTIONS = "--max-old-space-size=8192" },
	init_options = {
		maxTsServerMemory = 8192,
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
}
