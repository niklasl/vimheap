
command! -nargs=0 FixTemp exec "!mkdir '". fnamemodify(tempname(), ":h") ."'"

