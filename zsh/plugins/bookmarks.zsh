#!/usr/bin/env zsh
# Register Folder Bookmarks for Easy Switching
# ==============================================================================

declare -a BOOKMARKS=("${DOTFILES}")
export BOOKMARKS

function __get_bookmark_list {
  local projects=$(rg --files "$1" --maxdepth 2 --null)

  if [[ $projects != '' ]]; then
    echo $projects | xargs -0 dirname
  fi
}

function __cd_bookmark {
  local selected_bookmark=$(printf '%s\n' "${BOOKMARKS[@]}" | sort | uniq | fzf)

  if [[ $selected_bookmark != '' ]]; then
    builtin cd $selected_bookmark
    __set_tmux_window_name
  fi

  zle reset-prompt
}

function __set_tmux_window_name {
  local dir=$(basename $PWD)

  if [[ -n $TMUX ]]; then
    tmux rename-window $dir
  fi
}

zle -N __cd_bookmark
bindkey '^P' __cd_bookmark
