#!/usr/bin/env zsh
#
# cd between work projects in my work folder.

function __get_project_list {
  rg --files "$1" --maxdepth 2 --null | xargs -0 dirname
}

function __cd_work_project {
  projects="${HOME}/.dotfiles\n" # start here with dotfiles

  if [[ -d ~/Code ]]; then # personal code projects
    projects+=$(__get_project_list ~/Code)
  fi

  if [[ -d ~/Work ]]; then # work projects
    projects+=$(__get_project_list ~/Work)
  fi

  selected_project=$(echo $projects | sort | uniq | fzf)
  builtin cd $selected_project
  zle reset-prompt
}

# Register Widget
# ==============================================================================

zle -N __cd_work_project
bindkey '^K' __cd_work_project
