return {
	-- Fuzzy Finder (files, lsp, etc)
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		}

		pcall(require('telescope').load_extension, 'fzf')


		vim.keymap.set('n', '<leader>f?', require('telescope.builtin').oldfiles,
			{ desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers,
			{ desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files,
			{ desc = 'Search [G]it [F]iles' })
		vim.keymap.set('n', '<leader>fp', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>ff', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics,
			{ desc = '[S]earch [D]iagnostics' })
		-- vim.keymap.set('n', '<leader>/', function()
		-- 	-- You can pass additional configuration to telescope to change theme, layout, etc.
		-- 	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		-- 		winblend = 10,
		-- 		previewer = false,
		-- 	})
		-- end, { desc = '[/] Fuzzily search in current buffer' })
	end,
}
