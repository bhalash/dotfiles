# Remove annoying "%" sign after certain outputs
# See: https://stackoverflow.com/questions/13660636/what-is-percent-tilde-in-zsh
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=''

function _prompt_color {
  # Wrap argument $1 in given fg and bg colours
  # See: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
  # See: https://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
  local CONTENT=$1
  local FG=${2:-15} # fallback white
  local BG=${3} # no fallback bg

  if [[ -n $BG ]]; then
    echo "%F{${FG}}%K{${BG}}${CONTENT}%f%k"
  else
    echo "%F{${FG}}${CONTENT}%f%k"
  fi
}

function _prompt_segment_separator {
  local SEGMENT_SEPARATOR=$'\ue0b0'
  local BG=${1:-0}
  local FG=${2:-15}
  echo $(_prompt_color $SEGMENT_SEPARATOR $FG $BG)
}

function _prompt_user {
  local FG=15

  if [[ $(id -u) == 0 ]]; then
    FG=9 # red for root :p
  fi

  echo $(_prompt_color '%n@%m ' $FG)
}

function _prompt_dir {
  echo $(_prompt_color '%1~ ')
}

function _prompt_mode {
  local MODE_NORMAL=$(_prompt_color '>')
  local MODE_INSERT=$(_prompt_color '$')
  echo "${${KEYMAP/vicmd/${MODE_NORMAL}}/(main|viins)/${MODE_INSERT}}"
}

zle-line-init zle-keymap-select() {
  # Draw prompt
  PROMPT="$(_prompt_user)$(_prompt_dir)$(_prompt_mode) %b"
  RPROMPT=""
  zle reset-prompt
}
