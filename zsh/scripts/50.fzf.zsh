# See: https://github.com/Aloxaf/fzf-tab

# ! FZF {{{

# TODO(mark 2021-12-29): this whole section needs revision
# See: https://github.com/junegunn/fzf#environment-variables
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!.git/*" -g "!.gitkeep"'
export FZF_CTRL_T_COMMAND='rg --files --null | xargs -0 dirname | sort | uniq'
export FZF_ALT_C_COMMAND='rg --files --null | xargs -0 dirname | sort | uniq'

if [[ $OSTYPE =~ 'linux-gnu' ]]; then
  source '/usr/share/doc/fzf/examples/key-bindings.zsh'
  source '/usr/share/doc/fzf/examples/completion.zsh'
fi

# FIXME(mark 2023-05-02): Disabled because this is slow as hell in WSL.
# if [[ -f "$DOTFILES_DIR/fzf-tab/fzf-tab.plugin.zsh" ]]; then
#   source "$DOTFILES_DIR/fzf-tab/fzf-tab.plugin.zsh"
# fi

# Widget: bind cd to <tab> {{{

function _tab_cd {
  if [[ $#BUFFER == 0 ]]; then
    fzf-cd-widget
  else
    zle expand-or-complete
  fi
}

zle -N _tab_cd
bindkey '^I' _tab_cd

# }}}
