
" Usage: Primarily to clean imports; e.g. for java:
"   :g/^import /IfWordUnique t; dd

func! s:IfWordUnique(...)
    if a:0 == 2
        let norm_pre = a:1
        let norm_action = a:2
    elseif a:0 == 1
        let norm_action = a:1
    else
        let norm_action = "dd"
    endif
    if exists("norm_pre")
        exec "normal ".norm_pre
    endif
    if !search('\<'.expand("<cword>").'\>', 'nWp')
        exec "normal ".norm_action
    endif
endfunc

command! -nargs=* IfWordUnique call <SID>IfWordUnique(<f-args>)


" Mad oneliner
command! -nargs=0 ImportCleanup :g/^import \|^from /exec "norm $b"|if(!search('\<'.expand("<cword>").'\>', 'nWp'))|d|en|noh

" Artifact: first test kept for fun
" this just deletes lines where <cword> doesn't appear below
" :command! -nargs=0 ImportClean if ( !search('\<'.expand("<cword>").'\>', 'nWp') ) | delete | endif

