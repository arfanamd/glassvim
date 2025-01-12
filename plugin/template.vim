vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Template code & Template compiler.
#--------------------------------------------------------------------

#----- Code {{{
augroup Template
	autocmd BufNewFile \w*.cpp :0read ~/.vim/template/cpp.template
	autocmd BufNewFile \w*.sh :0read ~/.vim/template/bash.template
	autocmd BufNewFile \w*.rs :0read ~/.vim/template/rust.template
	autocmd BufNewFile \w*.c :0read ~/.vim/template/c.template
	autocmd BufNewFile Cargo.toml :0read ~/.vim/template/cargo_toml.template
augroup END
#----- }}}
#----- Compiler {{{
augroup Compiler
	autocmd BufEnter \w*.cpp :vim9cmd &makeprg = "cc -Werror -Wextra -Wconversion -Wshadow -Wpedantic -std=c++17"
	autocmd BufEnter \w*.rs :vim9cmd &makeprg = "rustc -C prefer-dynamic"
	autocmd BufEnter \w*.c :vim9cmd &makeprg = "cc -Werror -Wextra -Wconversion -Wshadow -Wpedantic -std=c17"
augroup END
#----- }}}

# vim:ft=vim:ts=4:sw=4
