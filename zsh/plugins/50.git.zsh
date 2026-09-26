# Useful utilities for git and git projects.

# is this a git project?
function __is_git_project {
  git rev-parse 2> /dev/null
  return $?
}

# pick branch using fzf
function __git_pick_branch {
  git branch \
    | sort -r \
    | fzf --height=~20% --layout=reverse \
    | sed -e 's/^\*//;s/^[[:space:]]\+//' # strip leading `*` and whitespace
}

# ------------------------------------------------------------------------------

function __git_change_branch {
  if __is_git_project; then
    branch=$(__git_pick_branch)

    if [[ $branch != '' ]]; then
      git checkout "${branch}"
    fi

    zle reset-prompt
  else
    echo "git: not a git project: ${PWD}"
  fi
}

zle -N __git_change_branch
bindkey '^B' __git_change_branch # Bind to Ctrl+B
