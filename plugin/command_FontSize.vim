
func! s:FontSize(oper)
    if !exists("s:storedFont")
        let s:storedFont = &guifont
    endif
    let regExp = '\(.\+:h\)\(\d\+\)\(\.\d\+\)\?'
    let fontType = substitute(&guifont, regExp, '\1', '')
    let fontSize = substitute(&guifont, regExp, '\2', '')
    if a:oper == "-" && fontSize > 1
        let &guifont = fontType . (fontSize - 1)
    elseif a:oper == "+"
        let &guifont = fontType . (fontSize + 1)
    elseif a:oper == "0"
        let &guifont = s:storedFont
    endif
endfunc

command! -nargs=1 FontSize :call <SID>FontSize("<args>")

" active (overrides the default MacVim equivalents)
" TODO: unable to deactivate with: macmenu <D--> key=<Nop> (not even if this
"       is put in "~/.vim/after/plugin"..)
nnoremap <D--> :FontSize -<CR>
nnoremap <D-+> :FontSize +<CR>
nnoremap <D-0> :FontSize 0<CR>

