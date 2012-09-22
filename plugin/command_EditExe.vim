
func! EditExe(cmdname)
    let fpath = system("which ".a:cmdname)
    exec "e " . fpath
endfunc

command! -nargs=1 -complete=shellcmd EditExe call EditExe(<f-args>)

