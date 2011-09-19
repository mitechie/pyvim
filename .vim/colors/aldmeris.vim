" Vim color scheme
" Name:         aldmeris.vim
" Maintainer:   Vincent Velociter <vincent.velociter@gmail.com>
" Version:      1.0
" Url:          https://github.com/veloce/vim-aldmeris

" Aldmeris is based on the gedit oblivion theme for vim.
" The original theme is part of GtkSourceView.
" Original author: Paolo Borelli <pborelli@gnome.org>.
"

" Usage {{{
" ------------
" NOTE FOR TERMINAL USERS:
" -----------------------
" The colorscheme is compatible with terminals that support 256 colors. See:
"
"   http://vim.wikia.com/wiki/256_colors_in_vim
"
" If your terminal uses the tango palette for its base colors (which is,
" I believe, the default in gnome-terminal), you can obtain the most accurate
" result with aldmeris by setting this option in your .vimrc:
"
"   let g:aldmeris_termcolors = "tango"
"
" Below is an .Xdefaults example of that palette:
"
" ! Black
" *color0:  #2E3436
" *color8:  #555753
" ! Red
" *color1:  #CC0000
" *color9:  #EF2929
" ! Green
" *color2:  #4E9A06
" *color10: #8AE234
" ! Yellow
" *color3:  #C4A000
" *color11: #FCE94F
" ! Blue
" *color4:  #3465A4
" *color12: #729FCF
" ! Purple
" *color5:  #75507B
" *color13: #AD7FA8
" ! Cyan
" *color6:  #06989A
" *color14: #34E2E2
" ! White
" *color7:  #D3D7CF
" *color15: #EEEEEC
"
" TANGO PALETTE:
" ----------------------------------
"  Name        Gui       xterm/hex
" -----------  --------  -----------
" butter1      #fce94f   221 #ffd75f
" butter2      #edd400   220 #ffd700
" butter3      #c4a000   178 #d7af00
" chameleon1   #8ae234   113 #87d75f
" chameleon2   #73d216   76  #5fd700
" chameleon3   #4e9a06   64  #5f8700
" orange1      #fcaf3e   215 #ffaf5f
" orange2      #f57900   208 #ff8700
" orange3      #ce5c00   166 #d75f00
" skyblue1     #729fcf   74  #5fafd7
" skyblue2     #3465a4   61  #5f5faf
" skyblue3     #204a87   24  #005f87
" plum1        #ad7fa8   139 #af87af
" plum2        #75507b   96  #875f87
" plum3        #5c3566   239 #4e4e4e
" chocolate1   #e9b96e   179 #d7af5f
" chocolate2   #c17d11   136 #af8700
" chocolate3   #8f5902   94  #875f00
" scarletred1  #ef2929   196 #ff0000
" scarletred2  #cc0000   160 #d70000
" scarletred3  #a40000   124 #af0000
" aluminium1   #eeeeec   231 #ffffff
" aluminium2   #d3d7cf   252 #d0d0d0
" aluminium3   #babdb6   250 #bcbcbc
" aluminium4   #888a85   102 #878787
" aluminium5   #555753   240 #585858
" aluminium6   #2e3436   236 #303030
" }}}
" Colorscheme initialization {{{
" --------------------------
if has("gui_running")
    set background=dark
endif
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "aldmeris"
" }}}
" Custom highlight function {{{
if has("gui_running")
    let s:hi_args = ['guibg', 'guifg', 'gui', 'guisp']
else
    let s:hi_args = ['ctermbg', 'ctermfg', 'cterm']
endif
function! s:Hi(name, ...)
    let command = 'hi ' . a:name
    for i in range(0,len(a:000)-1)
        let command .= ' ' . s:hi_args[i] . '=' . a:000[i]
    endfor
    exe command
endfunc
" }}}
" Default options and env settings {{{
" --------------------------------
if !exists("g:aldmeris_termcolors")
    let g:aldmeris_termcolors = "xterm"
endif

