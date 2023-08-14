" Arrow functions
iab <buffer> ()) () =>

" Test boilerplate
" iab <buffer> de/ describe('', () => {<CR>});<Esc>k^f'a
" iab <buffer> it/ it('should', () => {<CR>});<Esc>k^fda
iab <buffer> de/ describe('', () => {<CR><Esc>k^f'a
iab <buffer> it/ it('should', () => {<CR><Esc>k^fda
iab <buffer> be/ beforeEach(() => {<CR><Esc>O

iab <buffer> tr/ expect().toBeTruthy();<Esc>^f(a
iab <buffer> ec/ expect().toHaveBeenCalled();<Esc>^f(a
iab <buffer> ecw/ expect().toHaveBeenCalledWith();<Esc>@xi
iab <buffer> eq/ expect().toEqual();<Esc>^f(
iab <buffer> to/ expect().toBe();<Esc>^f(
iab <buffer> ba/ beforeAll(() => {<CR>});<Esc>O
" iab <buffer> be/ beforeEach(() => {<CR>});<Esc>O
iab <buffer> ae/ afterEach(() => {<CR>});<Esc>O
iab <buffer> aa/ afterAll(() => {<CR>});<Esc>O
iab <buffer> spy/ spyOn();<Esc>^f(
iab <buffer> spyp/ spyOnProperty();<Esc>^f(
iab <buffer> spypr/ spyOnProperty().and.returnValue()w<Esc>^f(
iab <buffer> spyr/ spyOn().and.return.Value();<Esc>^f(
iab <buffer> ob/ expect().toBeObservable(expected$);<Esc>^f(

iab <buffer> xp/ let expected$: any;<Esc>

" function export
iab <buffer> fun/ export function changeMe(): void {}<Left><CR>

" class, constructor and method
iab <buffer> cls export class ChangeMe {}<Left><CR>
iab <buffer> csr constructor() {}<Esc>a
iab <buffer> mtd method(): void {}<Esc>a

" import statement
iab <buffer> imp/ import {<CR>} from '@@';<Up><CR><Esc>

" console/log
iab <buffer> c/ console.log()<Left>

" Fucking arrow fucking function
iab <buffer> g/ () =>

" See: https://github.com/nvim-treesitter/nvim-treesitter#folding
" setlocal foldmethod=expr
" setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmethod=manual
setlocal foldlevelstart=999
