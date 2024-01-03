#Startup
function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}

function kp(){
  if [ -z "$1" ]
  then
	  kill -9 $(lsof -t -i tcp:"$1")
  else
	  echo "No port given"
	  return -1
  fi
}

starship_precmd_user_func="set_win_title"

autoload -Uz compinit
compinit
eval "$(starship init zsh)"

#Aliases
alias ls="exa"
alias ll="exa -l"
alias py="python3"
alias g="git"
alias grep="rg"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
