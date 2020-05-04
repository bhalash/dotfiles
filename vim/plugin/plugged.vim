""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Init
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

call plug#begin('$HOME/.vim/extensions')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: Common
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
Plug 'bronson/vim-trailing-whitespace'

" Provide additional text targets for di/a<char>:
" , . ; : + - = ~ _ * # / | \ & $
Plug 'wellle/targets.vim'

" Provide motion keyed to gs<motion> to sort stuff.
Plug 'christoomey/vim-sort-motion'

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

" Grep through and open files.
" Plug 'mileszs/ack.vim'

" Auto pair brackets, like.
Plug 'jiangmiao/auto-pairs'

" Toggle comments.
Plug 'tomtom/tcomment_vim'

" git project management
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"HTML expansion.
Plug 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: Linux/MacOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme.
Plug 'andreasvc/vim-256noir'
Plug 'mkarmona/colorsbox'

" File finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linting and tab completion.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax highlighting.
Plug 'sheerun/vim-polyglot'

" Status bar.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme.
Plug 'w0ng/vim-hybrid'

" Syntax highlighting.
Plug 'HerringtonDarkholme/yats.vim'

" File finder.
Plug 'ctrlpvim/ctrlp.vim'

" Linting and tab completion.
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'

" Status bar.
Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Per-OS Plugin Configuration
"
" This is a necessary hack. The version of vim I use on Windows for work is
" relatively up to date, but chained to a horribly limited environment. Like the
" system has:
"
"   - Only Python 2.
"   - Only sandboxed access to an NPM mirror and so on.
"
" While I would prefer to use coc.nvim, it just does not work. Fallback to ale
" and supertab is Good Enough.
"
" See: https://stackoverflow.com/a/6706997/1433400
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('win32unix')
  " Disable Linux/MacOS
  set rtp-=~/.vim/bundle/coc.nvim
  set rtp-=~/.vim/bundle/colorsbox
  set rtp-=~/.vim/bundle/fzf
  set rtp-=~/.vim/bundle/fzf.vim
  set rtp-=~/.vim/bundle/vim-256noir
  set rtp-=~/.vim/bundle/vim-airline
  set rtp-=~/.vim/bundle/vim-airline-themes
  set rtp-=~/.vim/bundle/vim-polyglot
else
  " Disable Windows
  set rtp-=~/.vim/bundle/ale
  set rtp-=~/.vim/bundle/ctrlp.vim
  set rtp-=~/.vim/bundle/lightline.vim
  set rtp-=~/.vim/bundle/supertab
  set rtp-=~/.vim/bundle/vim-hybrid
  set rtp-=~/.vim/bundle/yats.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reduce timeout length on keystrokes. This is mostly for vim-statusline.
set ttimeout ttimeoutlen=50

" Disable markdown folding on load.
let g:vim_markdown_folding_disabled = 1

" Generate CTAGS upon file save.
let g:vim_tags_auto_generate = 1

" Silently auto CD to the root folder of the current git project.
let g:rooter_silent_chdir = 1

" Only highlight keys when the appropriate key is depressed.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:goyo_width = 170
let g:goyo_height = 90
let g:goyo_linenr = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keybind.
let g:ctrlp_map = '<leader>o'

" Permits us to change working directory in CtrlP while vim is open.
let g:ctrlp_working_path_mode = 0

" Enable hidden files, then later ignore stuff like git folders.
let g:ctrlp_dotfiles = 1

" Override default finder to make it respect .gitignore
let g:ctrlp_user_command = [
      \ '.git',
      \ 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f'
      \ ]

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_lint_on_enter  = 1
let g:ale_echo_msg_format = '%linter%: %s'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Extensions I want to keep.
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-marketplace',
      \ 'coc-tsserver'
      \ ]
