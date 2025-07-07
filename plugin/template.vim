vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Template code & Template compiler.
#--------------------------------------------------------------------

#----- Code {{{
augroup Template
	autocmd BufNewFile \w*.cpp
		| :0read ~/.vim/template/cpp.template
		| norm! Gdd4k$
	autocmd BufNewFile \w*.sh
		| :0read ~/.vim/template/bash.template
		| norm! Gdd2k$
	autocmd BufNewFile \w*.rs
		| :0read ~/.vim/template/rust.template
		| norm! Gdd3k$
	autocmd BufNewFile \w*.c
		| :0read ~/.vim/template/c.template
		| norm! Gdd4k$
	autocmd BufNewFile Cargo.toml
		| :0read ~/.vim/template/cargo_toml.template
augroup END
#----- }}}
#----- Compiler {{{
augroup Compiler
	autocmd FileType cpp
		| :vim9cmd &makeprg = "cc -Werror -Wextra -Wconversion -Wshadow -Wpedantic -std=c++17"
		| :vim9cmd &errorformat = "%A%f:%l:%c: %t%.%#:%m,%C%.%#"
	autocmd FileType rust
		| :vim9cmd &makeprg = "rustc -C prefer-dynamic"
	autocmd FileType c
		| :vim9cmd &makeprg = "cc -Werror -Wextra -Wconversion -Wshadow -Wpedantic -std=c17"
		| :vim9cmd &errorformat = "%A%f:%l:%c: %t%.%#:%m,%C%.%#"
augroup END
#----- }}}

# vim:ft=vim:ts=4:sw=4
