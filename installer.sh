#!/usr/bin/env bash

# Dotfile installer for Benoît Pingris
# Made with <3 by Benoît Pingris


RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\e[1m'
RESET='\033[0m'

# 0 = TRUE
#     The program won't download/install any program
# 1 = FALSE
#     The program will download/install some programs

DRY_RUN=1


function _help {
    cat <<EOF

USAGE:
	./installer.sh [-d | --dryrun | --dry-run]

DESCRIPTION:
	Program to install some custom files like 
		-zsh
		-custom scripts
		-vscode extensions

OPTIONS:
	-d --dryrun --dry-run	executes the program in dry mode (won't install programs)
	-h --help   		show this help

EOF
    exit 0
}

if [ "$EUID" = 0 ]
then
    echo "Please do not run as root !"
    exit 1
fi


case "$1" in
    -d|--dry-run|--dryrun)
	DRY_RUN=0
	echo
	echo -e "${ORANGE}Program is running in dry-mode${RESET}!"
	echo
	;;
    -h|--help)
	_help
	;;
esac


echo "Dotfile installer - Version 1.0"
echo "Made by @benoitpingris"

echo
echo


function get_os_type {
    which zypper &> /dev/null && OS="opensuse" && CMD="zypper -y install"
    which pacman &> /dev/null && OS="archlinux" && CMD="pacman --noconfirm -S"
    which dnf &> /dev/null && OS="fedora" && CMD="dnf -y install"
    which apt-get &> /dev/null && OS="debian" && CMD="apt-get -y install"
    which emerge &> /dev/null && OS="gentoo" && CMD="emerge"
}

function os_upgrade {
    case "$OS" in
	opensuse)
	    sudo zypper -y update
	    ;;
	archlinux)
	    sudo pacman --noconfirm -Syu
	    ;;
	fedora)
	    sudo dnf -y update
	    ;;
	debian)
	    sudo apt-get update && sudo apt-get upgrade
	    ;;
	gentoo)
	    sudo emerge -u world
	    ;;
    esac
}

function handle_err {
    if test $1 -eq 0
    then
	return
    else
	echo
	echo -e "${RED}An error occured, do you want to stop the script ? [O/n] ${RESET}"
	read res
	case $res in
	    n|N) return;;
	    *) exit 1;;
	esac
    fi    
}

function curr_action {
    echo -e "${CYAN}${1}...${RESET}"
}

function _done {
    echo -e "${CYAN}Done.${RESET}"
    echo
}

function install_vscode {
    case "$OS" in
	debian)
	    curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > vscode.deb
	    sudo dpkg -i vscode.deb
	    $CMD -f
	    ;;
	archlinux)
	    yaourt visual-studio-code-bin
	    ;;
	gentoo|fedora|opensuse)
	    "Can't install vscode on ${OS}, please `man google`'"
	    ;;
    esac
    
}

get_os_type

curr_action "Upgrade system"
((DRY_RUN)) && os_upgrade && handle_err $?
_done

curr_action "installing zsh"
((DRY_RUN)) && $CMD zsh && handle_err $?
_done

curr_action "installing oh-my-zsh"
((DRY_RUN)) && sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && handle_err $?
_done

curr_action "installing antigen"
((DRY_RUN)) && curl -L git.io/antigen-nightly > $HOME/.oh-my-zsh/antigen.zsh && handle_err $?
_done

if ! [ -x "$(command -v git)" ]
then
    echo 'Error: git is not installed.' >&2
    exit 1
fi

curr_action "Cloning dotfiles repository..."
((DRY_RUN)) && git clone https://github.com/BenoitPingris/dotfiles.git && handle_err $?
((DRY_RUN)) && cd dotfiles && handle_err $?
_done

curr_action "Moving custom scripts at home"
((DRY_RUN)) && tar xvf bin.tar.gz && handle_err $?
((DRY_RUN)) && mv bin $HOME && handle_err $?
_done

curr_action "Make a backup of zshrc"
((DRY_RUN)) && cp $HOME/.zshrc $HOME/.zshrc.backup && handle_err $?
_done

curr_action "Copy the new zshrc"
((DRY_RUN)) && tar xvf zshrc.tar.gz && handle_err $?
((DRY_RUN)) && mv .zshrc $HOME && handle_err $?
_done

curr_action "Installing vscode"
((DRY_RUN)) && install_vscode && handle_err $?
_done

curr_action "Installing extensions for vscode"
((DRY_RUN)) && chmod +x vscode.extensions && ./vscode.extensions
_done

echo -e "${GREEN}Installation finished"
echo -e "You're system is up to go with your new apps !"
echo -e "Enjoy ! :)"
echo -e "${RESET}"
