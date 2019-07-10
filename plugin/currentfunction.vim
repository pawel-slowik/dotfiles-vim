let g:current_function_ctags_path='ctags-universal'
let g:current_function_ctags_args='--fields=+es'
" disable some tag kinds because having too many is confusing
let g:current_function_ctags_args.=' --kinds-vim=-v'
let g:current_function_ctags_args.=' --kinds-c=-vmte'
let g:current_function_ctags_args.=' --kinds-python=-vI'
let g:current_function_ctags_args.=' --kinds-php=-va'
