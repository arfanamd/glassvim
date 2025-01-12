vim9script
#--------------------------------------------------------------------
# Author:  arfanamd
# License: Released under the same license as Vim itself.
#
# Personal Vim Theme.
#--------------------------------------------------------------------

# Clear all highlighting groups that we are going to use.
highlight clear ColorColumn 
highlight clear Comment     
highlight clear Constant    
highlight clear CursorLine  
highlight clear CursorLineNr
highlight clear DiffAdd     
highlight clear DiffText    
highlight clear Directory   
highlight clear ErrorMsg    
highlight clear Folded      
highlight clear IncSearch   
highlight clear LineNr      
highlight clear MatchParen  
highlight clear ModeMsg     
highlight clear MoreMsg     
highlight clear NonText     
highlight clear PMenuSel    
highlight clear Pmenu       
highlight clear Question    
highlight clear Search      
highlight clear SpecialKey  
highlight clear Todo        
highlight clear Visual      
highlight clear VertSplit   
highlight clear WarningMsg  
highlight clear WildMenu    
highlight clear VertSplit
highlight clear CurSearch

# The theme.
highlight ColorColumn  ctermbg=001  ctermfg=NONE cterm=NONE
highlight Comment      ctermbg=NONE ctermfg=004  cterm=BOLD
highlight Constant     ctermbg=NONE ctermfg=003  cterm=NONE
highlight CursorLine   ctermbg=000  ctermfg=NONE cterm=NONE
highlight CursorLineNr ctermbg=008  ctermfg=015  cterm=BOLD
highlight DiffAdd      ctermbg=136  ctermfg=NONE cterm=NONE
highlight DiffText     ctermbg=124  ctermfg=NONE cterm=NONE
highlight Directory    ctermbg=NONE ctermfg=004  cterm=NONE
highlight ErrorMsg     ctermbg=001  ctermfg=015  cterm=NONE
highlight Folded       ctermbg=008  ctermfg=NONE cterm=NONE
highlight IncSearch    ctermbg=015  ctermfg=000  cterm=NONE
highlight LineNr       ctermbg=NONE ctermfg=250  cterm=NONE
highlight MatchParen   ctermbg=NONE ctermfg=205  cterm=BOLD
highlight ModeMsg      ctermbg=NONE ctermfg=015  cterm=NONE
highlight MoreMsg      ctermbg=NONE ctermfg=002  cterm=NONE
highlight NonText      ctermbg=NONE ctermfg=250  cterm=NONE
highlight PMenuSel     ctermbg=004  ctermfg=015  cterm=BOLD
highlight Pmenu        ctermbg=012  ctermfg=000  cterm=NONE
highlight Question     ctermbg=NONE ctermfg=007  cterm=NONE
highlight Search       ctermbg=003  ctermfg=237  cterm=NONE
highlight SpecialKey   ctermbg=NONE ctermfg=250  cterm=NONE
highlight Todo                      ctermfg=011  cterm=UNDERLINE
highlight Visual                                 cterm=REVERSE
highlight VertSplit                 ctermfg=007  cterm=NONE
highlight WarningMsg   ctermbg=NONE ctermfg=003  cterm=NONE
highlight WildMenu     ctermbg=008  ctermfg=007  cterm=BOLD

# Reuse color
highlight link VertSplit Normal
highlight link CurSearch Search

# vim:ft=vim:ts=4:sw=4
