# Path/ to your oh-my-zsh configuration.
xset b off

export PATH="$PATH:$HOME/bin:$HOME/.npm-global/bin:$HOME/.local/bin:$HOME/flutter/bin"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
alias blih="blih -u benoit.pingris@epitech.eu"
alias ne="emacs -nw"
alias vim="nvim"
alias v="vim"
alias chmox="chmod +x"
alias xdg="xdg-open"
alias vic="v ~/.config/nvim/init.vim"
alias vi3="v ~/.config/i3/config"
alias vip="v ~/.config/polybar/config"
alias start_postgre="sudo systemctl start postgresql.service"
alias start_docker="sudo systemctl start docker"
alias filesize="du -sh * | sort -h"

function whatthecommit {
	curl --silent --fail https://whatthecommit.com/index.txt	
}

function gigacommit {
	git commit -m "$(whatthecommit)"
}

function killport {
	re='^[0-9]+$'
	if ! [[ $1 =~ $re ]] ; then
	   echo "Error: Port must be a number" >&2; return
	fi
	PROCS=$(lsof -t -i :$1)
	kill -9 $PROCS
}

source $HOME/.antigen/antigen.zsh

function load_antigen {
	antigen use oh-my-zsh
	antigen bundle git
	antigen bundle heroku
	antigen bundle npm 
	antigen bundle pip
	antigen bundle sudo
	antigen bundle firebase

	antigen bundle zsh-users/zsh-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle marzocchi/zsh-notify
	antigen bundle buonomo/yarn-completion

	antigen theme geometry-zsh/geometry

	antigen apply
	GEOMETRY_PROMPT_PREFIX=""
}

load_antigen


function tarit {
    # (c)reate g(z)ip (v)erbose (f)ile                                                    
    tar czvf $1.tar.gz $1
}

function untarit {
    # (x)tract (z)e (v)ucking (f)ile                                                      
    tar xzvf $1
    rm -r $1
}

function numfiles {
    if [ -z "$1" ]
    then
	DIR="."
    else
	DIR=$1
    fi
    N="$(ls $DIR | wc -l)"
    echo "$N files in $DIR"
}

function backup {
    cp -r "$1"{,.bak}
}

