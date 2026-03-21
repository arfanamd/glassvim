vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Plugin (Console).
#--------------------------------------------------------------------

if exists("g:console_loaded") || !has('terminal')
	finish
endif

g:console_loaded = true

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
# if "g:console_open_position" or "g:console_run_position" value
# is set to "tab".
# -----------------------------------------------------------------
# Valid value are: [15-80] in percentage. Default are 20%.
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

# Open the default shell on the terminal window.
# This function returns the terminal buffer number.
def g:Console_open(): number
	# Options to create new terminal buffer. See "term_start()".
	var term_opts: dict<any> = {
		'term_name': '',
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

# Run commands in a terminal window.
# The window will not closed automatically after the execution
# is finished. This function returns the terminal buffer number.
def g:Console_run(): number
	# BUG: "shellcmdline" completion doesn't work in vim < v9.1.1226.
	var cmds: string = input('run: ', '', 'shellcmdline')
	
	if cmds != ""
		var term_cmds: list<string> = [
			&shell,
			&shellcmdflag,
			cmds,
		]
		# Options to create new terminal buffer. See "term_start()".
		var term_opts: dict<any> = {
			'term_name': '',
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

# Properties for statusline
highlight ConsoleStatusline    ctermbg=none ctermfg=015 cterm=underline
highlight ConsoleStatuslineNC  ctermbg=none ctermfg=007 cterm=underline

def g:Console_statusline()
	var console_bufnr: number   = bufnr()
	var console_info: dict<any> = job_info(term_getjob(console_bufnr))
	
	var console_barline: string = "%#Normal#%#ConsoleStatusline# "
	console_barline ..= console_info['tty_out'] .. "%="
	console_barline ..= "  PID: " .. console_info['process']
	console_barline ..= " (" .. console_info['status'] .. ")"
	
	setbufvar(console_bufnr, "&statusline", console_barline)
enddef

augroup Console
	autocmd!
	autocmd TerminalOpen * setbufvar("", "&filetype", "tr")
	autocmd FileType tr call g:Console_statusline() | setlocal readonly
augroup END

# vim:ft=vim:sw=2:ts=2