" List terminals that support italics (I'm sure only for xrvt)
let s:terms_italic = ["rxvt", "rxvt-unicode", "rxvt-unicode-256color"]
" }}}
" Gui & term palettes definition {{{
" ------------------------------
if has("gui_running")
    let s:butter1     = "#fce94f"
    let s:butter2     = "#edd400"
    let s:chameleon1  = "#8ae234"
    let s:chameleon3  = "#4e9a06"
    let s:orange1     = "#fcaf3e"
    let s:orange2     = "#f57900"
    let s:orange3     = "#ce5c00"
    let s:skyblue1    = "#729fcf"
    let s:skyblue2    = "#3465a4"
    let s:plum1       = "#ad7fa8"
    let s:plum2       = "#75507b"
    let s:scarletred1 = "#ef2929"
    let s:scarletred2 = "#cc0000"
    let s:aluminium1  = "#eeeeec"
    let s:aluminium2  = "#d3d7cf"
    let s:aluminium3  = "#babdb6"
    let s:aluminium4  = "#888a85"
    let s:aluminium5  = "#555753"
    let s:aluminium6  = "#2e3436"
    let s:black       = "#000000"
elseif &t_Co == 256 && g:aldmeris_termcolors == "tango"
    let s:butter1     = "11"
    let s:butter2     = "220"
    let s:chameleon1  = "10"
    let s:chameleon3  = "2"
    let s:orange1     = "215"
    let s:orange2     = "208"
    let s:orange3     = "166"
    let s:skyblue1    = "12"
    let s:skyblue2    = "4"
    let s:plum1       = "13"
    let s:plum2       = "5"
    let s:scarletred1 = "9"
    let s:scarletred2 = "1"
    let s:aluminium1  = "15"
    let s:aluminium2  = "7"
    let s:aluminium3  = "250"
    let s:aluminium4  = "102"
    let s:aluminium5  = "8"
    let s:aluminium6  = "0"
    let s:black       = "16"
elseif &t_Co == 256
    let s:butter1     = "221"
    let s:butter2     = "220"
    let s:chameleon1  = "113"
    let s:chameleon3  = "64"
    let s:orange1     = "215"
    let s:orange2     = "208"
    let s:orange3     = "166"
    let s:skyblue1    = "74"
    let s:skyblue2    = "61"
    let s:plum1       = "139"
    let s:plum2       = "96"
    let s:scarletred1 = "196"
    let s:scarletred2 = "160"
    let s:aluminium1  = "231"
    let s:aluminium2  = "252"
    let s:aluminium3  = "250"
    let s:aluminium4  = "102"
    let s:aluminium5  = "240"
    let s:aluminium6  = "236"
    let s:black       = "16"
else
    let s:butter1     = "LightYellow"
    let s:butter2     = "Yellow"
    let s:chameleon1  = "LightGreen"
    let s:chameleon3  = "DarkGreen"
    let s:orange1     = "LightCyan"
    let s:orange2     = "Cyan"
    let s:orange3     = "DarkCyan"
    let s:skyblue1    = "LightBlue"
    let s:skyblue2    = "Blue"
    let s:plum1       = "LightMagenta"
    let s:plum2       = "Magenta"
    let s:scarletred1 = "LightRed"
    let s:scarletred2 = "Red"
    let s:aluminium1  = "White"
    let s:aluminium2  = "White"
    let s:aluminium3  = "LightGray"
    let s:aluminium4  = "Gray"
    let s:aluminium5  = "DarkGray"
    let s:aluminium6  = "DarkGrey"
    let s:black       = "Black"
