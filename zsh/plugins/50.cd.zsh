# cd to git project root folder
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

alias gr='__cd_git_root'

# ------------------------------------------------------------------------------

# cd up one directory upon C<BS>
# TODO(mark 2026-09-16): Refine. This works, but is...twitchy.
function __cd_up_one_directory {
  if [[ $#BUFFER == 0 ]]; then
    cd ..
    zle reset-prompt
  else
    zle backward-kill-word
  fi
}

# zle -N __cd_up_one_directory
# bindkey '^?' __cd_up_one_directory
