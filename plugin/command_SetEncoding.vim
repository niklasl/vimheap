"---------------------------------------------------"
" Vim script: command_SetEncoding.vim               "
" About:                                            "
" Author: Niklas Lindström <nlm@valtech.se>         "
"---------------------------------------------------"


if version < 602
    finish
endif


function! AllEncs(A,L,P)
    return "latin1\nutf-8\nutf-16\nascii\nmacroman"
endfunction

function! s:SetEncoding(...)
    if a:0 == 0
        set encoding?
        set fileencoding?
        set termencoding?
    else
        " Sets termencoding explicitly to current (default) encoding if empty
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        exec "set encoding=".a:1
    endif
endfunction


command! -complete=custom,AllEncs -nargs=? SetEncoding :call <SID>SetEncoding(<f-args>)
command! -complete=custom,AllEncs -nargs=? Encoding :SetEncoding <args>


" EOF
