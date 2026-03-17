return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'cssls',
      'html',
      'jsonls',
      'lua_ls',
      'tailwindcss',
      'tsgo',
      'vimls',
      'yamlls',
      -- 'angularls',
      -- 'sqlls',
    },
    automatic_enable = {
      'html',
      'lua_ls',
      'tsgo',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
