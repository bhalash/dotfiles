" TODO(mark 2021-12-29): set up some sort of snippet engine?

" Arrow function
iab <buffer> xa () => {}<left>

" jasmine/jest test boilerplate
iab <buffer> de@ describe('@', () => {<CR>});<Esc>O
iab <buffer> it@ it('should %', () => {<CR>});<Esc>O
iab <buffer> xp@ expect('foo').toBe('bar');<Esc>
iab <buffer> be@ beforeEach(() => {<CR>});<Esc>O
iab <buffer> af@ afterEach(() => {<CR>});<Esc>O

" function export
iab <buffer> fun@ export function changeMe(): void {}<Left><CR>

" class, constructor and method
iab <buffer> cls export class ChangeMe {}<Left><CR>
iab <buffer> csr constructor() {}<Esc>a
iab <buffer> mtd method(): void {}<Esc>a

" import statement
iab <buffer> imp@ import {<CR>} from '@@';<Up><CR><Esc>

" console.log
iab <buffer> con@ console.log()<Left>
