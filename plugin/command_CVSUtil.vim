"---------------------------------------------------"
" Vim script: command_CVSUtil.vim                   "
" About:                                            "
" Author: Niklas Lindström <lindstream@gmail.com>   "
"---------------------------------------------------"


function! s:CVSUtil(...)
    %!cvs -qn upd .
    g/^M /m0
    %s//cvs commit -m 'no_comment' /g
    g/^U /m0
    %s//cvs -q upd /g
    g/^? /m0
    %s/^? \(.\+\)/#cvs add \1#cvs commit -m 'inital_revision' \1/g
endfunction

command! -nargs=0 CVSUtil :call <SID>CVSUtil(<f-args>)

" EOF
