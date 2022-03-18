local map = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "jk", "<Esc>")
map("i", "jj", "<Esc>")
map("i", "<C-s>", "<Esc>:w<CR>")
map("n", "<C-s>", ":w<CR>")
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<C-b>", ":NvimTreeToggle<CR>")

map("n", "<leader>/", ":nohl<CR>")
map("n", "J", ":BufferLineCyclePrev<CR>")
map("n", "K", ":BufferLineCycleNext<CR>")
map("n", "<BS>", "<C-^>")

map("v", "<leader>y", '"+y')
map("n", "<leader>dd", ":Bd<CR>")

--Add leader shortcuts
map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>s", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>/", ":nohl<CR>")

vim.cmd([[
function! ToggleQuickFix()
    if getqflist({'winid' : 0}).winid
        cclose
    else
        copen
    endif
endfunction
command! -nargs=0 -bar ToggleQuickFix call ToggleQuickFix()
]])

map("n", "<leader>q", ":ToggleQuickFix<CR>", nor)
