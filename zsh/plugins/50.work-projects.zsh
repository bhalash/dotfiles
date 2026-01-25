#!/usr/bin/env zsh
#
# cd between work projects in my work folder.

function __work_project_list {
  project=$(ls -1 ~/Work | fzf)
  builtin cd ~/Work/$project
  zle reset-prompt
}

# Register Widget
# ==============================================================================

zle -N __work_project_list
bindkey '^K' __work_project_list
