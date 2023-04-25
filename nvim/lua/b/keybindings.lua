local map = require("b.utils").keymap

map({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Stay in indent mode
map({ "v" }, ">", ">gv")
map({ "v" }, "<", "<gv")

-- Move text up and down
map({ "v" }, "K", ":m '<-2<CR>gv=gv")
map({ "v" }, "J", ":m '>+1<CR>gv=gv")

map({ "n" }, "<leader>/", ":nohl<CR>")

map({ "i" }, "jk", "<Esc>")

map({ "i", "n" }, "<C-s>", "<Esc>:w<CR>")

-- neotree
map({ "n" }, "<leader>b", ":NeoTreeFloatToggle<CR>")

local telescope = require("telescope.builtin")

map("n", "<leader>fp", telescope.find_files)
map("n", "<leader>ff", telescope.live_grep)
map("n", "<leader>fb", telescope.buffers)
map("n", "<leader>fs", telescope.lsp_document_symbols)

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "gp", "`[v`]")

map("n", "gx", function()
	vim.fn.jobstart({ "open", vim.fn.expand("<cfile>", nil, nil) }, { on_exit = function() end })
end)

map("n", "gh", "0")
map("n", "gl", "$")
map("v", "gh", "0")
map("v", "gl", "$")

require("mini.bracketed").setup()
