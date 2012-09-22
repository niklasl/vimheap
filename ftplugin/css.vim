" Vim filetype plugin for CSS
" Language: CSS
" Author: Niklas Lindström
" Last Change: 2006-02-26

setlocal foldmethod=marker
set foldmarker={,}

" treat '-' as part of keywords (makes them completable)
setlocal iskeyword+=-

" abbreviations and maps
inoreabbrev bred__IABBREV border: 1px solid red;

