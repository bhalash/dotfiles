" junegunn/vim-plug {{{

call plug#begin('$HOME/.vim/extensions')

Plug 'ouuan/vim-plug-config'

" RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
Plug 'bronson/vim-trailing-whitespace'

" Provide additional text targets for di/a<char>:
" , . ; : + - = ~ _ * # / | \ & $
Plug 'wellle/targets.vim'

" Provide motion keyed to gs<motion> to sort stuff
Plug 'christoomey/vim-sort-motion'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

" Better FfTt action
Plug 'unblevable/quick-scope'

" Auto CD to project root
Plug 'airblade/vim-rooter'

" Better handling of paired characters
Plug 'tpope/vim-surround'

" Case-insensitive replacement
Plug 'tpope/vim-abolish'

" Distraction-free mode
Plug 'junegunn/goyo.vim'

" Auto pair brackets, like
Plug 'jiangmiao/auto-pairs'

" Toggle comments
Plug 'tpope/vim-commentary'

" git'n'shit
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'kdheepak/lazygit.nvim'

" HTML expansion
Plug 'alvan/vim-closetag', { 'for': ['html'] }

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'EdenEast/nightfox.nvim'

" File finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Language server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/completion-treesitter'
Plug 'mracos/mermaid.vim'

" Show indentation
Plug 'lukas-reineke/indent-blankline.nvim'

" Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Display marks within the buffer
Plug 'kshenoy/vim-signature'

" Session management
Plug 'tpope/vim-obsession'

call plug#end()

" }}}

" airblade/vim-rooter {{{

let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile']

" }}}

" unblevable/quick-scope {{{

" Only highlight keys when the appropriate key is depressed
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" }}}

" bronson/vim-trailing-whitespace {{{

" Don't highlight whitespace in Markdown
let g:extra_whitespace_ignored_filetypes = ['markdown']

" }}}

" junegunn/goyo.vim {{{

let g:goyo_width = 120
let g:goyo_height = '100%'
let g:goyo_linenr = 1

" }}}

" nvim-treesitter/nvim-treesitter {{{

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "lua", "scss", "typescript", "vim" },
  highlight = {
    enable = true,
  }
}
EOF

" }}}

" telescope.nvim {{{

lua <<EOF

local actions = require'telescope.actions'

require'telescope'.setup {
  defaults = {
    path_display = { 'smart' },
    layout_config = {
      horizontal = {
        height = 0.9,
        width = 0.9
      }
    },
    file_ignore_patterns = {
      '^.git/'
    },
    mappings = {
      i = {
        ['<esc>'] = actions.close
      }
    },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--follow"},
      hidden = true
    }
  }
}

require('telescope')

EOF

" }}}
