let g:lsc_auto_map = {}
let g:lsc_server_commands = {}

" for now, I prefer to do refactorings either manually or with standalone CLI
" tools instead of LSP edits
let g:lsc_enable_apply_edit = v:false

" manual completion triggering
let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_map["Completion"] = "omnifunc"

" reference highlighting is distracting
let g:lsc_reference_highlights = v:false

" set up default key bindings
let g:lsc_auto_map["defaults"] = v:true

" disable the PreviousReference binding because it conflicts with ctrlp.vim
let g:lsc_auto_map["PreviousReference"] = ""

" use the PHP LSP server via TCP instead of stdin/stdout; this allows setups
" like running the server in a docker container or in a VM
if $PHP_LSP_SERVER !=# ""
	" server versions older than 5.4.4 (2018-11-11) don't support rootUri,
	" only rootPath
	let s:hooks = {"initialize": {"rootPath": {method, params -> getcwd()}}}
	let g:lsc_server_commands["php"] = {"command": $PHP_LSP_SERVER, "message_hooks": s:hooks}
endif

" pyls spams stderr with messages about missing optional dependencies
let g:lsc_server_commands["python"] = {"command": "pyls", "suppress_stderr": v:true}

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
