#!/usr/bin/env zsh

# See: https://github.com/Aloxaf/fzf-tab

# ! FZF {{{

# See: https://github.com/junegunn/fzf#environment-variables
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden -g '!.git/*' -g '!.gitkeep'"
export FZF_CTRL_T_COMMAND='rg --files --null | xargs -0 dirname | sort | uniq'
export FZF_ALT_C_COMMAND='rg --files --null | xargs -0 dirname | sort | uniq'

# Source FZF bindings and integration
if [[ $OSTYPE =~ 'linux-gnu' ]]; then
  source '/usr/share/doc/fzf/examples/key-bindings.zsh'
  source '/usr/share/doc/fzf/examples/completion.zsh'
fi

if [[ $OSTYPE =~ 'darwin' ]]; then
  source '/usr/local/opt/fzf/shell/key-bindings.zsh'
  source '/usr/local/opt/fzf/shell/completion.zsh'
fi

# See: https://github.com/lincheney/fzf-tab-completion?tab=readme-ov-file
source $DOTFILES_DIR/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# Widget: bind cd to <tab> when the prompt is empty, or fallthrough to fzf-zsh-completion {{{

function __tab_cd_or_fzf {
  if [[ $#BUFFER == 0 ]]; then
    fzf-cd-widget
  else
    zle fzf_completion
  fi
}

zle -N __tab_cd_or_fzf
bindkey '^I' __tab_cd_or_fzf

# }}}
