" disable execution of commands from edited file
set modelines=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep a backup file
set backup

" edit multiple buffers without saving
set hidden

" reload file when modified outside of vim
set autoread

" wrap lines longer than the width of the window, indent the wrapped
" continuation the same as the beginning of the wrapped line and display a
" symbol before the continuation
set wrap
set breakindent
set breakindentopt=sbr
set showbreak=«

" enable syntax highlighting
syntax on

" copy indent from previous line when starting a new line
set autoindent

" indent with tabs and display tabs as 8 characters wide (filetype plugins
" will override this)
set tabstop=8
set shiftwidth=8
set noexpandtab

" enable filetype specific plugins and indentation rules
filetype plugin indent on

" always show a status line
set laststatus=2

" show command being entered and visual selection size
set showcmd

" enhanced command-line completion
set wildmenu

" do not redraw while executing plugin functions
set lazyredraw

" immediately timeout on key codes - <Esc> ends insert mode instantaneously
set ttimeout ttimeoutlen=0

" disable mouse
set mouse=

" set terminal window icon and title text
set icon
set title
" make the title similar to the default, but:
" - remove status indicators, as they are distracting,
" - put `VIM` in front instead of at the end, so that it's visible in
"   shortened tmux titles
set titlestring=VIM\ -\ %t%(\ (%{expand(\"%:~:h\")})%)

" don't put anything into the X clipboard;
" pasting from X still works with * and + registers
set clipboard=""

" fill vertical bars with spaces
set fillchars+=vert:\ 

" ignore not editable files
set wildignore+=*.z,*.png,*.jpg,*.gif,*.min.js,*.min.css,*.pyc,__pycache__/,*~

" configure searching in files
set grepprg=grep\ --recursive\ --line-number
" necessary when searching in a single file
set grepprg+=\ --with-filename
" exclude binary files
set grepprg+=\ --binary-files=without-match
" exclude VCS directories
set grepprg+=\ --exclude-dir=.git\ --exclude-dir=.svn
" exclude utility / editor files
set grepprg+=\ --exclude=tags\ --exclude='*~'\ --exclude='*.swp'\ --exclude-dir=.mypy_cache
" exclude generated files
set grepprg+=\ --exclude='*.min.js'\ --exclude='*.min.css'

" disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

" disable mappings defined by filetype plugins
let no_plugin_maps=1

" colors
set t_Co=256
set background=dark
colorscheme desert256-stripped

" disable UI / messages translation (use English)
language C

" guess file encoding in this order
set fileencodings=utf-8,latin2,latin1

" enable basic completion based on syntax highlighting, :help ft-syntax-omni
" (filetype plugins will override this)
set omnifunc=syntaxcomplete#Complete

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

" break lines in text files
augroup BreakLines
	autocmd!
	autocmd FileType text setlocal textwidth=78
augroup end

" jump to the last known position in a file
augroup JumpLastKnown
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup end

" use the most accurate syntax syncing method;
" this might be slow for long files, but only when parsing the text for the
" first time or after making changes
augroup SyncSyntax
	autocmd!
	autocmd BufEnter * :syntax sync fromstart
augroup end

" unify paths in quickfix and location lists
" http://vi.stackexchange.com/q/4815
augroup UnifyPaths
	autocmd!
	autocmd BufAdd * execute "cd" fnameescape(getcwd())
augroup end

" the matchit plugin improves the % command
packadd! matchit

" workaround for a bug in xterm? termcap?
" https://github.com/bling/vim-airline/issues/393
if &term ==# 'xterm' || &term ==# 'xterm-256color'
	set t_RV=
endif

" mappings
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <silent> <Leader>pt :read !tmux show-buffer<CR>
nnoremap <silent> <Leader>px "*p
nnoremap <silent> <Leader>Px "*P
nnoremap <silent> <Leader>pX "+p
nnoremap <silent> <Leader>PX "+P
nnoremap <silent> <Leader>xx :put *<CR>
nnoremap <silent> <Leader>xX :put +<CR>
nnoremap <A-p> :wincmd p<CR>
inoremap <A-p> <C-o>:wincmd p<CR>

" plugin mappings
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <C-U> :CtrlPMRUFiles<CR>
nnoremap <Leader>w :Bdelete<CR>
nnoremap <Leader>q :qall<CR>
nnoremap <silent> <A-q> :call ToggleQuickfixList()<CR>
nnoremap <silent> <A-l> :call ToggleLocationList()<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
vnoremap <silent> <Leader>f :call find#FindVisualSelection()<CR>
nnoremap <silent> <Leader>f :call find#FindWord()<CR>
vnoremap <silent> <Leader>e :call execute#ExecuteVisualSelection()<CR>
" for Python, use Jedi instead of tags for jumping to definitions
augroup JediGoTo
	autocmd!
	autocmd FileType python nnoremap <silent> <buffer> <C-]> :call jedi#goto()<CR>
augroup end

" toggle paste mode with Ctrl+Insert
set pastetoggle=[2;5~

" disable Ex mode
nnoremap Q <nop>
