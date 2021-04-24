#!/bin/sh

# install vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

log() {
    echo $1
    shift
    $@
    echo -e "done\n"
}

add_to_path() {
    case $SHELL in
        *zsh)
            echo "path+=(~/bin/squashfs-root/usr/bin)" >> ~/.zshrc
            ;;
        *bash)
            echo 'export PATH="\$PATH:$HOME/bin/squashfs-root/usr/bin"' >> ~/.bashrc
            ;;
        *)
            echo -e "shell not supported, check on how to add \$HOME/bin/squashfs-root/usr/bin to your PATH"
            ;;
    esac
}

log "creating 'bin' dir if not exists" mkdir ~/bin -p

log "fetching neovim's appimage" wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O ~/bin/nvim.appimage

cd ~/bin

chmod +x nvim.appimage

log "extracting appimage" ./nvim.appimage --appimage-extract

log "adding nvim's executable path to the PATH" "add_to_path"
