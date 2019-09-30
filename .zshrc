# KITTY stuff
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin


# EXPORT
append_to_path() {
	PATH="$PATH:$1"
}
append_to_path "$HOME/bin"
append_to_path "$HOME/.npm-packages/bin"
append_to_path "$HOME/.local/bin"
append_to_path "$HOME/.flutterio/flutter/bin"
append_to_path "$HOME/.deno/bin"
append_to_path "$HOME/.poetry/bin"
append_to_path "/usr/local/Astrill"

export PATH

export EDITOR="nvim"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export TERMINAL="konsole"

# ANDROID
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ALIAS

## Docker
alias start_docker="sudo systemctl start docker"
alias stop_docker="sudo systemctl stop docker"

alias start_nordvpn="sudo systemctl start nordvpnd.service"
alias stop_nordvpn="sudo systemctl stop nordvpnd.service"

alias vim="nvim"
alias vi="nvim"

alias open="xdg-open"
alias chmox="chmod +x"
alias diskspace="df -P -kHl"

alias myip="http -b ipinfo.io/ip"
alias bc="bc -ql"

alias so="fzf | xargs -r nvim"
alias sovs="fzf | xargs -r code"
alias :q!="exit"

alias f="find . -iname"
alias dog="cat"
alias dogs="dog"
alias lg="lazygit"

# ANTIGEN
source ~/.antigen/antigen.zsh

load_antigen() {
	antigen use oh-my-zsh
	antigen bundle git
	antigen bundle heroku
	antigen bundle colored-man-pages
	antigen bundle docker
	antigen bundle docker-compose
	antigen bundle node
	antigen bundle pipenv

	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-syntax-highlighting

        GEOMETRY_PROMPT_PREFIX=""
	GEOMETRY_PROMPT_PLUGINS=(virtualenv)
	antigen theme geometry-zsh/geometry

#	antigen bundle subnixr/minimal

	antigen apply
}

load_antigen

function killport {
	re='^[0-9]+$'
        if ! [[ $1 =~ $re ]] ; then
           echo "Error: Port must be a number" >&2; return
        fi
        PROCS=$(lsof -t -i :$1)
        kill -9 $PROCS
}

function whatthecommit {
	curl --silent --fail https://whatthecommit.com/index.txt
}

function gigacommit {
	git commit -m "$(whatthecommit)"
}

function backup {
	cp -r "$1"{,.bak}
}

function zsh_stats {
      fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}


###-tns-completion-start-###
if [ -f /home/benoit/.tnsrc ]; then 
    source /home/benoit/.tnsrc 
fi
###-tns-completion-end-###

serveo () {
    ssh -R 80:localhost:$1 serveo.net
}

jqless() {
    jq -C . $1 | less -R
}

