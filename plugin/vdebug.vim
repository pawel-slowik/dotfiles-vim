if !exists("g:vdebug_options")
	let g:vdebug_options = {}
endif

" map file paths from remote to local when debugging on a remote host
let g:vdebug_options.path_maps = {}
" /var/www/html is the default for FPM variants of the PHP Docker image
let g:vdebug_options.path_maps["/var/www/html"] = getcwd()

" run until a breakpoint after connecting
let g:vdebug_options.break_on_open = 0

" change some default mappings because of conflicts with my own mappings
if !exists("g:vdebug_keymap")
	let g:vdebug_keymap = {}
endif
" conflicts with my :emenu mapping
let g:vdebug_keymap.set_breakpoint = "<F8>"
" conflicts with my mapping for executing a selection
let g:vdebug_keymap.eval_visual = "<Leader>de"
