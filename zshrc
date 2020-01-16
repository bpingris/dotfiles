append_to_path() {
	PATH="$PATH:$1"
}

append_to_path "$HOME/bin"
append_to_path "$HOME/.npm-packages/bin"
append_to_path "$HOME/.local/bin"
append_to_path "/usr/local/Astrill"
append_to_path "$HOME/flutterio/flutter/bin"
append_to_path "$HOME/.pub-cache/bin"

export PATH

alias f="find . -iname"
alias vim="nvim"
alias bc="bc -ql"
alias open="xdg-open"
alias chmox="chmod +x"
alias diskspace="df -P -khl"
alias so="fzf | xargs -r nvim"


alias start_docker="sudo systemctl start docker"
alias stop_docker="sudo systemctl stop docker"

alias start_nordvpn="sudo systemctl start nordvpnd.service"
alias stop_nordvpn="sudo systemctl stop nordvpnd.service"

alias start_postgres="sudo systemctl start postgresql.service"
alias stop_postgres="sudo systemctl stop postgresql.service"

source ~/.antigen/antigen.zsh

load_antigen() {
	antigen use oh-my-zsh
	antigen bundle git
	antigen bundle colored-man-pages
	antigen bundle docker
	antigen bundle node
	antigen bundle docker-compose
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-syntax-highlighting

	GEOMETRY_PROMPT_PREFIX=""
	GEOMETRY_PROMPT_PLUGINS=(virtualenv)
	antigen theme geometry-zsh/geometry
	antigen apply
}

load_antigen

backup() {
	cp -r "$1"{,.bak}
}

jqless() {
	jq -C . $1 | less -R
}

serveo() {
	ssh -R 80:localhost:$1 serveo.net
}

killport() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]]
    then
        echo "Error: Port must be a number" >&2
        return 1
    fi
	kill -9 `lsof -t -i :$1`
}

zsh_stats() {
    fc- l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

EDITOR="nvim"
