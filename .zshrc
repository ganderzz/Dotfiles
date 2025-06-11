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
alias ls="eza"
alias ll="eza -l"
alias py="python3"
alias g="git"
alias gs="git stash"
alias gc="git commit"
alias gb="git checkout -b"
alias grep="rg"
alias lg="lazygit"
alias t="tmux"

eval "$(atuin init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
