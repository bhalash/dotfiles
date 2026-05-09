# Remove annoying "%" sign after certain outputs
# See: https://stackoverflow.com/questions/13660636
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=''

# Set username and hostname
function _prompt_user {
  echo '%n@%m '
}

# Set dir
function _prompt_dir {
  echo $'%1~ '
}

# Set vi mode - insert or command
function _prompt_mode {
  local MODE_NORMAL='>'
  local MODE_INSERT='$'
  echo "${${KEYMAP/vicmd/${MODE_NORMAL}}/(main|viins)/${MODE_INSERT}}"
}

# Set block ▮ or | cursor, depending upon mode
# See: https://unix.stackexchange.com/a/433321
function _mode_cursor {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]]; then
    echo -ne '\e[5 q'
  fi
}

function zle-line-init zle-keymap-select {
  # Draw prompt
  PROMPT="$(_prompt_user)$(_prompt_dir)$(_prompt_mode) %b"
  RPROMPT=""
  _mode_cursor
  zle reset-prompt
}
