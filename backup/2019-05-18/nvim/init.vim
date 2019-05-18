"set termguicolors

call plug#begin('~/.local/share/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
call plug#end()

syntax on
color codedark 

" Background transparent!
"hi Normal guibg=NONE ctermbg=NONE

let g:ycm_min_num_of_chars_for_completion=4
let g:ycm_min_num_identifier_candidate_chars=4
let g:ycm_enable_diagnostic_highlighting=0
set completeopt-=preview
let g:ycm_add_preview_to_completopt=0

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
