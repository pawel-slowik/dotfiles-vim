" only lint on load / save
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1

" use quickfix instead of location list for lint messages
" (because I'm using the location list for lgrep)
let g:ale_set_loclist=0
let g:ale_set_quickfix=1

" disable signs, because the gutter column is annoying with it's show / hide
" behaviour and ugly when always visible
let g:ale_set_signs=0
