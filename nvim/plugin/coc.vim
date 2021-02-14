" let g:coc_global_extensions = [
"             \ 'coc-json',
"             \ 'coc-snippets',
"             \ 'coc-tsserver',
"             \ 'coc-eslint',
"             \ 'coc-prettier',
"             \ 'coc-emmet',
"             \ 'coc-css',
"             \ 'coc-flutter-tools',
"             \ 'coc-vetur',
"             \ 'coc-pyright',
"             \]

" inoremap <silent><expr> <C-space> coc#refresh()
" inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : \"<Tab>\"
" nnoremap <silent> <leader>f <Plug>(coc-format)
" vnoremap <silent> <leader>f <Plug>(coc-format-selected)
" nnoremap <silent> <leader>a <Plug>(coc-codeaction)
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gh :call <SID>show_documentation()<CR>
" nmap <leader>rn <Plug>(coc-rename)

" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     elseif (coc#rpc#ready())
"         call CocActionAsync('doHover')
"     else
"         execute '!' . &keywordprg . " " . expand('<cword>')
"     endif
" endfunction

" autocmd CursorHold * silent call CocActionAsync('highlight')

" command! -nargs=0 Format :call CocAction('format')
" command! -nargs=? Fold :call CocAction('fold', <f-args>)
" command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
