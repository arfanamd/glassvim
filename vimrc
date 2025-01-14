vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Configuration (vimrc).
#--------------------------------------------------------------------

#----- Config {{{
# This option has the effect of making Vim behave in a more useful way.
set nocompatible

# Lights out! Asthenopia.
set background=dark

# Show the line number relative to the line with the cursor in front of
# each line.
set relativenumber

# Minimal number of columns to use for the line number.
# Only relevant when the 'number' or 'relativenumber' option is set.
set numberwidth=4

# While typing a search command, highlight where the pattern, as it was
# typed so far, matches.
set incsearch

# Saving you more bytes by using a single tab (1 byte) instead of four 
# spaces (4 bytes) for indentation.
set noexpandtab

# Lines will not wrap and only part of long lines will be displayed.
# When the cursor is moved to a part that is not shown, the screen will
# scroll horizontally.
set nowrap

# The minimal number of screen columns to keep to the left and to the
# right of the cursor if 'nowrap' is set.  Setting this option to a
set sidescrolloff=3

# Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

# command-line completion operates in an enhanced mode. On pressing
# 'wildchar', the possible matches are shown.
set wildmenu

# Completion mode that is used for the character specified with
# 'wildchar'.
# "full"    Complete the next full match.  After the last match, the
#           original string is used and then the first match again.
# "longest"	Complete till longest common string.  If this doesn't
#           result in a longer string, use the next part.
# "list"    When more than one match, list all matches.
set wildmode=longest,list,full

# A file that matches with one of these patterns is ignored when
# expanding 'wildcards'.
set wildignore=*.o,*.so,*.jpg,*.png,*.mp3,*.mp4

# Show (partial) command in the last line of the screen.  In Visual
# mode the size of the selected area is shown.
set showcmd

# When a bracket is inserted, briefly jump to the matching one.
set showmatch

# Do not show the line and column number of the cursor position.
set noruler

# The screen looks nicer with a status line if you have several windows
# , but it takes another screen line.
set laststatus=2

# Number of spaces that a <Tab> in the file counts for.
set tabstop=4

# Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

# Useful to see the difference between tabs and spaces and for trailing
# blanks.
set list

# Strings to use in "list" mode and for the ":list" command.
set listchars=tab:\¦\ ,nbsp:+

# Characters to fill vertical separators.
set fillchars=vert:\╎

# The kind of folding used for the current window.  "fold-marker"
# Markers are used to specify folds.
set foldmethod=marker

# Minimal initial height of the help window when it is opened with the 
# ":help" command.
set helpheight=30

# List of directory names for the swap file, separated with commas.
set directory=~/.vim/swap/

# This is a list of directories which will be searched when using the
# "gf", [f, ]f, ^Wf, ":find", ":sfind", ":tabfind" and other commands,
set path=.,,

#----- }}}
#----- Netrw {{{
g:netrw_banner      = 0
g:netrw_dirhistmax  = 0
g:netrw_list_hide   = '.*\.png,.*\.jp?g,.*\.svg,.*\.mp[34]'
g:netrw_mousemaps   = 0
g:netrw_use_noswf   = 1
#----- }}}
#----- Keymaps {{{
nnoremap tn :tabnew<cr>
nnoremap ,J o<esc>k
nnoremap ,K O<esc>j
nnoremap ,r :edit<cr>
nnoremap ,l :tabnext<cr>
nnoremap ,h :tabprevious<cr>
nnoremap ,j :wincmd j<cr>
nnoremap ,k :wincmd k<cr>
nnoremap ,o :35%Lexplore<cr>
nnoremap ,w :up<cr>
nnoremap ,b :ls<cr>:buff<space>
nnoremap ,q :confirm q<cr>
nnoremap ,Q :confirm qa<cr>
nnoremap <silent> <f2> mp:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><cr>'pzz
#----- }}}

# vim:ft=vim:ts=4:sw=4
