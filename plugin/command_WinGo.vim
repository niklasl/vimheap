"---------------------------------------------------"
" Vim script: command_WinGo.vim                     "
" About: Goes to window whose name resembles arg    "
" Author:   Niklas Lindström <neuron@canit.se>      "
"---------------------------------------------------"

" NOTE: isn't really needed when combining switchbuf=useopen (,split); use
" :sb<Tab>-commands..

command! -nargs=1 -complete=buffer WinGo exec bufwinnr(bufnr('<args>'))."wincmd w"

" EOF
