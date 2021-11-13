local map = vim.api.nvim_set_keymap

local nor = {noremap = true, silent = true}

map("i", "jk", "<Esc>", nor)

map("i", "<C-s>", "<Esc>:w<CR>", nor)
map("n", "<C-s>", ":w<CR>", nor)

map("v", "<", "<gv", nor)
map("v", ">", ">gv", nor)

map("n", "<C-p>", ":Telescope find_files<CR>", nor)
map("n", "<leader>s", ":Telescope live_grep<CR>", nor)
map("n", "<leader>b", ":Telescope buffers<CR>", nor)

map("n", "<leader>/", ":noh<CR>", nor)

map("v", "<leader>y", '"+y', nor)

map("n", "<C-b>", ":NvimTreeToggle<CR>", nor)

map("n", "<leader>fd", ":Telescope lsp_document_diagnostics<CR>", nor)
map("n", "<leader>fr", ":Telescope lsp_references<CR>", nor)
map("n", "<leader>fp", ":Telescope commands<CR>", nor)

map("n", "<leader>gii", ":GoImpl<CR> ", nor)
map("n", "<leader>gie", ":GoImplements<CR> ", nor)

vim.cmd [[
function! ToggleQuickFix()
    if getqflist({'winid' : 0}).winid
        cclose
    else
        copen
    endif
endfunction

command! -nargs=0 -bar ToggleQuickFix call ToggleQuickFix()
]]

map("n", "<leader>q", ":ToggleQuickFix<CR>", nor)

map("n", "J", ":BufferLineCyclePrev<CR>", nor)
map("n", "K", ":BufferLineCycleNext<CR>", nor)
