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
	let g:lsc_server_commands["php"] = {"command": $PHP_LSP_SERVER}
endif

let g:lsc_server_commands["python"] = {"command": "pylsp"}
