# cd to git project root folder
function gr {
  if $(git rev-parse 2> /dev/null); then
    builtin cd "$(git rev-parse --show-toplevel)"
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

alias gc='git comit'
alias gp='git pull'
alias gs='git status'
alias gu='git push'
