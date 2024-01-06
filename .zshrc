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
setopt autocd # cdコマンドの省略
setopt autopushd # cd時にディレクトリをスタックに積む
setopt correct # コマンドのスペルミスを訂正
setopt sharehistory # コマンドの履歴を共有する
setopt histignoredups # 重複したコマンドは履歴に残さない
setopt histignorespace # 行頭にスペースがあるコマンドは履歴に残さない
setopt histreduceblanks # 余分なスペースは削除して履歴に残す
setopt histsavenodups # 重複したコマンドは履歴に残さない

# autoload -Uz compinit && compinit

# ----------------------------------------
# 2. Aliases
# ----------------------------------------

# default
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# ls
alias la="ls -A"
alias ll="ls -AlhF"

# others
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
