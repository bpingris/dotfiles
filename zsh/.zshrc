# https://github.com/jandamm/zgenom#installation
source ~/.zgenom/zgenom.zsh

if ! zgenom saved; then

  # specify plugins here
  zgenom ohmyzsh
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh themes/simple
  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom zsh-users/zsh-history-substring-search


  # generate the init script from plugins above
  zgenom save
fi

alias l='ls -la'

export GOPATH=~/go
export GOBIN=$GOPATH/bin

path+=(~/bin $GOBIN)

# fnm
export PATH=/home/benoitp/.fnm:$PATH
eval "`fnm env`"
