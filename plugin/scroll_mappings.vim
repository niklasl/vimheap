"---------------------------------------------------"
" Vim script: scroll_mappings.vim                   "
" About:                                            "
" Author:   Niklas Lindström <neuron@canit.se>      "
"---------------------------------------------------"


let s:hasMapped = 0
let s:lastScrollValue = -1

func! SmoothScrolling()
    if s:lastScrollValue != &scroll || s:hasMapped == 0
        let s:scrollCount = 0
        let s:upMoves = ""
        let s:downMoves = ""
        let s:backMoves = ""
        let s:fwdMoves = ""
        while s:scrollCount < &scroll
            let s:upMoves = s:upMoves . "<C-Y>"
            let s:downMoves = s:downMoves . "<C-E>"
            let s:backMoves = s:backMoves . "2<C-Y>"
            let s:fwdMoves = s:fwdMoves . "2<C-E>"
            let s:scrollCount = s:scrollCount + 1
        endwhile
        unlet s:scrollCount
        exec "map <C-U> ".s:upMoves . ":call SmoothScrolling()<NL>"
        exec "map <C-D> ".s:downMoves . ":call SmoothScrolling()<NL>"
        exec "map <C-B> ".s:backMoves . ":call SmoothScrolling()<NL>"
        exec "map <C-F> ".s:fwdMoves . ":call SmoothScrolling()<NL>"
        map <PageUp> <C-B>
        map <PageDown> <C-F>
        " garbage collection.. sort of..
        unlet s:upMoves
        unlet s:downMoves
        unlet s:backMoves
        unlet s:fwdMoves
    endif
    let s:hasMapped = 1
endfunc

func! ResetScrolling()
    unmap <C-U>
    unmap <C-D>
    unmap <C-B>
    unmap <C-F>
    unmap <PageUp>
    unmap <PageDown>
    let s:hasMapped = 0
endfunc


" call SmoothScrolling()


" EOF
