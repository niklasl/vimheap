
func! RegBuf(regname, ...)
    if a:0 == 1
        let l:expandarg = a:1
    else
        let l:expandarg = "%"
    endif
    call setreg(a:regname, expand(l:expandarg). "\n")
endfunc

command! -register -nargs=? RegBuf call RegBuf("<reg>", <f-args>)

