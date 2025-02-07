return {
  {
    'vhyrro/luarocks.nvim',
    -- Very high priority is required, luarocks.nvim should run as the first
    -- plugin in your config.
    priority = 1000,
    config = true,
  },

  -- RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
  {
    'bronson/vim-trailing-whitespace',
    init = function()
      -- Don't highlight whitespace in Markdown
      vim.g.extra_whitespace_ignored_filetypes = { 'markdown' }
    end
  },

  -- Provide additional text targets for di/a<char>:
  -- , . ; : + - = ~ _ * # / | \ & $
  'wellle/targets.vim',

  -- Provide motion keyed to gs<motion> to sort stuff
  'bhalash/vim-sort-motion',

  -- Treat indentations as a text object.
  {
    'kana/vim-textobj-indent',
    dependencies = { 'kana/vim-textobj-user' }
  },

  -- Better FfTt action
  'unblevable/quick-scope',

  -- Better handling of paired characters
  'tpope/vim-surround',

  -- Distraction-free mode
  {
    'folke/zen-mode.nvim',
    opts =  {
      window = {
        width = 120,
        height = 1,
      },
    },
  },

  -- Auto pair brackets, like
  {
    'windwp/nvim-autopairs',
    opts = {
      -- enable_abbr = true,
      disable_in_visualblock = true
    }
  },

  -- Toggle comments
  {
    'numToStr/Comment.nvim',
    config = function()
      local ft = require('Comment.ft')
      local comment = require('Comment')

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

  -- Navigate around.
  {
    'ggandor/leap.nvim',
    config = function()
      -- "gs" clashes with the vim sort motion
      -- https://github.com/ggandor/leap.nvim?tab=readme-ov-file#installation
      -- require'leap'.add_default_mappings()
      -- vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
      -- vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
      -- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end
  },

  -- Show indentation
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  -- Fancy icons
  'kyazdani42/nvim-web-devicons',

  -- Display marks within the buffer
  'kshenoy/vim-signature',
}
