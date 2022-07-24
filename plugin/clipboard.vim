if has('xterm_clipboard')
	nnoremap <silent> <Leader>px "*p
	nnoremap <silent> <Leader>Px "*P
	nnoremap <silent> <Leader>pX "+p
	nnoremap <silent> <Leader>PX "+P
	nnoremap <silent> <Leader>xx :put *<CR>
	nnoremap <silent> <Leader>xX :put +<CR>
	finish
endif

if getenv('DISPLAY') != v:null
	nnoremap <silent> <Leader>px :let @" = system("xclip -o -selection PRIMARY")<CR>p
	nnoremap <silent> <Leader>Px :let @" = system("xclip -o -selection PRIMARY")<CR>P
	nnoremap <silent> <Leader>pX :let @" = system("xclip -o -selection CLIPBOARD")<CR>p
	nnoremap <silent> <Leader>PX :let @" = system("xclip -o -selection CLIPBOARD")<CR>P
	nnoremap <silent> <Leader>xx :read !xclip -o -selection PRIMARY<CR>
	nnoremap <silent> <Leader>xX :read !xclip -o -selection CLIPBOARD<CR>
	finish
endif
