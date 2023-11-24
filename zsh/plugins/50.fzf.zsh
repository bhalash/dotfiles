#!/usr/bin/env zsh

# See: https://github.com/Aloxaf/fzf-tab

# ! FZF {{{

# TODO(mark 2021-12-29): this whole section needs revision
# See: https://github.com/junegunn/fzf#environment-variables
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden -g '!.git/*' -g '!.gitkeep'"
export FZF_CTRL_T_COMMAND='rg --files --null | xargs -0 dirname | sort | uniq'
export FZF_ALT_C_COMMAND='rg --files --null | xargs -0 dirname | sort | uniq'

if [[ $OSTYPE =~ 'linux-gnu' ]]; then
  source '/usr/share/doc/fzf/examples/key-bindings.zsh'
  source '/usr/share/doc/fzf/examples/completion.zsh'
fi

source $DOTFILES_DIR/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# Widget: bind cd to <tab>, or fallthrough to fzf-zsh-completion {{{

function _tab_cd_or_fzf {
  if [[ $#BUFFER == 0 ]]; then
    fzf-cd-widget
  else
    zle fzf_completion
  fi
}

zle -N _tab_cd_or_fzf
bindkey '^I' _tab_cd_or_fzf

# }}}
