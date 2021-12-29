" TODO(mark 2021-12-29): set up some sort of snippet engine

" Arrow function
iab <buffer> xa () => {}<left>

" Block comment
iab <buffer> /* /**<CR><CR>/<Up>

" Test boilerplate
iab <buffer> desc describe('CHANGEME', () => {});<Left><Left><Left><CR>
iab <buffer> rit it('CHANGEME', () => {});<Left><Left><Left><CR>
iab <buffer> xpe expect("CHANGEME").toBe('CHANGEME');

" Function export
iab <buffer> function export function changeMe(): void {}<Left><CR>

" Class, constructor and method
iab <buffer> cls export class ChangeMe {}<Left><CR>
iab <buffer> csr constructor() {}<Esc>a
iab <buffer> mtd method(): void {}<Esc>a

" Import statement
iab <buffer> import import { Whatever} from 'CHANGEME';<Esc>
