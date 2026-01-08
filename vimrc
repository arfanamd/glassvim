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

# Program to use for the ":grep" command.  When "grepprg" is set to
# "internal" the ":grep" command works like ":vimgrep".
# -H Print the file name for each match.
# -E Interpret PATTERNS as extended regular expressions.
# -r Read all files under each directory, recursively, following
#    symbolic links only if they are on the command line.
# -n Prefix each line of output with the 1-based line number within
#    its input file.
set grepprg=grep\ --exclude-dir=.git\ -HErn\ $*

# This plugin displays a manual page directly in Vim.
runtime ftplugin/man.vim

# Program to use for the "K" command.
# ":help" may be used to access the Vim internal help.
# When the first character is ":", the command is invoked as a Vim
# Ex command with [count] added as an argument if it is not zero.
# When "man", "man -s" or an Ex command is used, Vim will automatically
# translate a count for the "K" command and pass it as the first arg.
# For "man -s" the "-s" is removed when there is no count.
set keywordprg=:tab\ help
#----- }}}
#----- Netrw {{{
# Enable (1) or suppress (0) the banner.
g:netrw_banner      = 0

# Controls maximum quantity of past history.
# 0 to suppress history.
g:netrw_dirhistmax  = 0

# Comma-separated pattern list for hiding files.
# Patterns are regular expressions.
g:netrw_list_hide   = '.\+\.\(jpe\?g\|png\|webp\|svg\|mp[34]\|ogg\|opus\)'

# Enable (1) or disable (0) mouse buttons while browsing.
g:netrw_mousemaps   = 0

# Netrw normally avoids writing swapfiles for browser buffers.
# However, under some systems this apparently is causing nasty
# "ml_get" errors to appear; if you're getting ml_get errors, try
# putting "let g:netrw_use_noswf = 0" in your .vimrc.
g:netrw_use_noswf   = 1

# Change from left splitting to right splitting.
g:netrw_altv        = 1

# Listing style:
# = 0: thin listing (one file per line)
# = 1: long listing (one file per line with time stamp information
#      and file size)
# = 2: wide listing (multiple files in columns)
# = 3: tree style listing
g:netrw_liststyle   = 1

# If this variable exists, then the "gx" map will not be available
# (see netrw-gx)
g:netrw_nogx        = 1

# = 0: keep current directory the same as the browsing directory.
# = 1: keep current directory immune from the browsing directory.
g:netrw_keepdir     = 0

# = "b": actual bytes
# = "h": human-readable uses 1000 base
# = "H": human-readable uses 1024 base
g:netrw_sizestyle   = 'H'

# Specify format string to vim's strftime().
g:netrw_timefmt     = '%a %d %b %y %H:%M'

# Open the file by:
# = 0: re-using the same window
# = 1: horizontally splitting the window first
# = 2: vertically splitting the window first
# = 3: open file in new tab
# = 4: act like "P" (ie. open previous window)
#g:netrw_browse_split = 3

# Specify user's preference for a viewer.
# Here I'm using "open" as an alias for "xdg-open".
#g:netrw_browsex_viewer = 'open'

# If this variable exists and is non-zero, then the <c-tab> map
# supporting shrinking/expanding a Lexplore or netrw window will
# be enabled. (see netrw-c-tab)
#g:netrw_usetab = 1
#----- }}}
#----- Man {{{
# Disable all Man local mapping.
g:no_man_maps = 1

# Open Man page on new tab.
g:ft_man_open_mode = 'tab'

# Make Man {number} {name} to behave like man {number} {name} by
# not running man {name} if no page is found.
g:ft_man_no_sect_fallback = 1
# }}}
#----- Keymaps {{{
nnoremap tn :tabnew<cr>
nnoremap ,J o<esc>k
nnoremap ,K O<esc>j
nnoremap ,r :edit<cr>
nnoremap ,l :tabnext<cr>
nnoremap ,h :tabprevious<cr>
nnoremap ,j :wincmd j<cr>
nnoremap ,k :wincmd k<cr>
nnoremap <c-o> :Rexplore<cr>
nnoremap ,w :up<cr>
nnoremap ,b :ls<cr>:buff<space>
nnoremap ,q :confirm q<cr>
nnoremap ,Q :confirm qa<cr>
nnoremap ,z :tab split<cr>
nnoremap <silent> <f2> mp:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><cr>'pzz
nnoremap ,m <plug>ManPreGetPage
#----- }}}

# vim:ft=vim:ts=4:sw=4
