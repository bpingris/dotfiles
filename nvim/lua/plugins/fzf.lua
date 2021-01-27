vim.cmd [[ let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7, 'highlight': 'Comment' } } ]]
vim.cmd [[ let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'" ]]

