local w, o = vim.w, vim.o

function K(keybinds)
	for index, keybind in pairs(keybinds) do
		if(keybind[4] == nil) then
			keybind[4] = {}
		end

		vim.api.nvim_set_keymap(
			keybind[1],
			keybind[2],
			keybind[3],
			keybind[4]
		)
	end
end

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.cmd('h '..cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.cmd('!'..vim.o.keywordprg..' '..cw)
    end
end

function togglezen()
  w.list           = not w.list
  w.number         = not w.number
  w.relativenumber = not w.relativenumber
  w.cursorline     = not w.cursorline
  w.cursorcolumn   = not w.cursorcolumn
  w.colorcolumn    = w.colorcolumn == '0' and '80' or '0'
  o.laststatus     = o.laststatus == 2 and 0 or 2
  o.ruler          = not o.ruler
end

K({
  {'i', 'jk', '<Esc>'},
  {'i', '<C-s>', '<Esc>:w<CR>'},
  {'i', '<C-h>', '<left>'},
  {'i', '<C-j>', '<down>'},
  {'i', '<C-k>', '<up>'},
  {'i', '<C-l>', '<right>'},
  {'i', '<C-n>', 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<C-n>" : coc#refresh()', {expr = true}},
  {'i', '<C-space>', 'coc#refresh()', {expr=true}},
  {'i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "<Tab>"', {expr = true}},
  {'i', '<C-a>', '<Home>'},
  {'i', '<C-e>', '<End>'},

  {'n', '<C-b>', ':NvimTreeToggle<CR>'},
  {'n', '<C-s>', ':w<CR>'},
  {'n', '<C-p>', ":Files<CR>", {silent=true}},
  {'n', '<S-j>', ':BufferPrevious<CR>'},
  {'n', '<S-k>', ':BufferNext<CR>'},
  {'n', '<C-e>', ':BufferClose<CR>'},
  {'n', '<A-f>', ':Telescope live_grep<CR>'},
  {'n', '<leader>z', ':lua togglezen()<CR>', {silent=true}},

  {'n', '<C-t>', ":lua require('terminal').toggle()<CR>"},
  {'t', '<C-t>', "<C-\\><C-n>:lua require('terminal').toggle()<CR>"},

  {'v', '<leader>y', '"+y'},

  {"x", "<S-k>", ":move-2<CR>='[gv"},
  {'x', '<S-j>', ":move'>+<CR>='[gv"},

  -- CoC keybindings
  {'n', 'gd', '<Plug>(coc-definition)'},
  {'n', 'gn', '<Plug>(coc-rename)'},
  {'n', 'gr', '<Plug>(coc-references)'},
  {'n', 'gb', '<Plug>(coc-cursor-words)'},
  {'n', 'gh', '<cmd>lua show_docs()<CR>'},
  {'n', '<leader>a', '<Plug>(coc-codeaction-selected)<CR>', {noremap = false}},
  {'x', '<leader>a', '<Plug>(coc-codeaction-selected)', {noremap= false}},

  {'x', '<leader>f', '<Plug>(coc-format-selected)', {noremap = false}},
  {'n', '<leader>f', '<Plug>(coc-format-selected)<CR>', {noremap = false}},


  -- End

  {'t', 'jk', '<C-\\><C-n>'},
})

