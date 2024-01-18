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

function __is_git_project {
  git rev-parse 2>/dev/null 1>&2
  return $?
}

function __nx_project_list {
  # Get list of Nx projects in given directory.
  # - Strips leading path and trailing filename.
  # - Special case: empty lines are assumed to be a project in the root dir.
  local project_root=$1

  rg --files -g 'nx.json' -g 'project.json' $project_root \
    | sed -e "s,${project_root}/,," \
    | sed -E -e 's,(/)?(project|nx).json,,' \
    | sed -e 's,^$,.,' \
    | sort -r \
    | uniq
}

function __pick_nx_project {
  local project_root=$1
  __nx_project_list $project_root | fzf
}

function __cd_nx_project {
  if ! __is_git_project; then
    return 10
  fi

  local project_root=$(git rev-parse --show-toplevel)
  local project_list=$(__nx_project_list $project_root)

  if [[ $#project_list == 0 ]]; then
    # no projects were found
    return 20
  fi

  local selected_project=$(__pick_nx_project $project_root)

  if [[ ! -n $selected_project ]]; then
    # no project was picked
    return 30
  fi

  if [[ -n $TMUX ]]; then
    local project_basename=$(basename $project_root)

    if [[ $selected_project =~ '^\.$' ]]; then
      # special case: there's a project.json file in the root, which will be
      # the case in a migrated project
      tmux rename-window $project_basename
    else
      tmux rename-window "${project_basename}/${selected_project}"
    fi
  fi

  # cd to selected project
  builtin cd "${project_root}/${selected_project}"
  zle reset-prompt
}

# cd to project and open vim
function __cd_nx_project_open_vim {
  __cd_nx_project && vim
}

# Register Widget
# ==============================================================================

# register widget and bind to ^h
zle -N __cd_nx_project
bindkey '^J' __cd_nx_project

zle -N __cd_nx_project_open_vim
bindkey '^K' __cd_nx_project_open_vim
