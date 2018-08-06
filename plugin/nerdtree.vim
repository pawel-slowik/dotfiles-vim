let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
let NERDTreeDirArrowExpandable='▶'
let NERDTreeDirArrowCollapsible='▼'
" make the status line path relative to $HOME
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(),':~'):''}"
