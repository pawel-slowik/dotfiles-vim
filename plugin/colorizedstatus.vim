set statusline=%<
set statusline+=%#StatusLineGit#%(%{colorizedstatus#GitInfo()}\ %)%*
set statusline+=%#StatusLinePath#%(\ %{colorizedstatus#PathInfo()}\ %)%*
set statusline+=%#StatusLineCurrentFunction#%(\ %{colorizedstatus#FunctionInfo()}\ %)%*
set statusline+=%=%h%m%r
set statusline+=%#StatusLinePaste#%(\ %{colorizedstatus#PasteInfo()}\ %)%*
set statusline+=%#StatusLineErrorCount#%(\ %{colorizedstatus#ErrorInfo()}\ %)%*
set statusline+=%#StatusLineWarningCount#%(\ %{colorizedstatus#WarningInfo()}\ %)%*
set statusline+=\ %-9.(%5.l,%3.v%)\ %P
