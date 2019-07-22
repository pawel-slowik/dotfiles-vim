" This is a hack that improves status line integration for the vim-lsc plugin.
" This file is autoloaded instead of a corresponding file in the plugin.

" load the original vim-lsc function definitions
runtime PACK autoload/lsc/highlights.vim

" save a reference to the original function
let s:OriginalLscHighlightsUpdate = funcref("lsc#highlights#update")

" redefine customized function
function! lsc#highlights#update() abort
	call s:OriginalLscHighlightsUpdate()
	redrawstatus
endfunction
