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
      -- INFO(mgrealis 2026-02-26): monorepo is hella slow with 'path' enabled
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      default = { 'lsp', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' }
  },
  opts_extend = { 'sources.default' }
}
