" Creates a split line by setting the statusline of upper window(s) of a split
" buffer to the content of the line below the lower edge. By highlighting it
" as Folded, this gives the impression of a relative fold.

if !exists("g:splitline_enabled")
  let g:splitline_enabled = 0
endif

func! ReprLineBelow()
  let linenr = line("w$") + 1
  "let nrrepr = repeat(' ', &number * max([len(string(line("$"))), &numberwidth]) + 1)
  " TODO: odd vim bug: one leading space is chomped? See also bugadjust below.
  let nrrepr = " "
  let lastnr = line("$")
  if (&number || &relativenumber) && linenr <= lastnr
    " TODO: different for relativenumber
    let nrrepr = string(linenr)
    let nrwidth = len(nrrepr)
    let bugadjust = nrwidth < &numberwidth && &numberwidth <= len(string(lastnr))? 1 : 0
    let nrrepr = repeat(" ", &numberwidth - nrwidth + bugadjust) . nrrepr . " "
  endif
  return nrrepr . getline(linenr)
endfunc

func! Splitline(bang)
  au! WinEnter * Splitline
  if a:bang == "!"
    let g:splitline_enabled = !g:splitline_enabled
  endif
  " save default statusline
  if !g:splitline_enabled
    if exists("b:statusline")
      let &l:statusline=b:statusline
    endif
    return
  endif
  if bufnr("%") == winbufnr((winnr() + 1))
    if !exists("b:statusline")
        let b:statusline = &l:statusline
    endif
    setl statusline=%#Folded#%{ReprLineBelow()}
  else
    let &l:statusline=b:statusline
  endif
endfunc

command! -nargs=0 -bang Splitline call Splitline("<bang>")
