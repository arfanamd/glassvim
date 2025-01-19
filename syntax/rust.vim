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

runtime! $VIMRUNTIME/syntax/rust.vim

# Rust abbreviations
iabbrev <buffer> _unused #![allow(unused)]
iabbrev <buffer> _deadco #![allow(dead_code)]

# Rust custom highlight
highlight clear rustStructure
highlight clear rustType
highlight clear rustSigil

highlight rustStructure ctermfg=049  ctermbg=none cterm=none
highlight rustType      ctermfg=121  ctermbg=none cterm=none
highlight rustSigil                               cterm=italic,bold

highlight link rustModPathSep Delimiter
highlight link rustSelf       rustSigil
highlight link rustUnion      rustStructure
highlight link rustMacro      Function

# Rust errorformat
setlocal errorformat=
		\%-G,
		\%-Gerror:\ aborting\ %.%#,
		\%-Gerror:\ Could\ not\ compile\ %.%#,
		\%Eerror:\ %m,
		\%Eerror[E%n]:\ %m,
		\%Wwarning:\ %m,
		\%Inote:\ %m,
		\%C\ %#-->\ %f:%l:%c,
		\%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z,
		\%-G%\\s%#Downloading%.%#,
		\%-G%\\s%#Checking%.%#,
		\%-G%\\s%#Compiling%.%#,
		\%-G%\\s%#Finished%.%#,
		\%-G%\\s%#error:\ Could\ not\ compile\ %.%#,
		\%-G%\\s%#To\ learn\ more\\,%.%#,
		\%-G%\\s%#For\ more\ information\ about\ this\ error\\,%.%#,
		\%-Gnote:\ Run\ with\ \`RUST_BACKTRACE=%.%#,
		\%.%#panicked\ at\ \\'%m\\'\\,\ %f:%l:%c

