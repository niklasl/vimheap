"=======================================================================
" Toggle Idioms: Quick toggling of coding style idioms.
"=======================================================================


"=======================================================================
" Toggle identifiers (camelCase, CONSTANT, underscore_separated)

func! CamelToConstant(str)
    return toupper(substitute(a:str, "\\v(\\l)(\\u)", "\\1_\\2", "g"))
endfunc

func! ScoresToCamel(str)
    return substitute(tolower(a:str), "\\v_(\\l)", "\\u\\1", "g")
endfunc

func! LowerUpperToggle(str, ...)
    let oldC = @c
    let modifier = (a:0 == 1)? a:1 : "n"
    let upMod = modifier == "u"
    let isConstant = match(a:str, "\\<[A-Z_]\\+\\>") == 0
    let isScored = a:str =~ '_'
    if isConstant
        let @c = upMod? ScoresToCamel(a:str) : tolower(a:str)
    elseif upMod
        let @c = CamelToConstant(a:str)
    elseif isScored
        let @c = ScoresToCamel(a:str)
    else
        let @c = tolower(CamelToConstant(a:str))
    endif
    normal ciwc
    let @c = oldC
    unlet oldC
    silent! call repeat#set("\<Plug>LowerUpperToggle".toupper(modifier), -1)
endfunc

command! -nargs=? LowerUpperToggle call LowerUpperToggle(expand("<cword>"), <f-args>)
nnoremap <silent> <Plug>LowerUpperToggleN :LowerUpperToggle<CR>
nnoremap <silent> <Plug>LowerUpperToggleU :LowerUpperToggle u<CR>
nmap <Leader>l <Plug>LowerUpperToggleN
nmap <Leader>L <Plug>LowerUpperToggleU


"=======================================================================
" Toggle Property Style (getProperty(), property=
" TODO: toggle setters!

let s:accessorexpr = '\<\(get\|is\)\(\u\w*\)'

func! AccessToProperty(str)
    return substitute(a:str, s:accessorexpr, '\l\2', "g")
endfunc

func! PropertyToAccess(str)
    return substitute(a:str, '\(\<\w\+\>\)', 'get\u\1()', "g")
endfunc

func! ConvertProperty(str)
    if match(a:str, s:accessorexpr) == 0
        return AccessToProperty(a:str)
    else
        return PropertyToAccess(a:str)
    endif
endfunc

func! PropertyToggle(str)
    let oldC = @c
    let @c = ConvertProperty(a:str)
    normal ciwc
    if getline('.')[col('.'):col('.')+1] == '()'
        normal l2xb
    else
        normal 2b
    endif
    let @c = oldC
    silent! call repeat#set("\<Plug>PropertyToggle", -1)
endfunc

command! -nargs=? PropertyToggle call PropertyToggle(expand("<cword>"))
nnoremap <silent> <Plug>PropertyToggle :PropertyToggle<CR>
nmap <Leader>p <Plug>PropertyToggle
nmap <Leader>P <Plug>PropertyToggle


