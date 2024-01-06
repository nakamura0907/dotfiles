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

ZSH = "$HOME/.oh-my-zsh"

ZSH_THEME="fino-time"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"