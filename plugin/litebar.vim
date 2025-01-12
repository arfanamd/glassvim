vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Plugin (LiteBar).
#--------------------------------------------------------------------
# TODO:
#   - Add support for netrw statusline
#   - Integrate Litepicker() with "buftype"

# Only load litebar once
if exists("g:litebar_loaded")
	finish
else
	g:litebar_loaded = true
endif

# Statusline highlight profile for Litebuf
highlight clear StatusLine
highlight clear StatusLineNC
highlight StatusLine    ctermbg=none ctermfg=015 cterm=underline
highlight StatusLineNC  ctermbg=none ctermfg=007 cterm=underline

# These functions need information about the window state, whether
# is active or not, so the appropriate highlight profile color can
# be set.

def g:Litebuf(active: bool): string
	var barline: string

	barline ..= "%#Normal#"
	barline ..= active ? "%#StatusLine#" : "%#StatusLineNC#"
	barline ..= " %<%f"
	barline ..= "%{&modified ? '+ ' : ' '}"
	barline ..= "%r%h%="
	barline ..= "[%{&filetype}] "
	barline ..= " %L:%P "
	barline ..= " %l:%v "
	barline ..= " %{&ff} %#Normal#"

	return barline
enddef

def g:Helppagebuf(active: bool): string
	var barline: string

	barline ..= "%#Normal#"
	barline ..= active ? "%#StatusLine#" : "%#StatusLineNC#"
	barline ..= " %<%f  %=[help]  %P  %L"
	barline ..= " %#Normal#"

	return barline
enddef

def g:Litepicker(active: bool, filetype: string, nbuf: number)
	if filetype == "help"
		setbufvar("", "&statusline", "%!Helppagebuf(" .. active .. ")")
	else
		setbufvar(nbuf, "&statusline", "%!Litebuf(" .. active .. ")")
	endif
enddef

augroup Litebar
	autocmd!
	autocmd BufWinEnter,WinEnter \w*.* call Litepicker(1, &filetype, bufnr()) | redrawst!
	autocmd WinLeave \w*.* call Litepicker(0, &filetype, bufnr()) | redrawst!
augroup END

# vim:ft=vim:sw=2:ts=2
