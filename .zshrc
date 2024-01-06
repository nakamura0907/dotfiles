# ----------------------------------------
# 1. Setup
# ----------------------------------------

ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino-time"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# eval "$(starship init zsh)"

# zsh settings
setopt autocd
autoload -Uz compinit && compinit

# ----------------------------------------
# 2. Aliases
# ----------------------------------------

alias vim="nvim"

# ----------------------------------------
# 3. environment variables
# ----------------------------------------

export PATH="/opt/flutter/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ----------------------------------------
# 4. Others
# ----------------------------------------
