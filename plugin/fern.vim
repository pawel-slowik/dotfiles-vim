" default width of the drawer window
let g:fern#drawer_width = 42

" autocmd required for setting mappings
augroup fern-custom
	autocmd! *
	autocmd FileType fern call s:init_fern()
augroup END

function! s:init_fern() abort
	" toggle expand / collapse on a node, open on a leaf
	nmap <buffer><expr>
		\ <Plug>(fern-my-open-or-expand-or-collapse)
		\ fern#smart#leaf(
		\   "<Plug>(fern-action-open)",
		\   "<Plug>(fern-action-expand:stay)",
		\   "<Plug>(fern-action-collapse)",
		\ )
	nmap <buffer><nowait> <CR> <Plug>(fern-my-open-or-expand-or-collapse)
endfunction

" toggle show / hide drawer
nnoremap <A-t> :Fern . -drawer -toggle<CR>

" focus on current file
nnoremap <A-S-t> :Fern . -drawer -reveal=%<CR>

" customize tree appearance
let g:fern#renderer#default#leading = "  "
let g:fern#renderer#default#leaf_symbol = "• "
let g:fern#renderer#default#collapsed_symbol = "▶ "
let g:fern#renderer#default#expanded_symbol = "▼ "
