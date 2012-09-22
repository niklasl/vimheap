" Vim filetype plugin for HTML
" Language: HTML
"Maintainer: Niklas Lindström
" Last Change: 2001-12-13

"==== indent settings ====

setlocal expandtab
"setlocal softtabstop=2
"setlocal shiftwidth=2


"######## ABBREVIATIONS ########

" NOTE: these uses a generic mapping to force expansions of abbrevs ending
" with "__IABBREV" - see $HOME/.vim/plugin/abbrs_maps.vim

inorea <buffer> table__IABBREV <table border="0" cellspacing="0" cellpadding="0"><CR><tr><CR><td></td><CR></tr><CR></table><ESC><Up><Up>f>a
inorea <buffer> script__IABBREV <script type="text/javascript"><CR></script><ESC>O
inorea <buffer> img__IABBREV <img src="" border="" hspace="0" vspace="0" /><ESC>F<eEi
inorea <buffer> did__IABBREV <div id=""><CR></div><ESC>k_f"
inorea <buffer> link__IABBREV <link rel="stylesheet" href="" /><ESC>F"i


"--------- reuse javascript ftplugin:s --------
runtime! ftplugin/javascript.vim ftplugin/javascript*.vim ftplugin/javascript/*.vim


" EOF
