" See: https://github.com/nvim-treesitter/nvim-treesitter#folding
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldlevelstart=999
" setlocal foldmethod=manual

" console.log
iab <buffer> cl/ console.log();<Left><Left>
" Fucking arrow fucking function
iab <buffer> g/ () =>
" Import statement
iab <buffer> imp/ import {} from '@@';<Esc>F{a
" Test boilerplate
iab <buffer> de/ describe('', () => {<CR><Esc>k^f'a
iab <buffer> it/ it('should', () => {<CR><Esc>k^fda
iab <buffer> be/ beforeEach(() => {<CR><Esc>O
iab <buffer> tr/ expect().toBeTruthy();<Esc>^f(a
iab <buffer> eq/ expect().toEqual();<Esc>^f(
iab <buffer> to/ expect().toBe();<Esc>^f(
iab <buffer> ba/ beforeAll(() => {<CR>});<Esc>O
" iab <buffer> be/ beforeEach(() => {<CR>});<Esc>O
iab <buffer> ae/ afterEach(() => {<CR>});<Esc>O
iab <buffer> aa/ afterAll(() => {<CR>});<Esc>O
