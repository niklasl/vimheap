" Vim compiler file
" Compiler:     PyFlakes for Python
" Maintainer:   <None>
" Creator:      <lindstream@gmail.com>
" Last Change:  2006-12-23

if exists("current_compiler")
  finish
endif
let current_compiler = "pyflakes"

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pyflakes
CompilerSet efm=%f:%l:%m
"setlocal efm=%+P[%f],%t:\ %#%l:%m
