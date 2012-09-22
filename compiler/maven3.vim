" Vim Compiler File
" Compiler:	maven3
" Based on maven2

if exists("current_compiler")
    finish
endif
let current_compiler = "maven3"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn

CompilerSet errorformat=
    \%-G[%\\(ERROR]%\\)%\\@!%.%#,
    \%A%[%^[]%\\@=%f:[%l\\,%v]\ %m,
    \%W[ERROR]\ %f:[%l\\,%v]\ %m,
    \%-Z\ %#,
    \%-Clocation\ %#:%.%#,
    \%C%[%^:]%#%m,
    \%-G%.%#