endif
" }}}
" Syntax groups colors (:help group-name) {{{
" ---------------------------------------
call s:Hi( 'Normal',       s:aluminium6,  s:aluminium2 )
call s:Hi( 'Comment',      "bg",          s:aluminium4, "italic" )
call s:Hi( 'Constant',     "bg",          s:butter2 )
call s:Hi( 'Boolean',      "bg",          s:orange3 )
call s:Hi( 'Identifier',   "bg",          s:skyblue1,   "NONE" )
call s:Hi( 'Statement',    "bg",          s:aluminium1, "bold" )
call s:Hi( 'PreProc',      "bg",          s:plum1 )
call s:Hi( 'Type',         "bg",          s:chameleon1, "bold" )
call s:Hi( 'Special',      "bg",          s:orange1 )
call s:Hi( 'SpecialChar',  "bg",          s:orange3 )
call s:Hi( 'Underlined',   "bg",          s:skyblue1,   "underline" )
call s:Hi( 'Error',        s:scarletred2, s:aluminium1, "bold" )
call s:Hi( 'Todo',         s:butter1,     s:aluminium4, "bold" )

" italic is a special case
if !has("gui_running")
    if (index(s:terms_italic, &term) < 0)
        hi Comment cterm=NONE
    endif
endif
" }}}
" Highlight default (:help highlight-default) {{{
" -------------------------------------------
" ColorColumn	used for the columns set with 'colorcolumn'
" Conceal		placeholder characters substituted for concealed
call s:Hi( 'Cursor',       s:aluminium2,  s:black )
" CursorIM	like Cursor, but used when in IME mode
call s:Hi( 'CursorColumn', s:aluminium5,  "NONE",        "NONE" )
call s:Hi( 'CursorLine',   s:aluminium5,  "NONE",        "NONE" )
call s:Hi( 'Directory',    "bg",          s:skyblue1,    "NONE" )
call s:Hi( 'DiffAdd',      s:aluminium5,  s:chameleon3,  "bold" )
call s:Hi( 'DiffChange',   s:aluminium5,  s:orange1,     "bold" )
call s:Hi( 'DiffDelete',   s:aluminium5,  s:scarletred2, "bold" )
call s:Hi( 'DiffText',     s:aluminium5,  s:skyblue1,    "bold" )
call s:Hi( 'ErrorMsg',     s:scarletred2, s:aluminium1 )
call s:Hi( 'VertSplit',    s:aluminium4,  s:aluminium6,  "bold" )
call s:Hi( 'Folded',       "bg",          s:aluminium3,  "bold,underline" )
call s:Hi( 'FoldColumn',   s:aluminium3,  s:aluminium5 )
call s:Hi( 'SignColumn',   s:aluminium3,  s:aluminium5 )
" IncSearch	'incsearch' highlighting
call s:Hi( 'LineNr',       s:black,       s:aluminium5 )
call s:Hi( 'MatchParen',   s:plum1,       s:aluminium1 )
" ModeMsg		'showmode' message (e.g. , "-- INSERT --")
call s:Hi( 'MoreMsg',      "bg",          s:chameleon1,  "bold" )
call s:Hi( 'NonText',      "bg",          s:aluminium5 )
call s:Hi( 'Pmenu',        s:black,       s:aluminium3 )
call s:Hi( 'PmenuSel',     s:aluminium5,  s:aluminium1 )
call s:Hi( 'PmenuSbar',    s:aluminium5,  s:aluminium5 )
call s:Hi( 'PmenuThumb',   s:aluminium4,  s:aluminium4 )
call s:Hi( 'Question',     "bg",          s:chameleon1,  "bold" )
call s:Hi( 'Search',       s:chameleon3,  s:aluminium1 )
call s:Hi( 'SpecialKey',   "bg",          s:aluminium5 )
    if has("gui_running")
call s:Hi( 'SpellBad',     "bg",          "NONE",        "undercurl", s:scarletred1 )
call s:Hi( 'SpellCap',     "bg",          "NONE",        "undercurl", s:skyblue1 )
call s:Hi( 'SpellLocal',   "bg",          "NONE",        "undercurl", s:orange1 )
call s:Hi( 'SpellRare',    "bg",          "NONE",        "undercurl", s:plum1 )
    else
