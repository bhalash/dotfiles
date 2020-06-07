""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>"

" Use <Tab> to cycle through buffers.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split file.
nnoremap <leader>v :vsp<CR>
noremap <leader>x :sp<CR>

" Toggle spellchecking.
nnoremap <leader>sp :setlocal spell!<CR>

" Toggle highlighted results.
nnoremap <silent><bs> :nohlsearch<CR>

" Use s and S to quickly search and replace in content: sfoo/bar Sfoo/bar.
nnoremap s :s,,<left>
nnoremap S :%s,,<left>
nnoremap <leader>S :%S,,<left>

" git checkout the currently edited file. Useful for scratch work.
nnoremap <leader>gr :!git checkout %<CR>

" Strip trailing whitespace from the file.
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :noh<CR>

" Delete all leading spaces on a line.
nnoremap <silent><leader>d<space> :s/^\s\+//<CR> :noh<CR>

" Quickly yank all lines in the file.
nnoremap <leader>yy :%y+<CR>

" Replace all lines in the file with the contents of the clipboard.
nnoremap <silent><leader>rp gg"_dGVp

" Stop * searches jumping word.
nnoremap * :keepjumps normal! mi*`i<CR>

" Format JSON in buffer.
nnoremap <silent><leader>jf :%!python -m json.tool<CR>

" Toggle quickfix window.
nnoremap <leader>q :call QuickfixToggle()<CR>

" Set colorcolumn at current cursor column.
nnoremap <silent><leader>ch :execute 'set colorcolumn=' . col('.')<CR>

" Set and clear colorcolumn.
nnoremap <silent><leader>cc :set colorcolumn=<CR>
nnoremap <silent><leader>c0 :set colorcolumn=<CR>
nnoremap <silent><leader>c1 :set colorcolumn=120<CR>
nnoremap <silent><leader>c8 :set colorcolumn=80<CR>

" Remove fucky quote characters in snippets pasted from Microsoft Word/HTML.
nnoremap <silent><leader>cj :%s/[‘’]/'/e \| %s/[“”]/"/e<CR>

" Take visual selection and search with it.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" goyo
nnoremap <silent><leader>go :Goyo<CR>

" ale
nnoremap <silent><leader>[ <Plug>(ale_previous_wrap)
nnoremap <silent><leader>] <Plug>(ale_next_wrap)
nnoremap <silent><leader>at :ALEToggle<CR>

" fzf
nnoremap <silent><leader>p :GFiles<CR>
nnoremap <silent><leader>f :Files<CR>

" vim-fugitive
nnoremap <silent><leader>gb :Gblame<CR>

" grepper
nnore  <silent><leader>gg :Grepper<CR>
