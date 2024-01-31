#!/usr/bin/env zsh
#
# cd to git project root folder

function __is_git_project {
  git rev-parse 2> /dev/null
}

function __cd_git_root {
  if __is_git_project; then
    builtin cd "$(git rev-parse --show-toplevel)"

    if [[ -n $TMUX ]]; then
      tmux rename-window $(basename $PWD)
    fi
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

# bind to ^H
zle -N __cd_git_root
bindkey '^H' __cd_git_root
alias gr=__cd_git_root
