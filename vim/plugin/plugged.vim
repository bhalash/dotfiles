""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

call plug#begin('$HOME/.vim/extensions')

" RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
Plug 'bronson/vim-trailing-whitespace'

" Provide additional text targets for di/a<char>:
" , . ; : + - = ~ _ * # / | \ & $
Plug 'wellle/targets.vim'

" Provide motion keyed to gs<motion> to sort stuff.
Plug 'christoomey/vim-sort-motion'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

" Better FfTt action.
Plug 'unblevable/quick-scope'

" Auto CD to project root.
Plug 'airblade/vim-rooter'

" Quickly change wrapping characters with cs<char>.
Plug 'tpope/vim-surround'

" Case-insensitive replacement
Plug 'tpope/vim-abolish'

" Authoring (Markdown and article writing).
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Auto pair brackets, like.
Plug 'jiangmiao/auto-pairs'

" Toggle comments.
Plug 'tomtom/tcomment_vim'

" git project management
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" HTML expansion.
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'alvan/vim-closetag', { 'for': 'html' }

" Colorscheme.
Plug 'rafi/awesome-vim-colorschemes'
Plug 'andreasvc/vim-256noir'
Plug 'mkarmona/colorsbox'
Plug 'aonemd/kuroi.vim'

" File finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linting and tab completion.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax highlighting.
Plug 'sheerun/vim-polyglot'

" Nice fast background grepping.
Plug 'mhinz/vim-grepper'

" For file navigation
Plug 'tpope/vim-vinegar'

" Because eh?
Plug 'itchyny/lightline.vim'
Plug 'yarisgutierrez/ayu-lightline'

call plug#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airblade/vim-rooter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Silently auto CD to the root folder of the current git project.
let g:rooter_silent_chdir = 1

" Only highlight keys when the appropriate key is depressed.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/goyo.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:goyo_width = 170
let g:goyo_height = 90
let g:goyo_linenr = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline/airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Match fzf.vim to colorscheme.
" See: https://github.com/junegunn/fzf.vim/issues/581
let g:fzf_colors = {
      \ "fg":       ["fg", "Normal"],
      \ "bg":       ["bg", "Normal"],
      \ "hl":       ["fg", "IncSearch"],
      \ "fg+":      ["fg", "CursorLine", "CursorColumn", "Normal"],
      \ "bg+":      ["bg", "CursorLine", "CursorColumn"],
      \ "hl+":      ["fg", "IncSearch"],
      \ "info":     ["fg", "IncSearch"],
      \ "border":   ["fg", "Ignore"],
      \ "prompt":   ["fg", "Comment"],
      \ "pointer":  ["fg", "IncSearch"],
      \ "marker":   ["fg", "IncSearch"],
      \ "spinner":  ["fg", "IncSearch"],
      \ "header":   ["fg", "WildMenu"]
      \ }
