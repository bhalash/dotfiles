return {
  'Saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'enter',
    },
    completion = {
      keyword = {
        range = 'prefix'
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' }
  },
  opts_extend = { 'sources.default' }
}
