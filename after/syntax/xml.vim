

" NOTE: these are redefined from $VIMRUNTIME/syntax/xml.vim and must be
" manually maintained..
syn region  xmlString contained start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=xmlEntity,magicBracket display
syn region  xmlString contained start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=xmlEntity,magicBracket display

syn region  magicBracket start=+\({\)\@<!\$\?{[^{}]+ end=+}+ contains=xmlSpecial

hi! def link magicBracket Special


" EOF
