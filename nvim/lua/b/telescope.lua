-- Telescope
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ['<Esc>'] = actions.close,
            },
        },
        file_ignore_patterns = { "%.jpg", "%.jpeg", "%.png", "%.otf", "%.ttf" },
    },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

