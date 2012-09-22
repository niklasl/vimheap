" Usage: :PipeDo l %!ls -la

func! s:PipeDo(winmove, ...)
    exec "wincmd ".a:winmove
    let cmdstr = join(a:000, " ")
    silent undo
    echo cmdstr
    silent exec cmdstr
    wincmd p
endfunc

command! -nargs=+ PipeDo call <SID>PipeDo(<f-args>)

