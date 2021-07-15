""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>"

" Use s and S to quickly search and replace in content: sfoo/bar Sfoo/bar.
nnoremap s :s,,<left>
nnoremap S :%s,,<left>
nnoremap <leader>S :%S,,<left>

" Use <Tab> to cycle through buffers.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split buffer.
nnoremap <leader>v :vsp<CR>
noremap <leader>x :sp<CR>

" Toggle spellchecking.
nnoremap <leader>sp :setlocal spell!<CR>

" Toggle highlighted results.
nnoremap <silent><bs> :nohlsearch<CR>

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
nnoremap <silent><leader>jf :set ft=json <bar> %!python -m json.tool<CR>

" Toggle quickfix window.
nnoremap <leader>qf :call QuickfixToggle()<CR>

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

" Rebind : to reduce pinky stretching
" NOTE(mark): disabled as these worked well, but were a bit hair trigger
" I need some sort of check for "if not in command mode"
" nnoremap <Esc> <Esc>:
" vnoremap <Esc> <Esc>:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" goyo
nnoremap <silent><leader>gy :Goyo<CR>

" fzf
nnoremap <silent><leader>f :Rg<CR>
nnoremap <silent><leader>p :Files<CR>
nnoremap <silent><leader>bl :BLines<CR>

" vim-fugitive
nnoremap <silent><leader>gb :Git blame<CR>
nnoremap <silent><leader>gc :Git commit<CR>
nnoremap <silent><leader>gp :Git push<CR>
nnoremap <silent><leader>gw :Gw<CR>
" git checkout the currently edited file. Useful for scratch work.
nnoremap <leader>gr :!git checkout %<CR>
