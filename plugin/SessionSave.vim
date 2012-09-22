
func! <SID>SessionSave(bang, ...)
    if a:0 == 1
        let cmd = "mksession ".a:1
        echo cmd
        exec cmd
    elseif v:this_session != ""
        if a:bang == "!"
            let cmd = "mksession! ".v:this_session
            echo cmd
            exec cmd
        else
            echoerr "Use :SessionSave! to write to current v:this_session <".v:this_session.">"
        endif
    else
        echoerr "No session defined. Use :mksession <...>"
    endif
endfunc

command! -nargs=? -bang -complete=file SessionSave :call <SID>SessionSave("<bang>", <f-args>)


command! PSession :put =v:this_session

" Used in conjunction with <http://www.vim.org/scripts/script.php?script_id=1678>
func! <SID>MakeTabNameScript()
    if !exists("v:this_session") || v:this_session == ""
        echo "No saved session to base tab name script name on."
        return
    endif
    let tagnamescript = substitute(v:this_session, ".vim$", "x.vim", "")
    exec "new " . tagnamescript
    normal ggdG
    let tabCount = tabpagenr("$")
    let ti = 0
    while ti < tabCount
        let ti += 1
        let tname = gettabwinvar(ti, 1, 'tab_win_name')
        let nextCmd = (ti == 1)? 'tabfirst' : 'tabnext'
        if tname != ""
            put =nextCmd.'\| TName \"'.tname.'\"'
        else
            put =nextCmd
        endif
    endwhile
    put ='tabfirst'
    put =''
endfunc

command! -nargs=0 TNameScript :call <SID>MakeTabNameScript()

