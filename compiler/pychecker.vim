" Vim compiler file
" Compiler:     Pychecker for Python
" Maintainer:   <None - see Vim Tip #949>
" Last Change:  2005-06-15

if exists("current_compiler")
  finish
endif
let current_compiler = "pychecker"

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pychecker\ %
CompilerSet efm=%f:%l:%m
