local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = {'.git/*'},
    shorten_path = true,
    winblend = 0,
    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-c>'] = actions.close,
        ['<Esc>'] = actions.close,
        ['<C-s>'] = actions.goto_file_selection_split,
        ['<C-v>'] = actions.goto_file_selection_vsplit,
      },
      n = {['<esc>'] = actions.close},
    },
  },
}

