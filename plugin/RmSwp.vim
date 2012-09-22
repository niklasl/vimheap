
func! RmSwp(swap_suffix)
  let swap_path = expand("%:p:h") . "/." . expand("%:t") . "." . a:swap_suffix
  if filereadable(swap_path)
    if confirm("Remove '" . swap_path . "'?", "&Yes\n&No") == 1
      if delete(swap_path) != 0
        echoerr "Could not delete: " . swap_path
      endif
    endif
  else
    echoerr "File '" . swap_path . "' does not exist!"
  endif
endfunc

command! -nargs=1 RmSwp :call RmSwp(<f-args>)

