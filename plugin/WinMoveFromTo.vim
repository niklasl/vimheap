"-----------------------------------------------"
" Window Move From/To for Vim                   "
" Author: Niklas Lindström <nlm@valtech.se>     "
"-----------------------------------------------"


func! s:WinMoveTo()
    if exists("s:move_buf_name") 
        exec "sb ".s:move_buf_name
        " NOTE: enew is used instead of quit to keep window area - note that
        " enew will fail if buffer is modified
        enew
        wincmd p
        exec "edit ".s:move_buf_name
        unlet s:move_buf_name
    else
        echoerr "No :WinMoveFrom called!"
    endif
endfunc

command! WinMoveFrom let s:move_buf_name = bufname("%")
command! WinMoveTo call <SID>WinMoveTo()


" TODO: this command will quit previous buffer if run in a window with the
" chosen buffer already present
command! -complete=buffer -nargs=1 BufHere sb <args>
                                            \ <Bar> wincmd p
                                            \ <Bar> b <args>
                                            \ <Bar> wincmd p
                                            \ <Bar> wincmd q
                                            \ <Bar> wincmd p


" EOF
