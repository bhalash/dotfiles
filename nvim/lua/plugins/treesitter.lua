-- treesitter
return {
  'nvim-treesitter/completion-treesitter',
  {
    'nvim-treesitter/nvim-treesitter',
    -- version = false, -- use latest
    opts = {
      highlight = {
        enable = true,
      },
      ensure_installed = {
        'angular',
        'bash',
        'css',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'regex',
        'typescript',
        'vim',
        'yaml',
      },
    },
    config = function(_, opts)
      require'nvim-treesitter.install'.prefer_git = true
      require'nvim-treesitter.configs'.setup(opts)
    end,
  },
}
