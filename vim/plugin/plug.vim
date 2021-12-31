" vim-plug {{{

call plug#begin('$HOME/.vim/extensions')

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

" Quickly change wrapping characters with cs<char>
Plug 'tpope/vim-surround'

" Case-insensitive replacement
Plug 'tpope/vim-abolish'

" Distraction-free mode
Plug 'junegunn/goyo.vim'

" JavaScript
Plug 'yuezk/vim-js'

" Auto pair brackets, like
Plug 'jiangmiao/auto-pairs'

" Toggle comments
Plug 'tpope/vim-commentary'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" HTML expansion
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'alvan/vim-closetag', { 'for': ['html'] }

" Colorschemes
Plug 'aonemd/kuroi.vim'
Plug 'jacoborus/tender.vim'
Plug 'jordwalke/flatlandia'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'romainl/apprentice'

" File finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'austintraver/vim-jrnl'

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
let g:goyo_height = 100
let g:goyo_linenr = 1

function! s:goyo_enter()
  set norelativenumber
endfunction

function! s:goyo_leave()
  set relativenumber
endfunction

" }}}

" junegunn/fzf.vim {{{

" Reuse the existing buffer when opening a file which is already open
" See: https://github.com/junegunn/fzf.vim/issues/98
let g:fzf_buffers_jump = 1

" Match fzf.vim to colorscheme
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

" }}}

" tpope/vim-obsession {{{

" Autoload sessions created by tpope's vim-obsession when starting Vim
" See: https://gist.github.com/robmiller/5135652
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested
  \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
  \   source Session.vim |
  \ endif
augroup END

" }}}
