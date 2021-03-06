" Vim Toggle Plugin
"
" Author: Timo Teifel
" Email: timo at teifel-net dot de
" Version: 0.3
" Date: 06 Feb 2004
" Licence: GPL v2.0
"
" Usage:
" Drop into your plugin directory, Pressing Control-Shift-T toggles
" value under cursor. Currently known values are:
" 
"  true     <->     false
"  on       <->     off
"  yes      <->     no
"  +        <->     -
"  >        <->     <
"  define   <->     undef
"
"  If cursor is positioned on a number, the function looks for a + 
"  or - sign in front of that number and toggels it. If the number
"  doesn't have a sign, one is inserted (- of course).
"
"  On unknown values, nothing happens.
"
" Thanks: 
" - Christoph Behle, who inspired me to write this
" - the Vim Documentation ;)
"
" Todo:
" - visual mode is cancelled when pressing <C-T> so that
"   the function works... is there something better to do
"   in visual mode?
"
" Changelog:
" NL: 17 Feb 2004 - extracted word toggle to GetAltWord; added uppercase and title options there
" v0.3, 6 Feb 2004
"   - I realised that <S-C-T> ignores the Shift Key. I couldn't
"     find a way to use <S-C-T> and now I use <C-T>
"   - added words: define/undef
"   - when in visual mode, send <ESC> so that the function works
" v0.2, 3 Feb 2004
"   - added number and sign support
"   - fixed end-of-line bug
" v0.1, 1 Feb 2004
"   - first Version to be distributed... (not yet on vim.org)

if exists("loaded_toggle")
    finish
endif
let loaded_toggle=1

let s:save_cpo = &cpo
set cpo&vim

" NL: changed mappings {{{
nnoremap <D-k> :call Toggle()<CR>
inoremap <D-k> <C-O>:call Toggle()<CR>
nnoremap <Leader>k :call Toggle()<CR>
" NOTE: see :help 'macmeta' for how to make these work in MacVim:
nnoremap <M-k> :call Toggle()<CR>
inoremap <M-k> <C-O>:call Toggle()<CR>
" }}}

"--------------------------------------------------
" If you don't want to break the standard <C-T> assignments,
" you could use these, or of course define your own ones...
"
" imap <C-M-T> <C-O>:call Toggle()<CR>
" nmap <C-M-T> :call Toggle()<CR>
" vmap <C-M-T> <ESC>:call Toggle()<CR>
"-------------------------------------------------- 

" some Helper functions {{{
function! s:Toggle_changeChar(string, pos, char)
  return strpart(a:string, 0, a:pos) . a:char . strpart(a:string, a:pos+1)
endfunction

function! s:Toggle_insertChar(string, pos, char)
  return strpart(a:string, 0, a:pos) . a:char . strpart(a:string, a:pos)
endfunction

function! s:Toggle_changeString(string, beginPos, endPos, newString)
  return strpart(a:string, 0, a:beginPos) . a:newString . strpart(a:string, a:endPos+1)
endfunction
" }}}

