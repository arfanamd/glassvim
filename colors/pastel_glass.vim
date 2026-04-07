vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Theme.
#--------------------------------------------------------------------

# TODO:

if v:version > 580
	highlight clear
	if exists("syntax_on")
		syntax reset
	endif
endif

# Only works with terminal that support 256-color
if &t_Co != '256'
	finish
endif

g:colors_name = "pastel_glass"

set background=dark

def ClearHLGroup(hl_group: string): number
	return hlset([{ 'name': hl_group, 'cleared': true }])
enddef

def LinkHLGroup(hl_group_s: string, hl_group_t: string): number
	return hlset([{ 'name': hl_group_s, 'linksto': hl_group_t }])
enddef

def SetHLGroup(hl_group: string, bg: string, fg: string, ct: dict<number>): number
	return hlset([{
		'name': hl_group,
		'ctermbg': empty(bg) == 0 ? bg : '',
		'ctermfg': empty(fg) == 0 ? fg : '',
		'cterm': ct,
	}])
enddef

# Clear the highlight groups that we are going to use
ClearHLGroup('ColorColumn')
ClearHLGroup('Comment')
ClearHLGroup('Constant')
ClearHLGroup('CurSearch')
ClearHLGroup('CursorLine')
ClearHLGroup('CursorLineNr')
ClearHLGroup('DiffAdd')
ClearHLGroup('DiffChange')
ClearHLGroup('DiffDelete')
ClearHLGroup('DiffText')
ClearHLGroup('Directory')
ClearHLGroup('ErrorMsg')
ClearHLGroup('Folded')
ClearHLGroup('Function')
ClearHLGroup('Identifier')
ClearHLGroup('IncSearch')
ClearHLGroup('Keyword')
ClearHLGroup('LineNr')
ClearHLGroup('MatchParen')
ClearHLGroup('ModeMsg')
ClearHLGroup('MoreMsg')
ClearHLGroup('NonText')
ClearHLGroup('Number')
ClearHLGroup('PMenuSel')
ClearHLGroup('Pmenu')
ClearHLGroup('PreProc')
ClearHLGroup('Question')
ClearHLGroup('Search')
ClearHLGroup('Special')
ClearHLGroup('SpecialKey')
ClearHLGroup('Statement')
ClearHLGroup('StatusLine')
ClearHLGroup('StatusLineNC')
ClearHLGroup('String')
ClearHLGroup('TabLine')
ClearHLGroup('TabLineFill')
ClearHLGroup('TabLineSel')
ClearHLGroup('Todo')
ClearHLGroup('Type')
ClearHLGroup('VertSplit')
ClearHLGroup('VertSplit')
ClearHLGroup('Visual')
ClearHLGroup('WarningMsg')
ClearHLGroup('WildMenu')

# UI colors
SetHLGroup('ColorColumn', '001', '', {'none': 1})
SetHLGroup('CursorLine', '000', '', {'none': 1})
SetHLGroup('CursorLineNr', '008', '015', {'bold': 1})
SetHLGroup('Directory', '', '004', {'none': 1})
SetHLGroup('ErrorMsg', '001', '015', {'none': 1})
SetHLGroup('Folded', '008', '', {'none': 1})
SetHLGroup('IncSearch', '015', '000', {'none': 1})
SetHLGroup('LineNr', '', '250', {'none': 1})
SetHLGroup('MatchParen', '', '205', {'bold': 1})
SetHLGroup('ModeMsg', '', '015', {'none': 1})
SetHLGroup('MoreMsg', '', '002', {'none': 1})
SetHLGroup('NonText', '', '250', {'none': 1})
SetHLGroup('PMenuSel', '004', '015', {'bold': 1})
SetHLGroup('Pmenu', '012', '000', {'none': 1})
SetHLGroup('Question', '', '007', {'none': 1})
SetHLGroup('Search', '003', '237', {'none': 1})
SetHLGroup('SpecialKey', '', '250', {'none': 1})
SetHLGroup('StatusLine', '', '015', {'underline': 1})
SetHLGroup('StatusLineNC', '', '007', {'underline': 1})
SetHLGroup('TabLine', '', '015', {'none': 1})
# SetHLGroup('TabLineFill', '', '', {'none': 1})
SetHLGroup('TabLineSel', '', '078', {'none': 1})
SetHLGroup('VertSplit', '', '007', {'none': 1})
SetHLGroup('Visual', '', '', {'reverse': 1})
SetHLGroup('WarningMsg', '', '003', {'none': 1})
SetHLGroup('WildMenu', '', '015', {'bold': 1})

# Syntax colors
SetHLGroup('Comment', '', '103', {'none': 1})
SetHLGroup('Constant', '', '080', {'none': 1})
SetHLGroup('Function', '', '074', {'none': 1})
SetHLGroup('Identifier', '', '174', {'none': 1})
# SetHLGroup('Keyword', '', '', {'none': 1})
SetHLGroup('Number', '', '189', {'none': 1})
SetHLGroup('PreProc', '', '074', {'none': 1})
SetHLGroup('Special', '', '223', {'none': 1})
SetHLGroup('String', '', '189', {'none': 1})
SetHLGroup('Todo', '', '223', {'underline': 1})
SetHLGroup('Type', '', '158', {'none': 1})

# Diff colors
SetHLGroup('DiffAdd', '', '113', {'none': 1})
SetHLGroup('DiffChange', '', '103', {'none': 1})
# SetHLGroup('DiffDelete', '', '', {'none': 1})
SetHLGroup('DiffText', '', '210', {'none': 1})

# Reuse color
LinkHLGroup('VertSplit', 'Normal')
LinkHLGroup('CurSearch', 'Search')
LinkHLGroup('Statement', 'Special')

# vim:ft=vim:ts=4:sw=4
