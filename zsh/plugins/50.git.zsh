#!/usr/bin/env zsh
#
# cd to git project root

function _is_git_project {
  git rev-parse 2> /dev/null
}

# cd to git project root folder
function _cd_git_root {
  if _is_git_project; then
    builtin cd "$(git rev-parse --show-toplevel)"
    zle reset-prompt
    clear

    if [[ -n $TMUX ]]; then
      tmux rename-window $(basename $PWD)
    fi
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

function gr {
  if _is_git_project; then
    cd "$(git rev-parse --show-toplevel)"
    clear

    if [[ -n $TMUX ]]; then
      tmux rename-window $(basename $PWD)
    fi
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

# register widget and bind to ^h
zle -N _cd_git_root
bindkey '^H' _cd_git_root
