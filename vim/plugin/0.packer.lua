-- Packer Boostrap {{{

local ensure_packer = function()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  else
    return false
  end
end

local packer_bootstrap = ensure_packer()

-- }}}

-- Packer Setup {{{

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
  use 'bronson/vim-trailing-whitespace'

  -- Provide additional text targets for di/a<char>:
  -- , . ; : + - = ~ _ * # / | \ & $
  use 'wellle/targets.vim'

  -- Provide motion keyed to gs<motion> to sort stuff
  use 'bhalash/vim-sort-motion'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-indent'

  -- Better FfTt action
  use 'unblevable/quick-scope'

  -- Better handling of paired characters
  use 'tpope/vim-surround'

  -- Distraction-free mode
  use 'folke/zen-mode.nvim'

  -- Auto pair brackets, like
  use 'windwp/nvim-autopairs'

  -- Toggle comments
  use 'numToStr/Comment.nvim'

  -- git'n'shit
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'

  -- HTML expansion
  use { 'alvan/vim-closetag', ft = 'html' }

  -- Colorschemes
  use 'ayu-theme/ayu-vim'
  use 'rafi/awesome-vim-colorschemes'
  use 'projekt0n/github-nvim-theme'
  use 'HicaroD/alice.nvim'

  -- File finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Language server
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', config = 'vim.cmd([[TSUpdate]])' }
  use 'nvim-treesitter/completion-treesitter'

  use 'ggandor/leap.nvim' -- Blood!

  -- Show indentation
  -- use 'lukas-reineke/indent-blankline.nvim'

  use 'kyazdani42/nvim-web-devicons'

  -- Display marks within the buffer
  use 'kshenoy/vim-signature'

  -- Session management
  use 'tpope/vim-obsession'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- }}}

-- airblade/vim-rooter {{{

vim.g.rooter_silent_chdir = 1
vim.g.rooter_patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile' }

-- }}}

-- unblevable/quick-scope {{{

-- Only highlight keys when the appropriate key is depressed
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

-- }}}

-- bronson/vim-trailing-whitespace {{{

-- Don't highlight whitespace in Markdown
vim.g.extra_whitespace_ignored_filetypes = { 'markdown' }

-- }}}

-- nvim-treesitter/nvim-treesitter {{{

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'html',
    'lua',
    'scss',
    'typescript',
    'vim',
  },
  highlight = {
    enabled = true,
    -- additional_vim_regex_highlighting = true,
  }
}

-- }}}

-- zen-mode.nvim {{{

require'zen-mode'.setup {
  window = {
    width = 120,
    height = 1,
  },
}

-- }}}

-- https://github.com/windwp/nvim-autopairs {{{

require'nvim-autopairs'.setup {
  -- enable_abbr = true,
  disable_in_visualblock = true
}

-- }}}

-- https://github.com/numToStr/Comment.nvim {{{

require'Comment'.setup {
  ft = {
    typescript = {'//%s', '/**%s*/'}
  }
}

-- }}}

-- TODO(mark 2023-11-24): Read docs: https://github.com/ggandor/leap.nvim
require'leap'.add_default_mappings()