function! Toggle() "{{{
    " save values which we have to change temporarily:
    let s:lineNo = line(".")
    let s:columnNo = col(".")

    " Gather information needed later
    let s:cline = getline(".")
    let s:charUnderCursor = strpart(s:cline, s:columnNo-1, 1)

    let s:toggleDone = 0
    " 1. Check if the single Character has to be toggled {{{
    if (s:charUnderCursor == "+")
        execute "normal r-"
        let s:toggleDone = 1
    elseif (s:charUnderCursor == "-")
        execute "normal r+"
        let s:toggleDone = 1
    elseif (s:charUnderCursor == "<")
        execute "normal r>"
        let s:toggleDone = 1
    elseif (s:charUnderCursor == ">")
        execute "normal r<"
        let s:toggleDone = 1
    endif " }}}

    " 2. Check if cursor is on an number. If so, search & toggle sign{{{
    if (s:toggleDone == 0)
        if (match(s:charUnderCursor, "\\d") == 0)
            " is a number!
            " search for the sign of the number
            let s:colTemp = s:columnNo-1
            let s:foundSpace = 0
            while ((s:colTemp >= 0) && (s:toggleDone == 0))
                let s:cuc = strpart(s:cline, s:colTemp, 1)
                if (s:cuc == "+")
                    let s:ncline = s:Toggle_changeChar(s:cline, s:colTemp, "-")
                    call setline(s:lineNo, s:ncline)
                    let s:toggleDone = 1
                elseif (s:cuc == "-")
                    let s:ncline = s:Toggle_changeChar(s:cline, s:colTemp, "+")
                    call setline(s:lineNo, s:ncline)
                    let s:toggleDone = 1
                elseif (s:cuc == " ")
                    let s:foundSpace = 1
                    let s:spacePos = s:colTemp
                elseif (match(s:cuc, "\\s") < 0 && s:foundSpace == 1)
                    " space already found earlier, now there's something other
                    " than space
                    " -> the number didn't have a sign. insert - and keep a space
                    let s:ncline = s:Toggle_changeChar(s:cline, s:spacePos, " -")
                    call setline(s:lineNo, s:ncline)
                    let s:toggleDone = 1
                elseif (match(s:cuc, "\\d") < 0 && match(s:cuc, "\\s") < 0)
                    " any non-digit, non-space character -> insert a - sign
                    let s:ncline = s:Toggle_insertChar(s:cline, s:colTemp+1, "-")
                    call setline(s:lineNo, s:ncline)
                    let s:toggleDone = 1
                endif
                let s:colTemp = s:colTemp - 1
            endwhile
            if (s:toggleDone == 0)
                " no sign found. insert at beginning of line:
                let s:ncline = "-" . s:cline
                call setline(s:lineNo, s:ncline)
                let s:toggleDone = 1
            endif
        endif " is a number under the cursor?
    endif " toggleDone?}}}

    " 3. Check if complete word can be toggled {{{
    if (s:toggleDone == 0)

        " find beginning of word {{{
        let s:colTemp = s:columnNo-1
        let s:startOfWord = 0 " in case it's the first word
        while (s:colTemp >= 0)
            let s:cuc = strpart(s:cline, s:colTemp, 1)
            if (match(s:cuc, "\\a") < 0) 
                let s:startOfWord = s:colTemp+1
                let s:colTemp = -1 " to exit while loop
            endif
            let s:colTemp = s:colTemp - 1
        endwhile " }}}

        " find end of word {{{
        let s:colTemp = s:columnNo-1
        while (s:colTemp <= strlen(s:cline))
            let s:cuc = strpart(s:cline, s:colTemp, 1)
            if (match(s:cuc, "\\a") < 0) 
                let s:endOfWord = s:colTemp
                let s:colTemp = strlen(s:cline)+1 " to exit while loop
            endif
            let s:colTemp = s:colTemp + 1
        endwhile " }}}


        let s:wordUnderCursor = strpart(s:cline, s:startOfWord, s:endOfWord-s:startOfWord)

        " NL TODO: beautify test sequence
        let s:case = 0
        let s:changedWord = s:wordUnderCursor
        while s:case < 15
            let s:case += 1
            if s:case == 1
                let s:changedWord = GetAltWord(s:wordUnderCursor, "true", "false", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 2
                let s:changedWord = GetAltWord(s:wordUnderCursor, "on", "off", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 3
                let s:changedWord = GetAltWord(s:wordUnderCursor, "yes", "no", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 4
                let s:changedWord = GetAltWord(s:wordUnderCursor, "define", "undef", 'u')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 5
                let s:changedWord = GetAltWord(s:wordUnderCursor, "first", "last", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 6
                let s:changedWord = GetAltWord(s:wordUnderCursor, "top", "bottom", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 7
                let s:changedWord = GetAltWord(s:wordUnderCursor, "before", "after", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 8
                let s:changedWord = GetAltWord(s:wordUnderCursor, "right", "left", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 9
                let s:changedWord = GetAltWord(s:wordUnderCursor, "up", "down", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 10
                let s:changedWord = GetAltWord(s:wordUnderCursor, "begin", "end", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 11
                let s:changedWord = GetAltWord(s:wordUnderCursor, "start", "stop", 'u', 't')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 12
                let s:changedWord = GetAltWord(s:wordUnderCursor, "get", "post", 'u')
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 13
                let s:changedWord = GetAltWord(s:wordUnderCursor, "assertTrue", "assertFalse")
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            elseif s:case == 14
                let s:changedWord = GetAltWord(s:wordUnderCursor, "width", "height")
                if s:changedWord != s:wordUnderCursor
                    let s:toggleDone = 1
                    break
                endif
            endif
        endwhile
        let s:wordUnderCursor = s:changedWord
        echo s:wordUnderCursor


        "if (s:wordUnderCursor == "true")
        "    let s:wordUnderCursor = "false"
        "    let s:toggleDone = 1
        "elseif (s:wordUnderCursor == "false")
        "    let s:wordUnderCursor = "true"
        "    let s:toggleDone = 1

        "elseif (s:wordUnderCursor == "on")
        "    let s:wordUnderCursor = "off"
        "    let s:toggleDone = 1
        "elseif (s:wordUnderCursor == "off")
        "    let s:wordUnderCursor = "on"
        "    let s:toggleDone = 1

        "elseif (s:wordUnderCursor == "yes")
        "    let s:wordUnderCursor = "no"
        "    let s:toggleDone = 1
        "elseif (s:wordUnderCursor == "no")
        "    let s:wordUnderCursor = "yes"
        "    let s:toggleDone = 1

        "elseif (s:wordUnderCursor == "define")
        "    let s:wordUnderCursor = "undef"
        "    let s:toggleDone = 1
        "elseif (s:wordUnderCursor == "undef")
        "    let s:wordUnderCursor = "define"
        "    let s:toggleDone = 1
        "endif

        " if wordUnderCursor is changed, set the new line
        if (s:toggleDone == 1)
            let s:ncline = s:Toggle_changeString(s:cline, s:startOfWord, s:endOfWord-1, s:wordUnderCursor)
            call setline(s:lineNo, s:ncline)
        endif

    endif " toggleDone?}}}
    
    "restore saved values
    call cursor(s:lineNo,s:columnNo)
endfunction " }}}


" NL: new function for word toggle
function! GetAltWord(current, val, opp, ...) "{{{
    if (a:current == a:val)
        return a:opp
    elseif (a:current == a:opp)
        return a:val
    else
        if exists("a:1") && a:1 == 'u' "upper case variant
            let s:val = substitute(a:val, ".*", "\\U\\0", "")
            let s:opp = substitute(a:opp, ".*", "\\U\\0", "")
            let s:changed = GetAltWord(a:current, s:val, s:opp)
            if s:changed != a:current
                return s:changed
            elseif exists("a:2") && a:2 == 't' " title case variant
                let s:val = substitute(a:val, "^.", "\\U\\0", "")
                let s:opp = substitute(a:opp, "^.", "\\U\\0", "")
                return GetAltWord(a:current, s:val, s:opp) " if no change, returns current
            endif
        else
            return a:current
        endif
    endif
endfunction " }}}


let &cpo = s:save_cpo
" vim:fdm=marker commentstring="%s
