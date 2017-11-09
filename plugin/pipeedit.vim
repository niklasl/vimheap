" Usage: :PipeEdit(!) [any one-liner]

func! s:PipeEdit(bang, ...)
    if expand("%") != "" && expand("%")[0:4] != "pipe:"
        " TODO: warn, or unload and edit?
        return
    endif
    if &modified
        return
    endif
    let curbuf = bufnr("%")
    if len(a:000) > 0
        let cmdstr = join(a:000, " ")
    elseif a:bang == "!"
        let cmdstr = getline(".")
    endif
    if exists('cmdstr')
        exec "e pipe:". escape(cmdstr, "\\ \"'%#!|&")
    endif
    e
    call <SID>PipeEditPaint()
    if a:bang == "!"
        exec "bd " . curbuf
    endif
endfunc

func! s:PipeEditPaint()
    setlocal buftype=nofile
    setlocal noswapfile
    if getline(".") == ""
        normal "%p0"_df:
    endif
endfunc

command! -nargs=* -bang PipeEdit call <SID>PipeEdit(<q-bang>, <f-args>)


augroup PipeEdit
 au!
 " TODO: doesn't match complex expressions..
 au BufReadCmd  pipe:*      call <SID>PipeEditPaint()
 "au FileReadCmd pipe:*      call <SID>PipeEdit("")
augroup END
