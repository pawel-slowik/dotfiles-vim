let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
let NERDTreeIgnore=['^__pycache__$']
let NERDTreeDirArrowExpandable='▶'
let NERDTreeDirArrowCollapsible='▼'
let NERDTreeWinSize=42
" make the status line path relative to $HOME
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(),':~'):''}"

nnoremap <A-t> :NERDTreeToggle<CR>
