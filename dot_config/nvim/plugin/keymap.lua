vim.keymap.set("n", "<space>", "<Nop>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "j", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })
vim.keymap.set("n", "k", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v" }, "gl", "$")
vim.keymap.set({ "n", "v" }, "gh", "0")
vim.keymap.set({ "n", "v" }, "ge", "G")

vim.keymap.set("n", "<esc>", ":noh<cr>")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("c", "<c-a>", "<home>")
vim.keymap.set("c", "<c-e>", "<end>")
vim.keymap.set("c", "<c-h>", "<left>")
vim.keymap.set("c", "<c-l>", "<right>")

vim.keymap.set("n", "<leader>af", "<C-6>")

vim.keymap.set("n", "<leader>qc", ":cclose<cr>")
vim.keymap.set("n", "<leader>qo", ":copen<cr>")

vim.keymap.set("n", "g/", "*")

vim.keymap.set("n", "H", "<nop>")
vim.keymap.set("n", "L", "<nop>")
