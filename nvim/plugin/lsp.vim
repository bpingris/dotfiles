let g:completion_confirm_key = ""
let g:completion_enable_snippet = "vim-vsnip"

lua require('lsp')

sign define LspDiagnosticsSignError text=▬
sign define LspDiagnosticsSignWarning text=▴
