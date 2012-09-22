" From Vim Tip #1127 <http://www.vim.org/tips/tip.php?tip_id=1127>
"
" Try
"   :echo "dummy"<CR>
"   <F7>
" now you can use F7 to execute :echo "dummy"
" Perhaps you want to have mappings local to your buffer only.
" Then use map <buffer> and unmap <buffer> instead

function! MapLastCommandToKeys(callKey)
    exe "unmap ".a:callKey
    let lastcmd = escape(histget("cmd"), "|")
    exe "map ".a:callKey." :".lastcmd."<CR>"
    unlet lastcmd
endfunction

function! PrepareMap(callKey, ...)
    exe "map ".a:callKey." :call MapLastCommandToKeys('".a:callKey."')<CR>"
    if a:0 == 1
        exe "map ".a:1." :call MapLastCommandToKeys('".a:callKey."')<CR>"
    endif
endfunction

" This will allow you to use F1
call PrepareMap('<F7>', '<S-F7>')
call PrepareMap('<F8>', '<S-F8>')
" This while loop will allow you to use F2,F3,..,F12
"let i=2
"while i<13
"    call PrepareMap('<F'.i.'>')
"    let i=i+1
"endwhile
" of cause you can use any mapping eg \a:
"PrepareMap("\a")

