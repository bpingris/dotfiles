function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi

export PS1='\[\e[1;38;5;244m\]\t \[\e[1;36m\]\u@\H \[\e[1;33m\]\w ${timer_show}s \[\e[1;36m\]\$ \[\e[0m\]' 


alias ls="ls --color=always"
alias ll="ls -l"
alias la="ls -lA"
alias ..="cd .."
alias cd..="cd .."
alias bc="bc -l"
alias prettypath='echo -e ${PATH//:/\\n}'

alias ga="git add"
alias gaa="git add ."
alias gst="git status"
alias gcmsg="git commit -m"


HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize
shopt -s globstar

# Send command output to qbin.io for quick & easy sharing (stored for 14 days)
# Usage: echo "Hello World" | qbin
alias qbin="curl https://qbin.io -s -T -"
# Upload bigger & binary files to transfer.sh (stored for 14 days)
# transfer anything.tar.gz
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi; tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

alias grep="grep --color=always"
# Provide a yq command to use jq with YAML files
alias yq="python3 -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' | jq"

# View pressure stall information
alias pressure="grep -n '[^ ]*=' /proc/pressure/*"


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
