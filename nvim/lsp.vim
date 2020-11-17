" https://github.com/sentriz/dotfiles/blob/master/conf_common/.config/nvim/conf_lang_server.vim 
" bash          npm install -g bash-language-server
" c             <package manager> install clang
" dockerfile    npm install -g dockerfile-language-server-nodejs
" go            go get -u golang.org/x/tools/gopls@latest
" python        pip install --user pyls-black
" python        pip install --user python-language-server[flake8]
" js, ts        npm install -g typescript typescript-language-server
" vue           npm install -g typescript vls

lua require 'lsp'

set completeopt=menuone,noinsert,noselect
set shortmess+=c

