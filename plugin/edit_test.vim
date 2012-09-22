"-----------------------------------------------------------"
" Vim script: edit_test.vim                                 "
" About:    Edit the test for the current file.             "
" Author:   Niklas Lindström <lindstream@gmail.com>         "
"-----------------------------------------------------------"

func! TestPath()
    let rname = expand("%:t:r")
    let ext = ".".expand("%:t:e")
    " TODO: or src|test, somepackage|test etc..
    " and/or just try to locate some candidates..
    let srcpattern = '/main/'
    let repl = '/test/'
    let testdir = substitute(expand("%:p:h"), srcpattern, repl, '') . "/"
    let testglobbed = glob(testdir."*".rname."*".ext)
    if testglobbed != ""
        return testglobbed
    endif
    for kind in ['Test', 'Spec']
      if rname =~ '^[a-z]\|_'
          let prename = tolower(kind)."_" | let aftername = ""
      else
          let prename = "" | let aftername = kind
      end
      let testpath = testdir.prename.rname.aftername.ext
      if exists(testpath)
        break
      endif
    endfor
    return testpath
endfunc

command! -nargs=* -complete=file Etest exec "edit ".TestPath(<f-args>)
command! -nargs=* -complete=file Stest exec "split ".TestPath(<f-args>)
command! -nargs=* -complete=file Vtest exec "vsplit ".TestPath(<f-args>)

