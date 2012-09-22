"------------------------------------------------"
" Mappings for simplified fold handling          "
" Author: Niklas Lindström <neuron@diatribe.nu>  "
"------------------------------------------------"


" Foldmode - mappings for easy fold-walking with the keyboard

func! Foldmode( switch )
    if a:switch == "on"
        let b:foldmode = 1
        let b:oldmodif = &modifiable

        set nomodifiable
        nnoremap + zc
        nnoremap - zo
        "nnoremap M zM
        "nnoremap R zR
        " etc..

    elseif a:switch == "off"
        if exists("b:foldmode")

            let &modifiable = b:oldmodif
            nunmap +
            nunmap -
            unlet b:oldmodif
            unlet b:foldmode
            "nunmap M
            "nunmap R
            " etc..

            unlet b:oldmodif
            unlet b:foldmode
        endif
    else
        echo "Use 'on' or 'off'"
    endif
endfunc

command! -nargs=1 Foldmode call Foldmode(<f-args>)



" Mousefold - minimal mappings for easy fold-walking with the mouse
"
func! Mousefold( switch )
    if a:switch == "on"
        let b:mousefold = 1

        nnoremap <M-LeftMouse> <LeftMouse>zo
        nnoremap <M-RightMouse> <LeftMouse>zc
        vnoremap <M-LeftMouse> <LeftMouse>zO
        vnoremap <M-RightMouse> <LeftMouse>zC

    elseif a:switch == "off"
        if exists("b:mousefold")

            nunmap <M-LeftMouse>
            nunmap <M-RightMouse>
            vunmap <M-LeftMouse>
            vunmap <M-RightMouse>

            unlet b:mousefold
        endif
    else
        echo "Use 'on' or 'off'"
    endif
endfunc

command! -nargs=1 Mousefold call Mousefold(<f-args>)


" use Mousefold by default
Mousefold on


