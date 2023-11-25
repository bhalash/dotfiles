#!/usr/bin/env zsh
#
# I work in a big monorepo. This script presents the user with a list of Nx lib
# and apps within the project, then cds to that directory while setting the
# Tmux window title to that of the project path.
#
# See: https://github.com/zsh-users/zsh
# See: https://github.com/BurntSushi/ripgrep
# See: https://github.com/junegunn/fzf
# See: https://github.com/tmux/tmux

#
# cd to git project root
#

function _is_git_project {
  git rev-parse 2> /dev/null
}

# cd to git project root folder
function gr {
  if _is_git_project; then
    cd "$(git rev-parse --show-toplevel)"
  else
    echo "cd: not a git project: ${PWD}"
  fi
}

#
# swap to Nx sub-project
#

function _is_nx_monorepo {
  test -f "$(git rev-parse --show-toplevel)/nx.json"
}

# Get list of Nx projects in given directory.
# - Strips leading path and trailing project.json file.
# - Special case: empty lines are assumed to be a project in the root directory.
function _nx_project_list {
  local project_root=$1

  rg --files -g 'project.json' $project_root \
    | sed -e "s,${project_root}/,," \
    | sed -E -e 's,(/)?project.json,,' \
    | sed -e 's,^$,.,'
}

function _cd_nx_project {
  if [[ $(_is_git_project; echo $?) != 0 ]]; then
    return 1
  fi

  if [[ $(_is_nx_monorepo; echo $?) != 0 ]]; then
    return 2
  fi

  # project root directory
  local project_root=$(git rev-parse --show-toplevel)
  # get list of Nx projects, keyed by project.json file
  local selected_project=$(_nx_project_list $project_root | fzf)

  # no project was picked
  if [[ ! -n $selected_project ]]; then
    return 0
  fi

  # cd to selected project
  builtin cd "${project_root}/${selected_project}"
  zle reset-prompt

  if [[ -n $TMUX ]]; then
    if [[ $selected_project =~ '^\.$' ]]; then
      # special case: there's a project.json file in the root, which will be
      # the case in a migrated project.
      tmux rename-window $(basename $project_root)
    else
      tmux rename-window $selected_project
    fi
  fi
}

# register widget and bind to ^h
zle -N _cd_nx_project
bindkey '^H' _cd_nx_project
