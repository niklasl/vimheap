" Searches for CSS identifier (class or id) i html-like template files in the
" given glob pattern.


func! s:CSSFind(bang, globpath, ...)
    " identifier is class or id
    let classMarkPos = 0
    if a:0 > 0
        if a:1[0] == "."
            let classMarkPos = 1
        endif
        let identifier = a:1[1:]
    else
        let col = col(".")
        let linenr = line(".")
        let classMarkPos = searchpos('\.', 'b', linenr)[1]
        let startpos = classMarkPos? classMarkPos : searchpos('#', 'b', linenr)[1]
        if !startpos
            let idMarkPos = searchpos('#', '', linenr)[1]
            let classMarkPos = idMarkPos? 0 : searchpos('\.', '', linenr)[1]
            let startpos = idMarkPos? idMarkPos : classMarkPos
        endif
        if startpos
            let endpos = searchpos('[^A-Za-z0-9_-]\|$', 'n', linenr)[1]-2
        endif
        call setpos(".", [0, linenr, col, 0])
        if !exists("endpos")
            return
        endif
        let identifier = getline(".")[(startpos):(endpos)]
    endif
    let quotes = "[\"']"
    if classMarkPos
        let regexp = 'class\s*=\s*'. quotes .'\?.*\<'.identifier.'\>'
    else
        let regexp = 'id\s*=\s*'. quotes .'\?\<'.identifier.'\>'
    endif
    let @/ = regexp
    let doJump = (a:bang == "!")
    let jumpFlag = doJump? "" : "j"
    " TODO:? opt. ignoreCase ((a:0 > 0)? a:1 == 'i')?
    exec "silent! vimgrep /". regexp ."/". jumpFlag ." ". a:globpath
    let foundCount = len(getqflist())
    if (!doJump && foundCount) || foundCount > 1
        botright copen
    endif
endfunc


command! -nargs=+ -bang CSSFind call <SID>CSSFind("<bang>", <f-args>)

