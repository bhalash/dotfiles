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

function _cd_nx_project {
  ### Functions
  # ----------------------------------------------------------------------------

  function __is_git_project {
    git rev-parse 2>/dev/null 1>&2
    return $?
  }

  function __is_nx_monorepo {
    [[ __is_git_project && -f $(git rev-parse --show-toplevel)/nx.json ]]
  }

  function __nx_project_list {
    # Get list of Nx projects in given directory.
    # - Strips leading path and trailing project.json file.
    # - Special case: empty lines are assumed to be a project in the root dir.
    local project_root=$1

    rg --files -g 'project.json' $project_root \
      | sed -e "s,${project_root}/,," \
      | sed -E -e 's,(/)?project.json,,' \
      | sed -e 's,^$,.,'
  }

  function __pick_nx_project {
    local project_root=$1
    __nx_project_list $project_root | fzf
  }

  ### Do Stuff
  # ----------------------------------------------------------------------------

  if ! __is_nx_monorepo; then
    return 1
  fi

  local project_root=$(git rev-parse --show-toplevel)
  local selected_project=$(__pick_nx_project $project_root)

  # no project was picked
  if [[ ! -n $selected_project ]]; then
    return 2
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
bindkey '^J' _cd_nx_project

# cd to project and open vim
function _cd_nx_project_open_vim {
  _cd_nx_project && vim
}

zle -N _cd_nx_project_open_vim
bindkey '^K' _cd_nx_project_open_vim
