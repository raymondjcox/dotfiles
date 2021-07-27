export EDITOR="nvim"
export ZSH="/Users/raymond/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias vim="nvim"

source ~/.zshrc.custom

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
