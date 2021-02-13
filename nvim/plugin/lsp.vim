set completeopt=menuone,noinsert,noselect

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gn :Lspsaga rename<CR>
nnoremap gh :Lspsaga hover_doc<CR>
nnoremap gs :Lspsaga signature_help<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>a :Lspsaga code_action<CR>
nnoremap <leader>d :Lspsaga preview_definition<CR>
nnoremap <leader>s :Lspsaga show_line_diagnostics<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <Tab> compe#confirm('<Tab>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require('lsp')
