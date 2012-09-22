

func! s:WrappedBreakToggle()
    set invlinebreak
    if &linebreak == 1
        set nolist
        nnoremap <Up> g<Up>
        nnoremap <Down> g<Down>
        inoremap <Up> <C-O>g<Up>
        inoremap <Down> <C-O>g<Down>
        echo "WrappedBreak ON"
    else
        set list
        nunmap <Up>
        nunmap <Down>
        iunmap <Up>
        iunmap <Down>
        echo "WrappedBreak OFF"
    endif
endfunc

command! -nargs=0 WrappedBreakToggle call <SID>WrappedBreakToggle()


func! s:AutoFormatToggle()
    "if match(&formatoptions, 'a') == -1
    "    set formatoptions+=a
    "    echo "set formatoptions+=a"
    "else
    "    set formatoptions-=a
    "    echo "set formatoptions-=a"
    "endif
    if ! exists("b:_oldformatoptions")
        let b:_oldformatoptions = &formatoptions
    endif
    if b:_oldformatoptions != &formatoptions
        let &formatoptions=b:_oldformatoptions
    else
        let &formatoptions="tcqwan2"
    endif
    echo "set formatoptions=".&formatoptions
endfunc

command! -nargs=0 AutoFormatToggle call <SID>AutoFormatToggle()

inoremap <C-A> <C-O>:AutoFormatToggle<CR>


" EOF
