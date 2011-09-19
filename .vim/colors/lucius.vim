" Lucius vim color file
" Maintainer: Jonathan Filip <jfilip1024@gmail.com>
" Version: 6.02

hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="lucius"

" Summary:
" Color scheme with dark and light versions (GUI and 256 color terminal).

" Description:
" This color scheme was originally created by combining my favorite parts of
" the following color schemes:
"
" * oceandeep (vimscript #368)
" * peaksea (vimscript #760)
" * wombat (vimscript #1778)
" * moria (vimscript #1464)
" * zenburn (vimscript #415)
"
" Version 6+ has been revamped a bit from the original color scheme. If you
" prefer the old style, or the 'blue' version, use the 5Final release. Version
" 6+ only has a light and dark version. The new version tries to unify some of
" the colors and also adds more contrast between text and interface.
"
" The color scheme is dark, by default. You can change this by setting the
" g:lucius_style variable to "light" or "dark". Once the color scheme is
" loaded, you can use the commands "LuciusLight" or "LuciusDark" to change
" schemes quickly.
"
" Screeshots of the new version (6+):
"
" * Dark: http://i.imgur.com/IzYcB.png
" * Light: http://i.imgur.com/kfJcm.png
"
" Screenshots of the old versions (5Final):
"
" * Dark: http://i.imgur.com/z0bDr.png
" * Light: http://i.imgur.com/BXDiv.png
" * Blue: http://i.imgur.com/Ea1Gq.png 
"
" colorsupport.vim (vimscript #2682) is used to help with mapping the GUI
" settings to the 256 terminal colors.
"
" This color scheme also has custom colors defined for the following plugins:
"
" * vimwiki (vimscript #2226)
" * tagbar (vimscript #3465)
"
" Installation:
" Copy the file to your vim colors directory and then do :colorscheme lucius.

set background=dark
if exists("g:lucius_style")
    if g:lucius_style == "light"
        set background=light
    endif
else
    let g:lucius_style="dark"
endif

" set colorcolumn=21,37,53,68,86,100

