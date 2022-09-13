local keymap = require("b.utils").keymap

keymap({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Stay in indent mode
keymap({ "v" }, ">", ">gv")
keymap({ "v" }, "<", "<gv")

-- Move text up and down
keymap({ "v" }, "K", ":m '<-2<CR>gv=gv")
keymap({ "v" }, "J", ":m '>+1<CR>gv=gv")

keymap({ "n" }, "<leader>/", ":nohl<CR>")

keymap({ "i" }, "jk", "<Esc>")

keymap({ "i", "n" }, "<C-s>", "<Esc>:w<CR>")

-- neotree
keymap({ "n" }, "<leader>b", ":NeoTreeFloatToggle<CR>")

local telescope = require("telescope.builtin")

keymap("n", "<leader>p", telescope.find_files)
keymap("n", "<leader>f", telescope.live_grep)
-- keymap("n", "<leader>b", telescope.buffers)
keymap("n", "<leader>o", "<C-^>")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
