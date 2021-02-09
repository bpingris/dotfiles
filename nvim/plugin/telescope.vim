lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' -',
        color_devicons = true,
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-s>"] = actions.goto_file_selection_split,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-c>"] = actions.close,
                ["jk"] = actions.close,
            },
        }
    }
}
EOF

nnoremap <A-f> :lua require('telescope.builtin').grep_string()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
