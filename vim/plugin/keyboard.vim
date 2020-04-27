""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>"

" Use <Tab> to cycle through buffers.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split file.
nnoremap <silent><leader>v <c-w>v<c-w>l

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

" Empty line of content without removing line ending.
nnoremap <leader>dl :s/.*//<CR> :noh<CR>

" Strip trailing whitespace from the file.
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :noh<CR>

" Delete all leading spaces on a line.
nnoremap <silent><leader>d<space> :s/^\s\+//<CR> :noh<CR>

" Quickly yank all lines in the file.
nnoremap <leader>yy :%y+<CR>

" Replace all lines in the file with the contents of the clipboard.
nnoremap <silent><leader>rp gg"_dGVp

" Open and close new tab.
nnoremap <silent><leader>tt :tabnew<CR>:Startify<CR>
nnoremap <silent><leader>tw :tabclose<CR>

" Progress forward and backwards with multiple panes open.
nnoremap <silent><leader>r :prev<CR>
nnoremap <silent><leader>n :n<CR>

" Stop * searches jumping word.
nnoremap * :keepjumps normal! mi*`i<CR>

" Format JSON in buffer.
nnoremap <silent><leader>js :%!python -m json.tool<CR>

" Toggle quickfix window.
nnoremap <leader>q :call QuickfixToggle()<CR>

" Escape < and > in HTML
nnoremap <leader>es :s/</\&lt;/e \| :s/>/\&gt;/e <CR>

" Set colorcolumn at current cursor column.
nnoremap <silent><leader>ch :execute 'set colorcolumn=' . col('.')<CR>

" Set and clear colorcolumn.
nnoremap <silent><leader>cc :set colorcolumn=<CR>
nnoremap <silent><leader>c0 :set colorcolumn=<CR>
nnoremap <silent><leader>c1 :set colorcolumn=120<CR>
nnoremap <silent><leader>c8 :set colorcolumn=80<CR>

" Fix missing cursor.
nnoremap <silent><leader>fc :!printf '\e[?25h'<CR>

" Remove fucky quote characters in snippets pasted from Microsoft Word/HTML.
nnoremap <silent><leader>cj :%s/[‘’]/'/e \| %s/[“”]/"/e<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GitGutter
nnoremap <leader>gg :GitGutterToggle<CR>

" CtrlP: Clear cache.
nnoremap <leader>5 :CtrlPClearCache<CR>

" Goyo
nnoremap <silent><leader>go :Goyo<CR>

" Ale
nnoremap <silent><leader>[ <Plug>(ale_previous_wrap)
nnoremap <silent><leader>] <Plug>(ale_next_wrap)
nnoremap <silent><leader>at :ALEToggle<CR>
