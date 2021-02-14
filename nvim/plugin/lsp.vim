set completeopt=menuone,noinsert,noselect

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gn :lua vim.lsp.buf.rename()<CR>
nnoremap gh :lua vim.lsp.buf.hover()<CR>
nnoremap gs :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>a :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>s :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap d[ :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap d] :lua vim.lsp.diagnostic.goto_next()<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <Tab> compe#confirm('<Tab>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require('lsp')

sign define LspDiagnosticsSignError text=▬
sign define LspDiagnosticsSignWarning text=▴
