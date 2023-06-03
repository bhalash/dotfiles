" Normal {{{

" Leaduhr
let mapleader = ' '

" Fits with tmux prefix being on C-a
nnoremap <C-s> <C-a>

" Remap alternate-file to '', easier on my stupid keyboard
noremap '' <C-^>

" Page up and down on nav keys
noremap <C-j> <PageDown>
noremap <C-k> <PageUp>

" Use <Tab> to cycle through buffers in tab
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split buffer horizontally or vertically or tabically
nnoremap <leader>v :vsp<CR>
nnoremap <leader>x :sp<CR>
nnoremap <leader>t :tabedit %<CR>

" Toggle spellchecking
nnoremap <leader>a :setlocal spell!<CR>

" Clear highlighted search easier
nnoremap <silent><BS> :nohlsearch<CR>

" Strip all trailing whitespace from the file
nnoremap <silent><leader><BS> :%s/\s\+$//<CR>:let @/=''<CR> :nohlsearch<CR> :w<CR>

" Stop * jumping to next occurrence
nnoremap * :keepjumps normal! mi*`i<CR>

" Most of the time I'm happy with the top seplling suggestion
nnoremap z= 1z=

" Insert one character at end of line, because I am lazy, lol
" nnoremap <silent><CR> :exec "normal A".nr2char(getchar())."\e"<CR>

" More quicklier faster change ft
" nnoremap <leader>tt :set ft=

" }}}

" telescope.nvim {{{

nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>o :Telescope oldfiles<CR>
nnoremap <leader>r :Telescope live_grep<CR>
nnoremap <leader>q :Telescope command_history<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>/ :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>k :Telescope keymaps<CR>
nnoremap <leader>n :Telescope git_bcommits<CR>
nnoremap <leader>, :Telescope colorscheme<CR>

" }}}

" Colorcolumn {{{

nnoremap <silent><leader>ce :set colorcolumn=<CR>
nnoremap <silent><leader>cc :set colorcolumn=80<CR>
nnoremap <silent><leader>co :set colorcolumn=120<CR>
nnoremap <silent><leader>cg :execute 'set colorcolumn=' . col('.')<CR>

" }}}

" Search/Replace {{{

" Stolen from Reddit
nnoremap <CR> ciw
" Replace all instances of word on line
nnoremap <leader><CR> :s/\<<C-r>=expand("<cword>")<CR>\>/
" nnoremap <C-Tab> :%s/\<<C-r>=expand("<cword>")<CR>\>/

" Take visual selection and search with it
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" }}}

" Yank {{{

" These keys are awkward to reach in combination on my stupid keyboard
nnoremap + "+
vnoremap + "+

" Yank the whole file to system clipboard
nnoremap <leader>yy :%y+<CR>
" Yank marked up snippet to clipboard
vnoremap <leader>y :call functions#YankSnippet()<CR>

" }}}

" zen-mode.nvim {{{

nnoremap <silent><leader>z :ZenMode<CR>

" }}}

" tpope/vim-fugitive {{{

nnoremap <silent><leader>gdd :GDelete!<CR>
nnoremap <silent><leader>gb :Git blame<CR>
nnoremap <silent><leader>gp :Git pull<CR>
nnoremap <silent><leader>gu :Git push<CR>
nnoremap <silent><leader>gs :Git status<CR>
nnoremap <silent><leader>cv :Gvdiffsplit<CR>
nnoremap <silent><leader>gw :Gw<CR>
nnoremap <silent><leader>gc :Git commit<CR>
nnoremap <silent><leader>w :Gw<CR>
" reset the file in the current buffer
nnoremap <silent><leader>ge :!git checkout %<CR>

" }}}
