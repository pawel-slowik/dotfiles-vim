if !exists("g:loaded_lsc")
	finish
endif

" The pylint messages start arriving from pyls only after the file has been
" saved in vim. This is probably caused by:
" > pylint doesn't expose an API for operating on in-memory contents, only
" > files.
" https://github.com/palantir/python-language-server/pull/385
" I, however, want to see these messages as soon as possible after loading a
" file. PylintHack takes care of this by sending a fake textDocument/didSave
" notification to pyls.
" The fake notification seems to have no effect when sent immediately after
" loading the file, but it works as expected when sent after a small delay.
let g:pylint_hack_delay = 500

augroup PylintHack
	autocmd!
	autocmd BufReadPost *.py call PylintHack()
augroup end

function! PylintHack() abort
	let l:filetype = getbufvar(str2nr(expand('<abuf>')), '&filetype')
	let l:full_path = expand('<afile>:p')
	let l:Notify = function("PylintHackNotify", [l:filetype, l:full_path])
	call timer_start(g:pylint_hack_delay, l:Notify)
endfunction

function! PylintHackNotify(filetype, full_path, timer_id) abort
	call lsc#file#onWrite(a:full_path, a:filetype)
endfunction
