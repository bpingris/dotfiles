function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer   guibg=#111a1f guifg=#acb3b5
    hi! BuffetActiveBuffer    guibg=#111a1f guifg=#acb3b5
    hi! BuffetBuffer          guibg=#111a1f guifg=#666666
    hi! BuffetTab              guibg=#111a1f guifg=#acb3b5
    " BuffetModCurrentBuffer	The current buffer when modified.
    " BuffetModActiveBuffer	A modified active buffer (a non-current buffer visible in a non-current window).
    " BuffetModBuffer	A modified non-current and non-active buffer.
    " BuffetTrunc	The truncation indicator (count of truncated buffers from the left or right)
endfunction

let g:buffet_always_show_tabline=1
let g:buffet_show_index=1
let g:buffet_use_devicons=0
let g:buffet_tab_icon="▢"
