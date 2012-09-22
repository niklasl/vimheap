"---------------------------------------------------"
" Vim script: command_WinSearch.vim                 "
" About:    Echoes window name containing matches   "
"           of search pattern                       "
" Author:   Niklas Lindström <neuron@neverspace.net>"
"---------------------------------------------------"

" TODO: use SearchInBuffers.vim (:SIB) or code thereof
" TODO: Where to add mapping for using this to find FIXME\|TODO\|DEBUG\|NOTE ?
command! -nargs=1 WinSearch windo silent 0 | if search('<args>') | echo expand('%')."\n" | endif


" EOF
