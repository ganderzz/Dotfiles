function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

autoload -Uz compinit
compinit
eval "$(starship init zsh)"

#Aliases
alias ls="eza"
alias ll="eza -l"
alias py="python3"
alias g="git"
alias grep="rg"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
