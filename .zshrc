# KITTY stuff
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

source ~/.zsh/antigen.zsh

alias vim="nvim"
alias chmox="chmod +x"
alias open="xdg-open"
alias bc="bc -ql"
alias f="find . -iname"
alias so="fzf | xargs nvim"

alias start_docker="sudo systemctl start docker"
alias stop_docker="sudo systemctl stop docker"
alias start_mongo="docker run --rm -p 27017:27017 --name mongodb  -v \"/home/benoitp/work/data/db:/data/db\" mongo"
alias start_pg="docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v ~/work/data/pg:/var/lib/postgresql/data postgres"

load_antigen() {
	antigen use oh-my-zsh

	antigen bundle git
	antigen bundle docker
	antigen bundle docker-compose

	antigen bundle zsh-users/zsh-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions


	antigen bundle mafredri/zsh-async
	antigen bundle sindresorhus/pure

	antigen apply
}

load_antigen

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

path=(
  '/home/benoitp/bin'
  '/home/benoitp/.npm-global/bin'
  '/home/benoitp/go/bin'
  $path
)
typeset -u path
export PATH
EDITOR=nvim
export EDITOR

killport() {
	re='^[0-9]+$'
        if ! [[ $1 =~ $re ]] ; then
           echo "Error: Port must be a number" >&2; return
        fi
        PROCS=$(lsof -t -i :$1)
        kill -9 $PROCS
}

backup() {
	cp -r "$1"{,.bak}
}

zsh_stats() {
      fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

jqless() {
    jq -C . $1 | less -R
}

