#!/usr/bin/env zsh
#
# Find and open files in vim

# Directly open found files in vim. All args are passed to ripgrep.
#   vo function # Open all files containing 'function'.
#   vo function -g '*.ts' # Open all Typescript files containing 'function'.
function vo {
  local found_files=$(rg -l "${@}")

  if [[ $#found_files == 0 ]]; then
    echo "vo: no files found: ${@}"
    return 1
  fi

  nvim $(echo "$found_files")
}

# Browse for an open a file in the folder. Need batcat.
function _vim_open_file {
  local theme="${1-:GitHub}"
  local found_files=$(rg --files --hidden -g '!.git/*')
  local selected_file=$(echo $found_files | fzf --preview "batcat -n --color=always {} --theme='${theme}'")

  if [[ ! -n $selected_file ]]; then
    return 1
  fi

  vim $selected_file
}

alias vf=_vim_open_file

zle -N _vim_open_file
bindkey '^P' _vim_open_file
