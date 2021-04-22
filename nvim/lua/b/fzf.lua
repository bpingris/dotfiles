local loc = require('fuzzy.lib.location')

require'fuzzy'.setup {
    width = 70,
    height = 45,
    blacklist = {
        "vendor"
    },
    location = loc.center,
    sorter = require'fuzzy.lib.sorter'.fzy,
    prompt = '> ',
}