if g:lucius_style == "dark"


    hi Normal       guifg=#e8e8e8   guibg=#202020   ctermfg=253    ctermbg=234       gui=none      cterm=none

    hi Comment      guifg=#606060   guibg=NONE      ctermfg=240    ctermbg=NONE      gui=none      cterm=none

    hi Constant     guifg=#b0d090   guibg=NONE      ctermfg=150    ctermbg=NONE      gui=none      cterm=none
    hi BConstant    guifg=#b0d090   guibg=NONE      ctermfg=150    ctermbg=NONE      gui=bold      cterm=bold

    hi Identifier   guifg=#90d0c0   guibg=NONE      ctermfg=115    ctermbg=NONE      gui=none      cterm=none
    hi BIdentifier  guifg=#90d0c0   guibg=NONE      ctermfg=115    ctermbg=NONE      gui=bold      cterm=bold

    hi Statement    guifg=#70c0e0   guibg=NONE      ctermfg=74     ctermbg=NONE      gui=none      cterm=none
    hi BStatement   guifg=#70c0e0   guibg=NONE      ctermfg=74     ctermbg=NONE      gui=bold      cterm=bold

    hi PreProc      guifg=#e0e0b0   guibg=NONE      ctermfg=187    ctermbg=NONE      gui=none      cterm=none
    hi BPreProc     guifg=#e0e0b0   guibg=NONE      ctermfg=187    ctermbg=NONE      gui=bold      cterm=bold

    hi Type         guifg=#90c0d0   guibg=NONE      ctermfg=116    ctermbg=NONE      gui=none      cterm=none
    hi BType        guifg=#90c0d0   guibg=NONE      ctermfg=116    ctermbg=NONE      gui=bold      cterm=bold

    hi Special      guifg=#b0a0c0   guibg=NONE      ctermfg=182    ctermbg=NONE      gui=none      cterm=none
    hi BSpecial     guifg=#b0a0c0   guibg=NONE      ctermfg=182    ctermbg=NONE      gui=bold      cterm=bold

    " == Text Markup ==
    hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=underline cterm=underline
    hi Error        guifg=#e07070   guibg=#402020   ctermfg=167    ctermbg=236       gui=none      cterm=none
    hi Todo         guifg=#e0e090   guibg=#404000   ctermfg=186    ctermbg=NONE      gui=none      cterm=none
    hi MatchParen   guifg=bg        guibg=#d0f080   ctermfg=bg     ctermbg=192       gui=none      cterm=bold
    hi NonText      guifg=#405060   guibg=NONE      ctermfg=24     ctermbg=NONE      gui=none      cterm=none
    hi SpecialKey   guifg=#406050   guibg=NONE      ctermfg=23     ctermbg=NONE      gui=none      cterm=none
    hi Title        guifg=#60c0e0   guibg=NONE      ctermfg=74     ctermbg=NONE      gui=bold      cterm=bold

    " == Text Selection ==
    hi Cursor       guifg=bg        guibg=fg        ctermfg=bg     ctermbg=fg        gui=none      cterm=none
    hi CursorIM     guifg=bg        guibg=fg        ctermfg=bg     ctermbg=fg        gui=none      cterm=none
    hi CursorColumn guifg=NONE      guibg=#404040   ctermfg=NONE   ctermbg=237       gui=none      cterm=none
    hi CursorLine   guifg=NONE      guibg=#404040   ctermfg=NONE   ctermbg=237       gui=none      cterm=none
    hi Visual       guifg=NONE      guibg=#304050   ctermfg=NONE   ctermbg=24        gui=none      cterm=none
    hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=underline cterm=underline
    hi IncSearch    guifg=bg        guibg=#60e0e0   ctermfg=bg     ctermbg=116       gui=none      cterm=none
    hi Search       guifg=bg        guibg=#f0b030   ctermfg=bg     ctermbg=214       gui=none      cterm=none

    " == UI ==
    hi Pmenu        guifg=bg        guibg=#c0c0c0   ctermfg=bg     ctermbg=252       gui=none      cterm=none
    hi PmenuSel     guifg=#e0e0e0   guibg=#304050   ctermfg=fg     ctermbg=24        gui=none      cterm=none
    hi PMenuSbar    guifg=#202020   guibg=#d0d0d0   ctermfg=bg     ctermbg=254       gui=none      cterm=none
    hi PMenuThumb   guifg=NONE      guibg=#808080   ctermfg=fg     ctermbg=244       gui=none      cterm=none
    hi StatusLine   guifg=#202020   guibg=#c0c0c0   ctermfg=bg     ctermbg=252       gui=bold      cterm=bold
    hi StatusLineNC guifg=#404040   guibg=#c0c0c0   ctermfg=240    ctermbg=252       gui=none      cterm=none
    hi TabLine      guifg=#202020   guibg=#e0e0e0   ctermfg=bg     ctermbg=252       gui=none      cterm=none
    hi TabLineFill  guifg=#404040   guibg=#e0e0e0   ctermfg=240    ctermbg=252       gui=none      cterm=none
    hi TabLineSel   guifg=#e0e0e0   guibg=#304050   ctermfg=fg     ctermbg=24        gui=bold      cterm=bold
    hi VertSplit    guifg=#606060   guibg=#c0c0c0   ctermfg=245    ctermbg=252       gui=none      cterm=none
    hi Folded       guifg=#202020   guibg=#808080   ctermfg=bg     ctermbg=246       gui=none      cterm=none
    hi FoldColumn   guifg=#202020   guibg=#808080   ctermfg=bg     ctermbg=246       gui=none      cterm=none

    " == Spelling ==
    hi SpellBad     guisp=#ee0000                   ctermfg=fg     ctermbg=160       gui=undercurl cterm=undercurl
    hi SpellCap     guisp=#eeee00                   ctermfg=bg     ctermbg=226       gui=undercurl cterm=undercurl
    hi SpellRare    guisp=#ffa500                   ctermfg=bg     ctermbg=214       gui=undercurl cterm=undercurl
    hi SpellLocal   guisp=#ffa500                   ctermfg=bg     ctermbg=214       gui=undercurl cterm=undercurl

    " == Diff ==
    hi DiffAdd      guifg=fg        guibg=#304030   ctermfg=fg     ctermbg=22        gui=none      cterm=none
    hi DiffChange   guifg=fg        guibg=#504030   ctermfg=fg     ctermbg=58        gui=none      cterm=none
    hi DiffDelete   guifg=fg        guibg=#403030   ctermfg=fg     ctermbg=52        gui=none      cterm=none
    hi DiffText     guifg=#d0c060   guibg=#504030   ctermfg=220    ctermbg=58        gui=bold      cterm=bold

    " == Misc ==
    hi Directory    guifg=#c0e0b0   guibg=NONE      ctermfg=151    ctermbg=NONE      gui=none      cterm=none
    hi ErrorMsg     guifg=#ee0000   guibg=NONE      ctermfg=196    ctermbg=NONE      gui=none      cterm=none
    hi SignColumn   guifg=#a0b0b0   guibg=#282828   ctermfg=145    ctermbg=233       gui=none      cterm=none
    hi LineNr       guifg=#202020   guibg=#808080   ctermfg=bg     ctermbg=246       gui=none      cterm=none
    hi MoreMsg      guifg=#70d0f0   guibg=NONE      ctermfg=117    ctermbg=NONE      gui=none      cterm=none
    hi ModeMsg      guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=none      cterm=none
    hi Question     guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=none      cterm=none
    hi WarningMsg   guifg=#e87870   guibg=NONE      ctermfg=173    ctermbg=NONE      gui=none      cterm=none
    hi WildMenu     guifg=NONE      guibg=#304050   ctermfg=NONE   ctermbg=24        gui=none      cterm=none
    hi ColorColumn  guifg=NONE      guibg=#403630   ctermfg=NONE   ctermbg=101       gui=none      cterm=none
    hi Ignore       guifg=bg                        ctermfg=bg


