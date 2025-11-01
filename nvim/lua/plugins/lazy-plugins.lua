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

  -- Provide motion keyed to go<motion> to sort stuff
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
        width = 160,
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

  -- Show indentation
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
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

  'neovim/nvim-lspconfig',

  -- Weird-ass format used for broot configuraton.
  { 'hjson/vim-hjson', ft = 'hjson' },
  'jidn/vim-dbml',

  {
    'folke/flash.nvim',
    opts = {},
    keys = {
      -- TODO(mark.grealish 2025-11-01): This is a neat plugin, but it also annoys me.
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      -- FIXME(mark.grealish 2025-11-01): Re-enable these ASASP.
      -- { 'r', mode = 'o', function() require'flash'.remote() end, desc = 'Remote Flash' },
      -- { 'R', mode = { 'o', 'x' }, function() require'flash'.treesitter_search() end, desc = 'Treesitter Search' },
      -- { '<c-s>', mode = { 'c' }, function() require'flash'.toggle() end, desc = 'Toggle Flash Search' },
      -- { '/', mode = { 'c' }, function() require'flash'.toggle() end, desc = 'Toggle Flash Search' },
    },
  }
}
