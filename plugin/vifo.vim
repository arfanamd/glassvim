vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Plugin (Visual Highlight Position).
#--------------------------------------------------------------------
#
# TODO:
# * make the visual mark only applied to the buffer
#
# BUGS:
# * Visual mark dissappear if multiple file was opened on the
# same window (buffer was hidden)

if exists("g:vifo_loaded")
	finish
else
	g:vifo_loaded = true
endif

# Highlight for position.
highlight vifo_mark cterm=bold ctermbg=brown ctermfg=white

# Container for "match" unique id.
g:vifo_saved = []

def JumpBack(lin: number, col: number)
	cursor(lin, col)
enddef

def VisualFocus(wid: number)
	const vifo_beg_y: number = getpos("'<")[1] 
	const vifo_end_y: number = getpos("'>")[1] 
	const vifo_beg_x: number = getpos("'<")[2]
	const vifo_end_x: number = getpos("'>")[2]
	const vifo_max_x: number = 2147483647
	const vifo_bwmid: number = wid + bufnr() + vifo_end_x + vifo_end_y
	var   vifo_len_x: number = 0
	var vifo_poslist: list<list<number>> = []
	var vifo_is_used: bool   = false
	
	# visual mode has been used
	if vifo_beg_y != 0
		vifo_len_x = (vifo_end_x - vifo_beg_x) + 1
		
		# if it's one-line
		if vifo_beg_y == vifo_end_y
			extend(vifo_poslist, [[ vifo_end_y, vifo_beg_x, vifo_len_x ]])
			
		# if it's multi-line
		else
			
			# if it's visual line
			if vifo_end_x == vifo_max_x
				for i in range(vifo_beg_y, vifo_end_y)
					extend(vifo_poslist, [[ i, 1, vifo_max_x ]])
				endfor
				
			# if it's visual block
			else
				for i in range(vifo_beg_y, vifo_end_y)
					extend(vifo_poslist, [[ i, vifo_beg_x, vifo_len_x ]])
				endfor
			endif
		endif
	endif
	
	# Each match id is unique, as it is generated from the window,
	# buffer, line, and column information. We loop through the saved
	# id to verify whether the requested matching point is already
	# in use.
	for mid in g:vifo_saved
		if mid == vifo_bwmid
			vifo_is_used = true
			break
		endif
	endfor
	
	# This is a switch.
	if vifo_is_used
		matchdelete(vifo_bwmid)
		remove(g:vifo_saved, index(g:vifo_saved, vifo_bwmid))
	else
		extend(g:vifo_saved,
			[matchaddpos("vifo_mark", vifo_poslist, 0, vifo_bwmid)])
	endif
	
	JumpBack(vifo_beg_y, vifo_beg_x)
enddef

vnoremap <silent> m :call <SID>VisualFocus(win_getid(tabpagenr()))<cr>

# vim:ft=vim:sw=2:ts=2:noai:noci:si
