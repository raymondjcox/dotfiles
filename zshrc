# Run acs to see all alaises

export EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git asdf command-not-found yarn npm httpie kubectl aliases)
source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

alias v="nvim"
alias vim="nvim"
alias ez="nvim ~/.zshrc"
alias ev="nvim ~/.config/nvim/init.lua"
alias ff="fzf | xargs nvim"
alias fh="history | fzf +s --tac"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.custom ] && source ~/.zshrc.custom

autoload -Uz compinit && compinit
