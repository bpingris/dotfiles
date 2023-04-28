# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "chivalryq/git-alias"

plug "$HOME/.config/zsh/vim.zsh"
plug "$HOME/.config/zsh/prompt.zsh"

# bun completions
[ -s "/Users/bpingris/.bun/_bun" ] && source "/Users/bpingris/.bun/_bun"
[ -s "/Users/bpingris/.gh/_gh" ] && source "/Users/bpingris/.gh/_gh"

path+=(
   ~/bin
   ~/go/bin
   ~/flutter/bin
)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bpingris/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bpingris/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bpingris/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bpingris/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

killport() {
   echo "$1"
   lsof -i ":$1" | awk 'NR > 1 {print $2}' | xargs kill -9
}

# Bun
export BUN_INSTALL="/Users/bpingris/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^R' history-incremental-search-backward

# pnpm
export PNPM_HOME="/Users/bpingris/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

alias pn="pnpm"
alias cl="clear"
