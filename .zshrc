function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

autoload -Uz compinit
compinit
eval "$(starship init zsh)"

#Aliases
alias ls="exa"
alias ll="exa -l"
alias py="python3"