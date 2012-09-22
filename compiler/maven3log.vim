" Vim Compiler File
" Compiler:	maven3log
" Based on maven2

let current_compiler = "maven3log"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=cat\ mvnerr.log

CompilerSet errorformat=
    \%-G[%\\(ERROR]%\\)%\\@!%.%#,
    \%A%[%^[]%\\@=%f:[%l\\,%v]\ %m,
    \%W[ERROR]\ %f:[%l\\,%v]\ %m,
    \%-Z\ %#,
    \%-Clocation\ %#:%.%#,
    \%C%[%^:]%#%m,
    \%-G%.%#

