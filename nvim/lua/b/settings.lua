local options = {
	backup = false,
	clipboard = "unnamedplus",
	completeopt = { "menu", "menuone", "noselect" },
	conceallevel = 2,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 1,
	smartcase = true,
	smartindent = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 200,
	writebackup = false,
	expandtab = true,
	shiftwidth = 3,
	tabstop = 3,
	cursorline = false,
	number = true,
	relativenumber = true,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 5,
	spell = false,
	list = true,
	listchars = { tab = "│ " },
	fillchars = { eob = " " },
	winbar = "%f",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Use proper syntax highlighting in code blocks
local fences = {
	"lua",
	-- "vim",
	"json",
	"typescript",
	"typescriptreact",
	"tsx=typescriptreact",
	"javascript",
	"javascriptreact",
	"jsx=javascriptreact",
	"js=javascript",
	"ts=typescript",
	"shell=sh",
	"python",
	"sh",
	"console=sh",
}
vim.g.markdown_fenced_languages = fences
vim.g.markdown_recommended_style = 0

-- don't load the plugins below
local builtins = {
	"gzip",
	"zip",
	"zipPlugin",
	"fzf",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"matchit",
	"logiPat",
	"rrhelper",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
}

for _, plugin in ipairs(builtins) do
	vim.g["loaded_" .. plugin] = 1
end
