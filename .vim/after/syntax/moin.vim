" Vim syntax file
" Language:     MoinMoin
" Maintainer:   Michael Lamertz <mike@perl-ronin.de>
" Contributors: David O'Callaghan <david.ocallaghan@cs.tcd.ie>
"               Tony Garland <Tony.Garland@fluke.com>
"               Ingo Karkat <ingo@karkat.de>
" Last Change:  27-Jan-2008
"   27-Jan-2008 Incorporated syntax changes of MoinMoin 1.6; the
"               syntax version is configurable via g:moin_version (globally) or
"               b:moin_version (for the current buffer only). 
"               Small BFs: 'elsif', 'did_acedb_...'.
"   22-Aug-2007 Added moinEmbedded highlighting. 
"   08-May-2007 Added contains=@NoSpell for URLs, Email, pragmas and
"               (configurable via g:moin_spell_wikiwords) WikiWords. 

" Bugs:         Parsing of mixed bold-italic not yet implemented
"               Tables not yet implemented

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

function! s:GetMoinVersion()
    if exists('b:moin_version')
        return b:moin_version
    elseif exists('g:moin_version')
        return g:moin_version
    else
        return 999
    endif
endfunction

" headings
syn match       moinHeader              /^\(=\{1,5}\).*\1$/

" inline markup
syn match       moinItalic              /\('\{2}\)[^']\+\1/
syn match       moinBold                /\('\{3}\)[^']\+\1/
syn match       moinBoldItalic          /\('\{5}\)[^']\+\1/
syn match       moinUnderline           /\(_\{2}\).\{-}\1/
syn match       moinSubscript           /\(,\{2}\).\{-}\1/
syn match       moinSuperscript         /\(\^\).\{-}\1/
syn match       moinTypewriter          /\(`\).\{-}\1/
if s:GetMoinVersion() < 160
    syn match       moinMacro               /\[\{2}.\{-}\]\{2}/
else
    syn match       moinMacro               /<\{2}.\{-}>\{2}/
endif

" Codeblocks
syn region      moinPreformatted        start=/{{{/ end=/}}}/

" Links
if exists('g:moin_spell_wikiwords')
    syn match       moinWikiWord            /\(\w\+:\)\?\u[a-z0-9]\+\u[a-z0-9]\+\(\u[a-z0-9]\+\)*/
    syn match       moinSubLink             /\(\w\+\|\.\.\)\?\// nextgroup=moinWikiWord
else
    syn match       moinWikiWord            /\(\w\+:\)\?\u[a-z0-9]\+\u[a-z0-9]\+\(\u[a-z0-9]\+\)*/ contains=@NoSpell
    syn match       moinSubLink             /\(\w\+\|\.\.\)\?\// nextgroup=moinWikiWord contains=@NoSpell
endif
syn match       moinNormalURL           /\w\+:\/\/\S\+/ contains=@NoSpell
syn match       moinEmail               /\S\+@\S\+/ contains=@NoSpell
if s:GetMoinVersion() < 160
    syn match       moinBracketLink         /\[[^[\]]\+\]/ contains=@NoSpell
    syn match       moinEmbedded            /attachment:\S\+/ contains=@NoSpell
    syn match       moinEmbedded            /inline:\S\+/ contains=@NoSpell
else
    syn match       moinBracketLink         /\[\{2}.\{-}\]\{2}/ contains=@NoSpell
    syn match       moinEmbedded            /{\{2}[^{].\{-}}\{2}/ contains=@NoSpell
endif


" lists
syn match       moinBulletList          /^\(\s\+\)\zs\*\ze\s/
syn match       moinNumberedList        /^\(\s\+\)\zs1\.\ze\s/
syn match       moinAlphalist           /^\(\s\+\)\zsa\.\ze\s/
syn match       moinRomanlist           /^\(\s\+\)\zsi\.\ze\s/
syn match       moinBigromanlist        /^\(\s\+\)\zsI\.\ze\s/
syn match       moinDescriptionlist     /^\(\s\+\)\zs.\{-}::\ze\s/

" rules
syn match       moinRule                /^-\{4,}/

" comments/pragmas
syn match       moinComment             /^##.*$/
syn match       moinPragma              /^#\w\+.*$/ contains=@NoSpell

" variables
syn match       moinVariable            /@\w\+@/


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_moin_syn_inits")
    if version < 508
        let did_moin_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink      moinHeader              Function

    HiLink      moinItalic              Identifier
    HiLink      moinBold                Identifier
    HiLink      moinBoldItalic          Identifier
    HiLink      moinUnderline           Identifier
    HiLink      moinSubscript           Identifier
    HiLink      moinSuperscript         Identifier
    HiLink      moinTypewriter          Identifier
    HiLink      moinMacro               Define
    HiLink      moinPragma              Define
    HiLink      moinEmbedded            Include

    HiLink      moinPreformatted        String

    HiLink      moinWikiWord            Statement
    HiLink      moinBracketLink         Statement
    HiLink      moinNormalURL           Statement
    HiLink      moinSubLink             Statement
    HiLink      moinInterLink           Statement
    HiLink      moinEmail               Statement

    HiLink      moinBulletList          Type
    HiLink      moinNumberedList        Type
    HiLink      moinAlphalist           Type
    HiLink      moinRomanlist           Type
    HiLink      moinBigromanlist        Type
    HiLink      moinDescriptionlist     Type

    HiLink      moinRule                Special

    HiLink      moinComment             Comment

    HiLink      moinVariable            Macro

    delcommand HiLink
endif

let b:current_syntax = "moin"
