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
  builtin cd $selected_project
  zle reset-prompt
}

# Register Widget
# ==============================================================================

zle -N __cd_work_project
bindkey '^K' __cd_work_project