elseif g:lucius_style == "light"


    hi Normal       guifg=#000000   guibg=#ffffff   ctermfg=16     ctermbg=231       gui=none      cterm=none

    hi Comment      guifg=#909090   guibg=NONE      ctermfg=246    ctermbg=NONE      gui=none      cterm=none

    hi Constant     guifg=#007000   guibg=NONE      ctermfg=22     ctermbg=NONE      gui=none      cterm=none
    hi BConstant    guifg=#007000   guibg=NONE      ctermfg=22     ctermbg=NONE      gui=none      cterm=bold

    hi Identifier   guifg=#008080   guibg=NONE      ctermfg=30     ctermbg=NONE      gui=none      cterm=none
    hi BIdentifier  guifg=#008080   guibg=NONE      ctermfg=30     ctermbg=NONE      gui=none      cterm=bold

    hi Statement    guifg=#0030b0   guibg=NONE      ctermfg=19     ctermbg=NONE      gui=none      cterm=none
    hi BStatement   guifg=#0030b0   guibg=NONE      ctermfg=19     ctermbg=NONE      gui=none      cterm=bold

    hi PreProc      guifg=#a06000   guibg=NONE      ctermfg=130    ctermbg=NONE      gui=none      cterm=none
    hi BPreProc     guifg=#a06000   guibg=NONE      ctermfg=130    ctermbg=NONE      gui=none      cterm=bold

    hi Type         guifg=#0070a0   guibg=NONE      ctermfg=25     ctermbg=NONE      gui=none      cterm=none
    hi BType        guifg=#0070a0   guibg=NONE      ctermfg=25     ctermbg=NONE      gui=none      cterm=bold

    hi Special      guifg=#703080   guibg=NONE      ctermfg=5      ctermbg=NONE      gui=none      cterm=none
    hi BSpecial     guifg=#703080   guibg=NONE      ctermfg=5      ctermbg=NONE      gui=none      cterm=bold

    " == Text Markup ==
    hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=underline cterm=underline
    hi Error        guifg=#c02620   guibg=#f0c6c0   ctermfg=1      ctermbg=181       gui=none      cterm=none
    hi Todo         guifg=#504000   guibg=#f6f080   ctermfg=58     ctermbg=228       gui=none      cterm=none
    hi MatchParen   guifg=NONE      guibg=#d0f080   ctermfg=NONE   ctermbg=192       gui=none      cterm=none
    hi NonText      guifg=#b0c0d0   guibg=NONE      ctermfg=146    ctermbg=NONE      gui=none      cterm=none
    hi SpecialKey   guifg=#b0d0c0   guibg=NONE      ctermfg=151    ctermbg=NONE      gui=none      cterm=none
    hi Title        guifg=#0080e0   guibg=NONE      ctermfg=26     ctermbg=NONE      gui=bold      cterm=bold

    " == Text Selection ==
    hi Cursor       guifg=bg        guibg=#505050   ctermfg=bg     ctermbg=239       gui=none      cterm=none
    hi CursorIM     guifg=bg        guibg=#505050   ctermfg=bg     ctermbg=239       gui=none      cterm=none
    hi CursorColumn guifg=NONE      guibg=#e8e8e8   ctermfg=NONE   ctermbg=254       gui=none      cterm=none
    hi CursorLine   guifg=NONE      guibg=#e8e8e8   ctermfg=NONE   ctermbg=254       gui=none      cterm=none
    hi Visual       guifg=NONE      guibg=#d0e0f0   ctermfg=NONE   ctermbg=153       gui=none      cterm=none
    hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=underline cterm=underline
    hi IncSearch    guifg=#000000   guibg=#90d0d0   ctermfg=fg     ctermbg=116       gui=none      cterm=none
    hi Search       guifg=#000000   guibg=#f0b060   ctermfg=fg     ctermbg=215       gui=none      cterm=none

    " == UI ==
    hi Pmenu        guifg=#ffffff   guibg=#505050   ctermfg=231    ctermbg=239       gui=none      cterm=none
    hi PmenuSel     guifg=#000000   guibg=#d0e0f0   ctermfg=16     ctermbg=153       gui=none      cterm=none
    hi PMenuSbar    guifg=#ffffff   guibg=#404040   ctermfg=231    ctermbg=238       gui=none      cterm=none
    hi PMenuThumb   guifg=#000000   guibg=#a0a0a0   ctermfg=16     ctermbg=247       gui=none      cterm=none
    hi StatusLine   guifg=#ffffff   guibg=#505050   ctermfg=231    ctermbg=239       gui=bold      cterm=bold
    hi StatusLineNC guifg=#e0e0e0   guibg=#505050   ctermfg=254    ctermbg=239       gui=none      cterm=none
    hi TabLine      guifg=#ffffff   guibg=#505050   ctermfg=231    ctermbg=239       gui=none      cterm=none
    hi TabLineFill  guifg=#a0a0a0   guibg=#505050   ctermfg=247    ctermbg=239       gui=none      cterm=none
    hi TabLineSel   guifg=#000000   guibg=#d0e0f0   ctermfg=16     ctermbg=153       gui=none      cterm=none
    hi VertSplit    guifg=#868686   guibg=#505050   ctermfg=102    ctermbg=239       gui=none      cterm=none
    hi Folded       guifg=#ffffff   guibg=#a0a0a0   ctermfg=231    ctermbg=247       gui=none      cterm=none
    hi FoldColumn   guifg=#ffffff   guibg=#a0a0a0   ctermfg=231    ctermbg=247       gui=none      cterm=none

    " == Spelling ==
    hi SpellBad     guisp=#ee0000                                  ctermbg=210       gui=undercurl cterm=undercurl
    hi SpellCap     guisp=#eeee00                                  ctermbg=227       gui=undercurl cterm=undercurl
    hi SpellRare    guisp=#ffa500                                  ctermbg=221       gui=undercurl cterm=undercurl
    hi SpellLocal   guisp=#ffa500                                  ctermbg=221       gui=undercurl cterm=undercurl

    " == Diff ==
    hi DiffAdd      guifg=fg        guibg=#d0e0d0   ctermfg=fg     ctermbg=151       gui=none      cterm=none
    hi DiffChange   guifg=fg        guibg=#e0d6c0   ctermfg=fg     ctermbg=187       gui=none      cterm=none
    hi DiffDelete   guifg=fg        guibg=#f0d0d0   ctermfg=fg     ctermbg=181       gui=none      cterm=none
    hi DiffText     guifg=#d05000   guibg=#e0d6c0   ctermfg=160    ctermbg=187       gui=bold      cterm=bold

    " == Misc ==
    hi Directory    guifg=#009040   guibg=NONE      ctermfg=29     ctermbg=NONE      gui=none      cterm=none
    hi ErrorMsg     guifg=#a00000   guibg=NONE      ctermfg=124    ctermbg=NONE      gui=none      cterm=none
    hi SignColumn   guifg=#708090   guibg=#f8f8f8   ctermfg=66     ctermbg=231       gui=none      cterm=none
    hi LineNr       guifg=#ffffff   guibg=#a0a0a0   ctermfg=231    ctermbg=247       gui=none      cterm=none
    hi MoreMsg      guifg=#2060c0   guibg=NONE      ctermfg=4      ctermbg=NONE      gui=none      cterm=none
    hi ModeMsg      guifg=#000000   guibg=NONE      ctermfg=16     ctermbg=NONE      gui=none      cterm=none
    hi Question     guifg=fg        guibg=NONE      ctermfg=NONE   ctermbg=NONE      gui=none      cterm=none
    hi WarningMsg   guifg=#d04020   guibg=NONE      ctermfg=9      ctermbg=NONE      gui=none      cterm=none
    hi WildMenu     guifg=#000000   guibg=#d0e0f0   ctermfg=16     ctermbg=153       gui=none      cterm=none
    hi ColorColumn  guifg=NONE      guibg=#f0f0e0   ctermfg=NONE   ctermbg=230       gui=none      cterm=none
    hi Ignore       guifg=bg                        ctermfg=bg


endif

" == Vimwiki Colors ==
hi link VimwikiHeader1 BConstant
hi link VimwikiHeader2 BIdentifier
hi link VimwikiHeader3 BStatement
hi link VimwikiHeader4 BSpecial
hi link VimwikiHeader5 BPreProc
hi link VimwikiHeader6 BType

" == Tagbar Colors ==
hi link TagbarAccessPublic Constant
hi link TagbarAccessProtected Type
hi link TagbarAccessPrivate PreProc

" == Commands ==
command! LuciusLight let g:lucius_style = "light" | colorscheme lucius
command! LuciusDark let g:lucius_style = "dark" | colorscheme lucius