call s:Hi( 'SpellBad',     s:scarletred2, "NONE",        "undercurl" )
call s:Hi( 'SpellCap',     s:skyblue2,    "NONE",        "undercurl" )
call s:Hi( 'SpellLocal',   s:orange2,     "NONE",        "undercurl" )
call s:Hi( 'SpellRare',    s:plum2,       "NONE",        "undercurl" )
    endif
call s:Hi( 'StatusLine',   s:aluminium6,  s:aluminium3,  "bold,reverse" )
call s:Hi( 'StatusLineNC', s:aluminium4,  s:aluminium6,  "NONE" )
" TabLine		tab pages line, not active tab page label
" TabLineFill	tab pages line, where there are no labels
" TabLineSel	tab pages line, active tab page label
call s:Hi( 'Title',        "bg",          s:butter1,     "bold" )
call s:Hi( 'Visual',       s:aluminium4,  s:aluminium1 )
" VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
call s:Hi( 'WarningMsg',   "bg",          s:scarletred1 )
call s:Hi( 'WildMenu',     s:butter2,     s:aluminium6  )
" }}}
" gitcommit colors {{{
" ----------------
hi link gitEmail           SpecialChar
hi link gitEmailDelimiter  gitEmail
hi link gitcommitComment   Comment
hi link gitcommitHeader    gitcommitComment
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected  gitcommitComment
call s:Hi( 'gitcommitDiscardedType',  "NONE", s:scarletred1 )
call s:Hi( 'gitcommitSelectedType',   "NONE", s:chameleon1 )
call s:Hi( 'gitcommitUnmergedType',   "NONE", s:butter1 )
call s:Hi( 'gitcommitUntrackedFile',  "NONE", s:plum1,       "bold" )
call s:Hi( 'gitcommitDiscardedFile',  "NONE", s:scarletred1, "bold" )
call s:Hi( 'gitcommitSelectedFile',   "NONE", s:chameleon1,  "bold" )
call s:Hi( 'gitcommitUnmergedFile',   "NONE", s:butter1,     "bold" )
" }}}
" diff colors {{{
hi link diffFile           Special
hi link diffNewFile        diffFile
call s:Hi( 'diffAdded',               "NONE", s:chameleon1 )
call s:Hi( 'diffRemoved',             "NONE", s:scarletred1 )
" }}}
" XML Colors {{{
" ----------
hi link xmlTag Identifier
hi link xmlEndTag xmlTag
hi link xmlTagName xmlTag
hi link xmlString String
" }}}
"HTML Colors {{{
"-----------
hi link htmlTag xmlTag
hi link htmlEndTag xmlEndTag
hi link htmlTagName xmlTagName
hi link htmlSpecialTagName xmlTagName
hi link htmlString xmlString
hi link htmlSpecialChar PreProc
hi link Javascript Normal
" }}}
" Ruby colors {{{
" -----------
hi link rubyClass Keyword
hi link rubyDefine Keyword
"  }}}
" Javascript colors {{{
hi link javaScriptBraces normal
" following syntax from https://github.com/pangloss/vim-javascript
hi link javaScriptLabel Identifier
hi link javaScriptThis Identifier
" }}}
" PHP Colors {{{
" ----------
hi link phpVarSelector Identifier
hi link phpIdentifier Identifier
hi link phpParent Normal
hi link phpFunctions Function
hi link phpSpecial Special
hi link phpMemberSelector Keyword
hi link phpBoolean Boolean
hi link phpNumber Number
" }}}
" CSS Colors {{{
" ----------
hi link cssIdentifier Normal
hi link cssClassName Normal
hi link cssTagName Normal
hi link cssBraces Normal
hi link cssRenderProp Keyword
hi link cssBoxProp cssRenderProp
hi link cssUIProp cssRenderProp
hi link cssColorProp cssRenderProp
hi link cssFontProp cssRenderProp
hi link cssTextProp cssRenderProp
hi link cssGeneratedContentProp cssRenderProp
hi link cssValueLength Boolean
hi link cssPseudoClassId Identifier
" }}}
" vim:foldmethod=marker
