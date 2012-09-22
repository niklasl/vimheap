"-----------------------------------------------------------"
" Vim script: fs_commands.vim                               "
" About:    file system related commands                    "
" Author:   Niklas Lindström <lindstream@gmail.com>         "
"-----------------------------------------------------------"



func! RenameTo(newfpath)
    let curfpath = expand("%")
    let newfpath = a:newfpath
    if fnamemodify(a:newfpath, ":p:h") == getcwd()
      let newfpath = expand("%:p:h") ."/". newfpath
    endif
    if (!filereadable(newfpath))
        let dirpath = fnamemodify(newfpath, ":p:h")
        if (!isdirectory(dirpath))
            call mkdir(dirpath, "p")
        endif
        call rename(curfpath, newfpath)
        if version >= 600
            exec "saveas! ".newfpath
        else
            exec "edit ".newfpath
        endif
        exec "bwipe ".curfpath
        cd .
    else
        echo "that file already exists!"
    endif
endfunc

command! -nargs=1 -complete=file RenameTo call RenameTo(<f-args>)


command! CD cd %:p:h
command! LCD lcd %:p:h
" NOTE: E and SP will only work properly if there is a plugin in use to handle
" directory browswing, such as explorer.vim or netrw.vim (from autumn -04..)
command! E edit %:p:h
command! SP split %:p:h


func! OpenCWD(bang)
    if has("gui_running") || a:bang == "!"
        if has("mac") && has("unix")
            !open %:p:h
        elseif executable("konqueror") " has('gui_kde')
            !konqueror %:p:h &
        elseif executable("nautilus") " has('gui_gtk')
            !nautilus %:p:h &
        elseif has("win32")
            let s:stored_shellslash = &shellslash
            set noshellslash
            !start explorer.exe %:p:h
            let &shellslash = s:stored_shellslash
        endif
    endif
endfunc

command! -bang OpenCWD silent call OpenCWD("<bang>")


func! Terminal()
    if has("mac") && has("unix")
        !osascript -e 'tell application "Terminal.app" to do script "cd " & quoted form of "%:p:h"'
        !osascript -e 'tell application "Terminal.app" to tell its front window to activate'
    endif
    " TODO: support for more platforms (at least gnome on linux!)
endfunc

command! Terminal silent call Terminal()


if has("mac") && has("unix")
    func! ITunesArgs(A,L,P)
        return "pause\nplay\nnext track\nprevious track\nset sound volume to 50"
    endfunc
    func! s:ITunes(action)
        exec "!osascript -e 'tell application \"iTunes\" to " . a:action . "'"
    endfunc
    command! -complete=custom,ITunesArgs -nargs=? ITunes :call <SID>ITunes(<f-args>)
endif

