" Normal {{{

" Fits with tmux prefix being on C-a
nnoremap <C-s> <C-a>

" These keys are awkward to reach in combination on my stupid keyboard
nnoremap + "+
vnoremap + "+

" Remap alternate-file to something easier on my stupid keyboard
noremap '' <C-^>

" Diff
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>do :windo diffoff<CR>

" Page up and down with minimal fuss
noremap <C-j> <PageDown>
noremap <C-k> <PageUp>
noremap <C-b> <NOP>
noremap <C-f> <NOP>

" Use <Tab> to cycle through buffers in tab
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split buffer horizontally or vertically
nnoremap <leader>v :vsp<CR>
nnoremap <leader>x :sp<CR>
nnoremap <leader>t :tabedit %<CR>

" Toggle spellchecking
nnoremap <leader><leader>p :setlocal spell!<CR>

" Clear highlighted results
nnoremap <silent><bs> :nohlsearch<CR>

" Strip all trailing whitespace from the file
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :nohlsearch<CR>

" Yank the whole file to system clipboard
nnoremap <leader>yy :%y+<CR>

" Stop * jumping to next occurrence
nnoremap * :keepjumps normal! mi*`i<CR>

" Yank filename
nnoremap <silent><leader>yp :let @" = expand('%')<CR>

" Most of the time I'm happy with the top seplling suggestion
nnoremap z= 1z=

" Insert ;, at end of line, because I am lazy, lol
nnoremap <leader>; A;<Esc>
nnoremap <leader>, A,<Esc>
nnoremap <leader>. A.<Esc>

" More quicklier faster change ft
nnoremap <leader>tt :set ft=

" }}}

" telescope.nvim {{{

nnoremap <leader>r :Telescope live_grep<CR>
nnoremap <leader>' :Telescope command_history<CR>
nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>/ :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>* :Telescope grep_string<CR>
nnoremap <leader>n :Telescope git_bcommits<CR>
nnoremap <leader>m :Telescope keymaps<CR>

" }}}

" Colorcolumn {{{

nnoremap <silent><leader>cc :set colorcolumn=<CR>
nnoremap <silent><leader>ce :set colorcolumn=80<CR>
nnoremap <silent><leader>co :set colorcolumn=120<CR>
nnoremap <silent><leader>cg :execute 'set colorcolumn=' . col('.')<CR>
nnoremap <silent><leader>cb :set colorcolumn=

" }}}

" Search/Replace {{{

" Double space on word to search for it and replace
" nnoremap <Space><Space> :%s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap s :s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap S :%s/\<<C-r>=expand("<cword>")<CR>\>/
vnoremap <leader>m <F7> :s/$/;/<CR>

" nnoremap S  :%s,
" nnoremap s  :s,

" Remove fucky quote characters in snippets pasted from Microsoft Word/HTML
nnoremap <silent><leader>cj :%s/[‘’]/'/e \| %s/[“”]/"/e<CR>

" Take visual selection and search with it
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Yank marked up snippet to clipboard
vnoremap <leader>y :call functions#YankSnippet()<CR>

" }}}

" junegunn/goyo.vim {{{

nnoremap <silent><leader><leader>g :Goyo<CR>

" }}}

" tpope/vim-fugitive {{{

nnoremap <silent><leader>fdd :GDelete!<CR>
nnoremap <silent><leader>fb :Git blame<CR>
nnoremap <silent><leader>fp :Git pull<CR>
nnoremap <silent><leader>fu :Git push<CR>
nnoremap <silent><leader>fs :Git status<CR>
nnoremap <silent><leader>ww :Gw<CR>
nnoremap <silent><leader>fc :Git commit<CR>
nnoremap <silent><leader>jj :LazyGit<CR>
" reset the file in the current buffer
nnoremap <silent><leader>fe :!git checkout %<CR>

" }}}
