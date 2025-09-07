vim9script

# Console default variables.

# Control the spawn of the terminal window.
# -----------------------------------------------------------------
# Valid values are:
#   - "top"      open the terminal window in split on the top.
#   - "below"    open the terminal window in split on the bottom.
#   - "right"    open the terminal window in split on the right.
#   - "left"     open the terminal window in split on the left.
#   - "tab"      open the terminal window on a new tab.
g:console_open_position = "below"
g:console_run_position  = "tab" 

# Adjust the height of the terminal window. This option is ignored
# for the "g:console_open_position" or "g:console_run_position" if
# it's value is set to "tab".
# -----------------------------------------------------------------
# Valid value are: [15-80].
g:console_height = 20

def Console_control_height(): number
	if g:console_height < 15
		return 15
	elseif g:console_height > 80
		return 80
	else
		return g:console_height
	endif
enddef

# Open terminal window with the default shell.
# This function returns the buffer number of the terminal.
def g:Console_open(): number
	var term_opts: dict<any> = {
		'term_name': ' Console ',
		'term_rows': winheight(0) * Console_control_height() / 100,
		'term_kill': 'kill',
		'term_finish': 'close',
		'norestore': 1,
	}
	
	if g:console_open_position == 'left'
		vertical topleft return term_start(&shell, term_opts)
	elseif g:console_open_position == 'right'
		vertical botright return term_start(&shell, term_opts)
	elseif g:console_open_position == 'below'
		horizontal botright return term_start(&shell, term_opts)
	elseif g:console_open_position == 'top'
		horizontal topleft return term_start(&shell, term_opts)
	else
		remove(term_opts, 'term_rows')
		tab return term_start(&shell, term_opts)
	endif
enddef

# Run commands in a terminal window. The window will not closed
# automatically after the command executions is finished.
# This function returns the buffer number of the terminal.
def g:Console_run(): number
	var cmds: string = input('run: ', '', 'shellcmd')
	
	if cmds != ""
		var term_cmds: list<string> = [
			&shell,
			&shellcmdflag,
			cmds,
		]
		var term_opts: dict<any> = {
			'term_name': ' Run ',
			'term_rows': winheight(0) * Console_control_height() / 100,
			'term_kill': 'int',
			'term_finish': 'open',
			'norestore': 1,
		}
		
		if g:console_run_position == 'left'
			vertical topleft return term_start(term_cmds, term_opts)
		elseif g:console_run_position == 'right'
			vertical botright return term_start(term_cmds, term_opts)
		elseif g:console_run_position == 'below'
			horizontal botright return term_start(term_cmds, term_opts)
		elseif g:console_run_position == 'top'
			horizontal topleft return term_start(term_cmds, term_opts)
		else
			remove(term_opts, 'term_rows')
			tab return term_start(term_cmds, term_opts)
		endif
	else
		echow "Nothing is executed!"
		return 0
	endif
enddef

# vim:ft=vim:sw=2:ts=2
