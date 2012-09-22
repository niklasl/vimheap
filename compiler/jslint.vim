" Vim compiler file
" Compiler:     JSLint
" Maintainer:   <None>
" Creator:      <lindstream@gmail.com>
" Last Change:  2008-05-30

if exists("current_compiler")
  finish
endif
let current_compiler = "jslint"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=jsl\ -nologo\ -process\ %

" TODO:
" - column doesn't work?!
" - capture error type better?
CompilerSet errorformat=
    \%A%f(%l):%.%#\ %t%.%#:\ %m,
    \%-G,
    \%-Z%p^

