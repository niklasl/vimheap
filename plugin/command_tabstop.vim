
command! -nargs=1 TabStop setlocal tabstop=<args>

command! -nargs=1 SoftTabStop setlocal softtabstop=<args> | setlocal shiftwidth=<args>

func! Retab(width)
    let curr_tabstop = &tabstop
    let curr_expandtab = &expandtab
    let &tabstop = &softtabstop
    let &expandtab = 0
    retab!
    let &tabstop = a:width
    let &expandtab = 1
    retab!
    let &expandtab = curr_expandtab
    let &tabstop = curr_tabstop
    exec "setlocal softtabstop=".a:width
endfunc

command! -nargs=1 Retab call Retab(<args>)

