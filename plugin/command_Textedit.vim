
func! s:Textedit()
    " TODO: reuse FormatterToggle.vim?
    if ! exists("b:_oldformatoptions")
        let b:_oldformatoptions = &formatoptions
    endif
    let &formatoptions="tcqwan2"
    "echo "Use :setlocal spelllang=<langCode>"
    setlocal spell
    setlocal nonumber
    setlocal cursorline
    "colorscheme gravelily
endfunc

command! -nargs=0 Textedit call <SID>Textedit()

