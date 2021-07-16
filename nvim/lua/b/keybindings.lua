local map = vim.api.nvim_set_keymap

map("i", "jk", "<Esc>", {silent=true})

map("i", "<C-s>", "<Esc>:w<CR>", {silent=true, noremap=true})
map("n", "<C-s>", ":w<CR>", {silent=true, noremap=true})

map("v", "<", "<gv", {silent=true, noremap=true})
map("v", ">", ">gv", {silent=true, noremap=true})

map("n", "<C-p>", ":Telescope find_files<CR>", {silent=true, noremap=true})
map("n", "<A-f>", ":Telescope live_grep<CR>", {silent=true, noremap=true})
map("n", "<leader>b", ":Telescope buffers<CR>", {silent=true, noremap=true})

map("n", "<leader>/", ":noh<CR>", {silent=true, noremap=true})

map("v", "<leader>y", '"+y',{silent=true, noremap=true})


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

map("n", "<leader>q", ":ToggleQuickFix<CR>", {silent=true, noremap=true})
