" TODO(mark 2021-12-29): set up some sort of snippet engine

" Arrow function
iab <buffer> xa () => {}<left>

" Block comment
iab <buffer> /* /**<CR><CR>/<Up>

" jasmine/jest test boilerplate
iab <buffer> desc describe('CHANGEME', () => {});<Esc>2hi<CR>
iab <buffer> rit it('CHANGEME', () => {});<Esc>2hi<CR>
iab <buffer> xpe expect('foo').toBe('bar');

" function export
iab <buffer> function export function changeMe(): void {}<Left><CR>

" class, constructor and method
iab <buffer> cls export class ChangeMe {}<Left><CR>
iab <buffer> csr constructor() {}<Esc>a
iab <buffer> mtd method(): void {}<Esc>a

" import statement
iab <buffer> import import { Whatever} from 'CHANGEME';<Esc>

" console.log
iab <buffer> c@ console.log();<Esc>hi
