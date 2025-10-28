vim.lsp.enable({
	"lua_ls",
	"gopls",
	"ts_ls",
	"biome",
	"tailwindcss",
	"jsonls",
	"terraformls",
})

vim.diagnostic.config({ virtual_text = true })

local get_active_lsp_clients = function()
	local clients = vim.lsp.get_clients()
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return names
end

vim.api.nvim_create_user_command("LspRestart", function(info)
	vim.lsp.enable(info.fargs, false)

	local timer = assert(vim.uv.new_timer())

	timer:start(500, 0, function()
		for _, name in ipairs(info.fargs) do
			vim.schedule_wrap(function(x)
				vim.lsp.enable(x)
			end)(name)
		end
	end)
end, {

	desc = "Manually restart the given language client(s)",
	nargs = "?",
	complete = get_active_lsp_clients,
})

vim.api.nvim_create_user_command("LspStop", function(info)
	vim.lsp.enable(info.fargs, false)
end, {
	desc = "Stop the given language client(s)",
	nargs = "?",
	complete = get_active_lsp_clients,
})

local get_lsp_clients = function(arg)
	return vim.iter(vim.api.nvim_get_runtime_file(("lsp/%s*.lua"):format(arg), true))
		:map(function(path)
			local file_name = path:match("[^/]*.lua$")
			return file_name:sub(0, #file_name - 4)
		end)
		:totable()
end

vim.api.nvim_create_user_command("LspStart", function(info)
	vim.lsp.enable(info.fargs)
end, {
	desc = "Start the given language client",
	nargs = "?",
	complete = get_lsp_clients,
})

-- vim.lsp.config("ts_go_ls", {
-- 	cmd = { vim.loop.os_homedir() .. "/work/typescript-go/built/local/tsgo", "--lsp", "-stdio" },
-- 	filetypes = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"javascript.jsx",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"typescript.tsx",
-- 	},
-- 	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
-- })
-- vim.lsp.enable("ts_go_ls")
