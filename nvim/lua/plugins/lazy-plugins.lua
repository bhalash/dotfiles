-- bronson/vim-trailing-whitespace {{{

-- Don't highlight whitespace in Markdown
vim.g.extra_whitespace_ignored_filetypes = { 'markdown' }

-- }}}

-- TODO(mark 2023-11-24): Read docs: https://github.com/ggandor/leap.nvim
-- require'leap'.add_default_mappings()

return {
  {
    'vhyrro/luarocks.nvim',
    -- Very high priority is required, luarocks.nvim should run as the first
    -- plugin in your config.
    priority = 1000,
    config = true,
  },

  -- RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
  'bronson/vim-trailing-whitespace',

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
    opts = {
      ft = {
        typescript = {'//%s', '/**%s*/'}
      }
    }
  },

  -- Language server
  { 'neoclide/coc.nvim', branch = 'release' },

  -- Blood!
  'ggandor/leap.nvim',

  -- Show indentation
  'lukas-reineke/indent-blankline.nvim',

  -- Fancy stuff
  'kyazdani42/nvim-web-devicons',

  -- Display marks within the buffer
  'kshenoy/vim-signature',
}
