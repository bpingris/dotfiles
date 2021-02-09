lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = {".backup",".swap",".langservers",".session",".undo","*.git","node_modules","vendor",".cache",".vscode-server",".Desktop",".Documents","classes"},
        prompt_prefix = ' -',
        color_devicons = true,
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-s>"] = actions.goto_file_selection_split,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-c>"] = actions.close,
                ["<Esc>"] = actions.close,
                ["jk"] = actions.close,
            },
        }
    }
}
require('telescope').load_extension('fzy_native')

EOF

nnoremap <A-f> :lua require('telescope.builtin').grep_string()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
