" Revert unnecessary /usr/share/vim/vimfiles/archlinux.vim customizations.
"
" Arch Linux sets the undodir, directory and backupdir options as a mitigation
" measure for CVE-2017-1000382. However, the scenarios where the flaw could be
" exploited are unrealistic for my usage cases. On the other hand, the kind of
" setup that results from the modified options makes it impossible to easily
" remove an entire project by simply removing it's top directory, because some
" files will be left behind in the user's home directory. This is important
" e.g. when you are legally obligated to remove any such data after finishing
" a contract.
"
" Resetting undodir is not necessary because undofile is not set.

if !filereadable("/usr/share/vim/vimfiles/archlinux.vim")
	finish
endif

" reset to default
set directory=.

" `backup` is not set, but `writebackup` is, therefore reverting `backupdir`
" to a sane default is still necessary;
set backupdir=.
