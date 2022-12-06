return function()
	require("telescope").setup({
		pickers = {
			find_files = {
				hidden = true,
			},
			buffers = {
				show_all_buffers = true,
				sort_lastused = true,
				theme = "dropdown",
				previewer = false,
				mappings = {
					i = {
						["<C-d>"] = "delete_buffer",
					},
				},
			},
		},
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = false,
				},
			},
		},
	})

	-- Enable telescope fzf native
	require("telescope").load_extension("fzf")
end
