local opt = vim.opt

opt.number = true
opt.relativenumber = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.updatetime = 250
opt.termguicolors = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

opt.swapfile = false
opt.showmode = false

opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files
opt.undofile = true -- Enable persistent undo
opt.completeopt = { "menuone", "preview", "noinsert", "fuzzy" } -- Options for completion menu
opt.winborder = "rounded" -- Use rounded borders for windows
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.cursorline = true -- Highlight the current line
opt.tabstop = 4
opt.splitright = true
opt.splitbelow = false

opt.listchars = { tab = "| ", trail = "·", eol = "󰌑" }
opt.list = true -- Show whitespace characters

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation
vim.cmd.colorscheme("tokyonight-night") -- Set colorscheme
