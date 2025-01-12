" DiffOrig by tpruvot@github
" Convenient command to see the difference between the current
" buffer and the file it was loaded from, thus the changes you
" made. Only define it when not defined already.

if !exists(":DiffOrig")
	command DiffOrig windo new | set buftype=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif
