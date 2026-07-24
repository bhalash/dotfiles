#!/usr/bin/env zsh
#
# cd between work projects in my work folder.

function __get_project_list {
  local projects=$(rg --files "$1" --maxdepth 2 --null)

  if [[ $projects != '' ]]; then
    echo $projects | xargs -0 dirname
  fi
}

function __cd_work_project {
  local projects="${DOTFILES}\n" # start here with dotfiles

  if [[ -d $CODE_DIR ]]; then # personal code projects
    projects+=$(__get_project_list $CODE_DIR)
  fi

  if [[ -d $WORK_DIR ]]; then # work projects
    projects+=$(__get_project_list $WORK_DIR)
  fi

  local selected_project=$(echo $projects | sort | uniq | fzf)

  if [[ $selected_project != '' ]]; then
    builtin cd $selected_project
    __set_tmux_window_name
  fi

  zle reset-prompt
}

# TODO(mark 2026-07-24): Find better home for this.
function __set_tmux_window_name {
  local dir=$(basename $PWD)

  if [[ -n $TMUX ]]; then
    # local project_basename=$(basename $project_root)

    if [[ $selected_project =~ '^\.$' ]]; then
      # special case: there's a project.json file in the root, which will be
      # the case in a migrated project
      # tmux rename-window $project_basename
    else
      tmux rename-window $dir
    fi
  fi
}

# Register Widget
# ==============================================================================

zle -N __cd_work_project
bindkey '^P' __cd_work_project
