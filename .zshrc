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

eval "$(starship init zsh)"

# zsh settings
setopt autocd # cdコマンドの省略
setopt autopushd # cd時にディレクトリをスタックに積む
setopt correct # コマンドのスペルミスを訂正
setopt histignoredups # 重複したコマンドは履歴に残さない
setopt histignorespace # 行頭にスペースがあるコマンドは履歴に残さない
setopt histreduceblanks # 余分なスペースは削除して履歴に残す
setopt histsavenodups # 重複したコマンドは履歴に残さない
setopt sharehistory # コマンドの履歴を共有する

# autoload -Uz compinit && compinit

# ----------------------------------------
# 2. Aliases
# ----------------------------------------

# default
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# ls
alias la="ls -AF"
alias ll="ls -AlhF"

# others
alias vim="nvim"

# ----------------------------------------
# 3. environment variables
# ----------------------------------------

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# ----------------------------------------
# 4. Others
# ----------------------------------------


