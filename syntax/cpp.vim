vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Syntax Add-On.
#--------------------------------------------------------------------

if exists("b:current_syntax")
	finish
endif

runtime! $VIMRUNTIME/syntax/c.vim

iabbrev <buffer> inclide include

highlight link cConstant         Identifier
highlight link cRepeat           cStatement
highlight link cSpecialCharacter cNumber

highlight link cppConstant       Identifier
highlight link cppStatement      cStatement
highlight link cppType           cType
highlight link cppStructure      cStructure
