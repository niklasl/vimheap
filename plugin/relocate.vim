
" Relocate tries to find a non-existing file in the current window in the
" given path. If successful, it will vertically split the window and open the
" found file there. If a bang (:Relocate! <path>) is used, the non-existing
" buffer will be deleted.
"
" This is very useful to e.g. relocate files that have been moved. Also
" useful in (juducious) conjunction with :windo or :tabdo.
"
" EXAMPLE:
" :windo Relocate! **
"
" Important! If a bang is used and the non-existing file is open in multiple
" windows (in any tab), those ones are closed too. (This is usually desirable,
" but may be surprising.)


func! s:Relocate(bang, path, ...)
    let nameexp = (a:0 > 0)? a:1 : "%:t"
    if expand("%") != "" && !filereadable(expand("%"))
        let found = findfile(expand(nameexp), a:path)
        if found == ""
            return
        endif
        vsplit
        let swap_path = fnamemodify(found, "%:p:h") . "/." . fnamemodify(found, "%:t") . ".swp"
        if filereadable(swap_path)
          if delete(swap_path) != 0
            echoerr "Could not delete: " . swap_path
          endif
        endif
        exec (version >= 600? "saveas! " : "edit ") . found
        wincmd w
        if a:bang == "!"
            bd
        else
            e
        endif
    endif
endfunc

command! -nargs=+ -bang Relocate :call <SID>Relocate("<bang>", <f-args>)

