syntax on
colorscheme nord

set termguicolors
set background=dark
set smartindent
set expandtab
set number relativenumber

filetype plugin indent on
set noexpandtab     " Don't expand tabs to spaces
set tabstop=4       " The number of spaces a tab is
set shiftwidth=4    " Number of spaces to use in auto(indent)
set softtabstop=-1  " Automatically keeps in sync with shiftwidth
set expandtab
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

highlight ColorColumn ctermbg=0 guibg=grey
highlight Normal guibg=none
highlight LineNr guifg=#5eacd3

hi BufferCurrent guibg=#2E3440
hi BufferCurrentSign guibg=#2E3440
hi BufferCurrentMod guifg=#EBCB8B

hi BufferVisibleSign guibg=#2E3440
hi BufferVisibleMod guifg=#8FBCBB guibg=#2E3440
hi BufferVisible guifg=#8FBCBB guibg=#2E3440

hi BufferInactiveMod guifg=#EBC88B 

hi link LspDiagnosticsVirtualTextError LspDiagnosticsError
hi link LspDiagnosticsVirtualTextWarning LspDiagnosticsWarning
hi link LspDiagnosticsVirtualTextInformation LspDiagnosticsInformation
hi link LspDiagnosticsVirtualTextHint LspDiagnosticsHint

" Flash selection when it's yanked
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 70})
augroup END

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
