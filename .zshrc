#                                      
#                                      
#   ■■■■                               
#  ■   ■■         ■■                   
#  ■    ■   ■■    ■                    
#  ■■      ■■ ■■ ■■■■ ■■■  ■■  ■■ ■■■  
#   ■■■   ■■   ■  ■    ■    ■   ■   ■■ 
#     ■■  ■    ■  ■    ■    ■   ■    ■ 
#      ■■ ■■■■■■  ■    ■    ■   ■    ■ 
#  ■    ■ ■       ■    ■    ■   ■    ■ 
#  ■   ■■  ■   ■  ■    ■■  ■■   ■   ■■ 
#  ■■■■■   ■■■■■  ■■■■  ■■■ ■■  ■ ■■■  
#                               ■      
#                               ■      
#                               ■      
#                              ■■■      

ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino-time"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# eval "$(starship init zsh)"



# 後でやる
setopt autocd
autoload -Uz compinit && compinit

# エイリアス
alias vim="nvim"

# Export 
export PATH="/opt/flutter/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

# bun completions
[ -s "/home/nakamura0907/.bun/_bun" ] && source "/home/nakamura0907/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"