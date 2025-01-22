vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Plugin (Visual Highlight Position).
#--------------------------------------------------------------------
# XXX:
# matchaddpos({group}, {pos} [, {priority} [, {id} [, {dict}]]])
# getmatches([{win}])
# matchdelete({id} [, {win})
# clearmatches([{win}])
# win_getid([{win} [, {tab}]])
#
# TODO:
# * make "vnoremap" handle its own range.
# * cleanup code.
# * implement clear visual pos.
# * 

if exists("g:vifo_loaded")
	finish
else
	g:vifo_loaded = true
endif

# Variable to store visual data coordinates.
g:vifo_poslist = []

# Highlight for position.
highlight vifo_mark cterm=bold ctermbg=brown ctermfg=white

#def g:VisualPosition()
def g:VisualFocus(wid: number)
	const vifo_beg_y: number = getpos("'<")[1] 
	const vifo_end_y: number = getpos("'>")[1] 
	const vifo_beg_x: number = getpos("'<")[2]
	const vifo_end_x: number = getpos("'>")[2]
	const vifo_max_x: number = 2147483647
	var vifo_len_x: number = 0
	#var vifo_poslist: list<list<number>> = []
	
	# visual mode has been used
	if vifo_beg_y != 0
		#vifo_len_x = (vifo_end_x - vifo_beg_x)
		vifo_len_x = (vifo_end_x - vifo_beg_x) + 1
		
		# if it's one-line
		if vifo_beg_y == vifo_end_y
			extend(g:vifo_poslist, [[ vifo_end_y, vifo_beg_x, vifo_len_x ]])
			#extend(vifo_poslist, [[ vifo_end_y, vifo_beg_x, vifo_len_x ]])
			
		# if it's multi-line
		else
			
			# if it's visual line
			if vifo_end_x == vifo_max_x
				for i in range(vifo_beg_y, vifo_end_y)
					extend(g:vifo_poslist, [[ i, 1, vifo_max_x ]])
					#extend(vifo_poslist, [[ i, 1, vifo_max_x ]])
				endfor
				
			# if it's visual block
			else
				for i in range(vifo_beg_y, vifo_end_y)
					extend(g:vifo_poslist, [[ i, vifo_beg_x, vifo_len_x ]])
					#extend(vifo_poslist, [[ i, vifo_beg_x, vifo_len_x ]])
				endfor
			endif
		endif
	endif
	
	matchaddpos("vifo_mark", g:vifo_poslist)
enddef
vnoremap m :call VisualFocus(win_getid())<cr>

# vim:ft=vim:sw=2:ts=2:noai:noci:si
