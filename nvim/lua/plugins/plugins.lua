return {
  {
    'vhyrro/luarocks.nvim',
    -- Very high priority is required, luarocks.nvim should run as the first
    -- plugin in your config.
    priority = 1000,
    config = true,
  },

  {
    -- git
    'airblade/vim-gitgutter',
    'tpope/vim-fugitive',
    'editorconfig/editorconfig-vim',
  },

  'neovim/nvim-lspconfig',

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      enabled = false, -- don't render markdown by default
      document = {
        enabled = false,
      },
      completions = {
        lsp = { enabled = true },
      },
    }
  },

  -- RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
  'bronson/vim-trailing-whitespace',

  -- Provide additional text targets for di/a<char>: , . ; : + - = ~ _ * # / | \ & $
  'wellle/targets.vim',

  -- provide motion keyed to gs<motion> to sort stuff
  -- TODO(mark 2026-09-29): port to lua
  'bhalash/vim-sort-motion',

  -- treat indentations as a text object <3
  {
    'kana/vim-textobj-indent',
    dependencies = { 'kana/vim-textobj-user' }
  },

  -- Better FfTt action
  'unblevable/quick-scope',

  -- Better handling of paired characters
  'tpope/vim-surround',

  -- Auto pair brackets, like
  {
    'windwp/nvim-autopairs',
    opts = {
      -- enable_abbr = true,
      disable_in_visualblock = true
    }
  },

  -- toggle comments
  {
    'numToStr/Comment.nvim',
    load = function()
      local ft = require'Comment.ft'
      local comment = require'Comment'

      comment.setup {
        -- space after e.g. //
        padding = true
      }

      ft
      .set('typescript', {'//%s', '/*%s*/'})
      .set('javascript', {'//%s', '/*%s*/'})
      .set('scss', {'//%s', '/*%s*/'})
    end
  },

  -- Fancy icons
  'kyazdani42/nvim-web-devicons',

  -- Display marks within the buffer
  'kshenoy/vim-signature',

  -- Automatically close HTML tags
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require'nvim-ts-autotag'.setup()
    end
  },

  -- Weird-ass filetypes
  { 'hjson/vim-hjson', ft = 'hjson' },
  { 'jidn/vim-dbml', ft = 'dbml' },

  {
    'mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = '^9',
    -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
    -- No need for lazy.nvim to lazy-load it.
    lazy = false,
  },

  {
    'sindrets/diffview.nvim',
    opts = {
      file_panel = {
        win_config = {
          position = 'left',
          width = 60,
          win_opts = {},
        },
      },
    }
  },

  -- find and replace
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
  },
}
