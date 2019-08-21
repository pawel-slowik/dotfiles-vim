let g:ctrlp_switch_buffer='ETVH'
let g:ctrlp_open_multiple_files='ir'
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_current_file = 0

nnoremap <C-U> :CtrlPMRUFiles<CR>
