#!/usr/bin/env zsh
# Useful utilities for git and git projects.

# is this a git project?
function __is_git_project {
  git rev-parse 2> /dev/null
  return $?
}

# Function: cd to git project root folder
# ==============================================================================

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

function __pick_git_branch {
  git branch \
    | sort -r \
    | fzf --height=~20% --layout=reverse \
    | sed -e 's/^[ *]\+//' # strip ` * ` from current branch
}

alias gr='__cd_git_root'

# Function: Change Branch
# ==============================================================================

function __git_nuke_branch {
  if __is_git_project; then
    branch=$(__pick_git_branch)

    if [[ $branch != '' ]]; then
      git branch -D "${branch}"
    fi

    zle reset-prompt
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

alias nk='__git_nuke_branch'

# Widget: Change Branch
# ==============================================================================

function __git_change_branch {
  if __is_git_project; then
    branch=$(__pick_git_branch)

    if [[ $branch != '' ]]; then
      git checkout "${branch}"
    fi

    zle reset-prompt
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

zle -N __git_change_branch
bindkey '^H' __git_change_branch # Bind to Ctrl+H
