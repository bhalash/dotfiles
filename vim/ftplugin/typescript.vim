" Arrow functions
iab <buffer> ar. () =>
iab <buffer> am. () => {}<Left><Space><Left>

" Test boilerplate
iab <buffer> de. describe('', () => {<CR>});<Esc>k^f'a
iab <buffer> it. it('should', () => {<CR>});<Esc>k^fda
iab <buffer> tr. expect().toBeTruthy();<Esc>^f(a
iab <buffer> ec. expect().toHaveBeenCalled();<Esc>^f(a
iab <buffer> ecw. expect().toHaveBeenCalledWith();<Esc>@xi
iab <buffer> eq. expect().toEqual();<Esc>
iab <buffer> be. expect().toBe();<Esc>
iab <buffer> be. beforeEach(() => {<CR>});<Esc>O
iab <buffer> ba. beforeAll(() => {<CR>});<Esc>O
iab <buffer> af. afterEach(() => {<CR>});<Esc>O
iab <buffer> aa. afterAll(() => {<CR>});<Esc>O
iab <buffer> spy. spyOn();<Esc>^f(
iab <buffer> spyp. spyOnProperty();<Esc>^f(
iab <buffer> spypr. spyOnProperty().and.returnValue()w<Esc>^f(
iab <buffer> spyr. spyOn().and.return.Value();<Esc>^f(

iab <buffer> xp. let expected$: any;<Esc>

" function export
iab <buffer> fun. export function changeMe(): void {}<Left><CR>

" class, constructor and method
iab <buffer> cls export class ChangeMe {}<Left><CR>
iab <buffer> csr constructor() {}<Esc>a
iab <buffer> mtd method(): void {}<Esc>a

" import statement
iab <buffer> imp. import {<CR>} from '@@';<Up><CR><Esc>

" console.log
iab <buffer> con. console.log()<Left>

" Folding good
setlocal foldmethod=syntax
setlocal foldlevelstart=99
