# Lazyload: Angular CLI {{{
# See: https://peterlyons.com/problog/2018/01/zsh-lazy-loading/

function ng {
  unfunction "$0"
  # Load Angular CLI autocompletion.
  source <(ng completion script)
  ng "$@"
}
