""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Init
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

" Originally changed for the fractional different versions of vim I have to
" work with, I realized that .vim and .config/nvim are the same folder: both
" are symlinks to .dotfiles/vim. So this path shouldn't need to ever change.
"
" See: https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle')

" Vundle.
Plugin 'VundleVim/Vundle.vim'

" Colours for gvim/MacVim.
Plugin 'mkarmona/colorsbox'

" Colours for terminal.
Plugin 'zefei/simple-dark'
Plugin 'nightsense/snow'
Plugin 'kadekillary/skull-vim'

" Grab-bag, because it'll surely have a theme supported everywhere.
Plugin 'rafi/awesome-vim-colorschemes'

" Asynchronous syntax checking and linting.
Plugin 'neoclide/coc.nvim'

" Asynchronous syntax checking and linting (Windows-see below).
Plugin 'dense-analysis/ale'
Plugin 'ervandew/supertab'

" RAWEAJEFLSEFASLefSJEFSefsef DEATH TO WHITESPACES
Plugin 'bronson/vim-trailing-whitespace'

" Provide additional text targets for di/a<char>:
" , . ; : + - = ~ _ * # / | \ & $
Plugin 'wellle/targets.vim'

" Provide motion keyed to gs<motion> to sort stuff.
Plugin 'christoomey/vim-sort-motion'

" Better FfTt action.
Plugin 'unblevable/quick-scope'

" Auto CD to project root.
Plugin 'airblade/vim-rooter'

" Quickly change wrapping characters with cs<char>.
Plugin 'tpope/vim-surround'

" Case-insensitive replacement
Plugin 'tpope/vim-abolish'

" Authoring (Markdown and article writing).
Plugin 'junegunn/goyo.vim'

" Quickly search for and open files in the current buffer, new split or tab.
Plugin 'ctrlpvim/ctrlp.vim'

" Grep through and open files.
Plugin 'mileszs/ack.vim'

" Auto pair brackets, like.
Plugin 'jiangmiao/auto-pairs'

" Ruby and Rails utilities. Tim Pope is God. God.
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-endwise'
" Plugin 'ngmy/vim-rubocop'

" Toggle comments.
Plugin 'tomtom/tcomment_vim'

" Show git diffs in the gutter.
Plugin 'airblade/vim-gitgutter'

" Status bar.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntax highlighting.
Plugin 'sheerun/vim-polyglot'

" HTML expansion.
Plugin 'mattn/emmet-vim'

call vundle#end()

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
  set rtp-=~/.vim/bundle/coc.nvim
else
  set rtp-=~/.vim/bundle/ale
  set rtp-=~/.vim/bundle/supertab
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
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bind CtrlP to <leader>
let g:ctrlp_map = '<leader>p'

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
" Ag/Ack/FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ackprg = 'ag --vimgrep'
let g:RootIgnoreAgignore = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_lint_on_enter	= 1
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
