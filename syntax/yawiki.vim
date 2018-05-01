if exists("b:current_syntax")
    finish
endif

" Sync entire file
syntax sync fromstart

" Copy-paste from markdown.vim
syntax match yawikiInlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/

" Headers
syntax region yawikiH1 start="\V\^\s\*="      end="$"
syntax region yawikiH2 start="\V\^\s\*=="     end="$"
syntax region yawikiH3 start="\V\^\s\*==="    end="$"
syntax region yawikiH4 start="\V\^\s\*===="   end="$"
syntax region yawikiH5 start="\V\^\s\*====="  end="$"
syntax region yawikiH6 start="\V\^\s\*======" end="$"

" Basic formatting
syntax region yawikiItalic start="//\ze\S" end="\S\zs//"
syntax region yawikiBold start="\*\*\ze\S" end="\S\zs\*\*"
syntax region yawikiUnderline start="__\ze\S" end="\S\zs__"

" Multiline regions of text
syntax region yawikiCode start="%%" end="%%"
syntax region yawikiHtml start="<#" end="#>"
syntax match yawikiCutOpen /<{/
syntax match yawikiCutClose /}>/

" Inline regions of text
syntax region yawikiEscaped start=/""/ end=/""/
syntax region yawikiMonospaced start="##\ze\S" end="\S\zs##"
syntax region yawikiStrikeout start="--\ze\S" end="\S\zs--"
syntax region yawikiSmall start="\([^cC]\|^\)++\ze\S" end="\S\zs++"
syntax match yawikiLinkTitle / \zs[^)]*\ze))/ contained
syntax match yawikiLinkTitle / \zs[^]]*\ze]]/ contained
syntax region yawikiLink matchgroup=yawikiDelim start="((" end="))"
    \ contains=yawikiLinkTitle oneline
syntax region yawikiLink matchgroup=yawikiDelim start="\[\[" end="\]\]"
    \ contains=yawikiLinkTitle oneline
syntax region yawikiCommand start="{{" end="}}" oneline

" Questions and notes
syntax region yawikiQuestion start="??" end="??" oneline
syntax region yawikiNote start="!!" end="!!" oneline
syntax region yawikiBlueNote start="!!(\(blue\|син\|синий\))" end="!!" oneline
syntax region yawikiRedNote start="!!(\(red\|крас\|красный\))" end="!!" oneline
syntax region yawikiYellowNote start="!!(\(yellow\|жел\))" end="!!" oneline
syntax region yawikiGreenNote start="!!(\(green\|зел\|зеленый\))" end="!!" oneline
syntax region yawikiGrayNote start="!!(\(gr[ea]y\|сер\))" end="!!" oneline

" Yandex logins with first letter highlighted
syntax match yawikiLoginFirstLetter /\%(-\@1<!\&\<\)\w/ contained
syntax match yawikiLogin /[-_0-9A-Za-z]\+@/ contains=yawikiLoginFirstLetter

syntax match yawikiInlineLogin /[-_0-9A-Za-z]\+/
    \ contains=yawikiLoginFirstLetter contained
syntax match yawikiLoginInflection /\v(кто|кого|кому|оком):[-_0-9A-Za-z]+/
    \ contains=yawikiInlineLogin

syntax match yawikiLoginAt /@/ contained
syntax match yawikiReversedLogin /@[-_0-9A-Za-z]\+/ contains=yawikiLoginAt

" Quotation
syntax region yawikiQuote start="<\[" end="]>"
syntax match yawikiQuote1 /^>.*$/
syntax match yawikiQuote2 /^>>.*$/
syntax match yawikiQuoteMore /^>\{3,}.*$/

" Some miscellaneous stuff
syntax match yawikiSeparator /^\s*-\{4,\}\s*$/
syntax match yawikiDefHead /\((?\)\@2<=\S\+/ contained
syntax match yawikiDefHead /[^?]\+\ze==/ contained
syntax match yawikiDefMarker /==/ contained
syntax region yawikiDef matchgroup=yawikiDefMarker start="(?" end="?)"
    \ contains=yawikiDefHead,yawikiDefMarker
syntax match yawikiTicket /[A-Z]\+-\d\+/
syntax match yawikiHtmlEntity /&\w\+;/
syntax match yawikiHtmlEntity /&#\d\+;/

" List bullets
"" Asterisk
syntax match yawikiListBullet /^\s*[-*]\ze /
"" Numbers and letters
syntax match yawikiListBullet /^\s*[0-9a-zA-Z]\.\(+\|#\d\+\)\?\ze /
"" Roman numerals
syntax match yawikiListBullet /^\s*[IVLXivlx]\+\.\ze /

" Tables
syntax match yawikiTableInnerBorder /|/
syntax match yawikiTableOuterBorder /^\s*||/
syntax match yawikiTableOuterBorder /||\s*$/
syntax match yawikiDelim /^#||\?/
syntax match yawikiDelim /^||\?#/

" Actual coloring goes here
highlight link yawikiH1 Title
highlight link yawikiH2 yawikiH1
highlight link yawikiH3 yawikiH2
highlight link yawikiH4 yawikiH3
highlight link yawikiH5 yawikiH4
highlight link yawikiH6 yawikiH5

highlight yawikiBold term=bold cterm=bold gui=bold
highlight yawikiUnderline term=underline cterm=underline gui=underline
highlight yawikiItalic term=italic cterm=italic gui=italic

highlight link yawikiCode String
highlight link yawikiQuote String
highlight link yawikiHtml String
highlight link yawikiMonospaced String
highlight link yawikiCutOpen String
highlight link yawikiCutClose String
highlight link yawikiCommand PreProc
highlight link yawikiStrikeout Comment
highlight link yawikiSmall Comment
highlight link yawikiNote Error
highlight link yawikiQuestion Todo
highlight link yawikiSeparator Delimiter
highlight link yawikiDefMarker Delimiter
highlight link yawikiDefHead Underlined
highlight link yawikiLink Identifier
highlight link yawikiLinkTitle Underlined
highlight link yawikiTicket Underlined
highlight link yawikiListBullet Character
highlight link yawikiTableOuterBorder Delimiter
highlight link yawikiTableInnerBorder Identifier
highlight link yawikiHtmlEntity Delimiter

highlight link yawikiQuote1 yawikiQuote
highlight yawikiQuote2 ctermfg=darkblue guifg=darkblue
highlight link yawikiQuoteMore Comment

highlight yawikiLoginFirstLetter
    \ ctermfg=darkred term=bold cterm=bold
    \ guifg=#cb4b16 gui=bold
highlight yawikiLogin
    \ term=bold cterm=bold gui=bold
highlight yawikiLoginInflection
    \ ctermfg=gray term=bold cterm=bold
    \ guifg=gray gui=bold
highlight link yawikiInlineLogin yawikiLogin
highlight link yawikiReversedLogin yawikiLogin
highlight link yawikiLoginAt yawikiLoginFirstLetter
highlight link yawikiInlineURL Underlined
highlight link yawikiDelim Delimiter

highlight yawikiBlueNote ctermfg=darkblue guifg=darkblue
highlight yawikiRedNote ctermfg=red guifg=red
highlight yawikiGreenNote ctermfg=darkgreen guifg=darkgreen
highlight yawikiYellowNote ctermfg=darkyellow guifg=darkyellow
highlight yawikiGrayNote ctermfg=darkgray guifg=darkgray

let b:current_syntax = "yawiki"
