let g:jedi#popup_on_dot=0
let g:jedi#goto_assignments_command=''
" disable call signatures, because they are implemented via horrible hacks
" that break undo history: https://github.com/davidhalter/jedi-vim/issues/313
let g:jedi#show_call_signatures=0

" Close the documentation buffer instead of hiding it. When hidden, the now
" empty buffer still needlesly takes up space in the buffer list.
augroup JediCloseDocumentation
	autocmd!
	autocmd BufEnter __doc__ setlocal bufhidden=delete
augroup end

let g:jedi#max_doc_height=15
