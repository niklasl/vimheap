
func! s:ColorCycle(direction)
    if !exists("g:colorcycle") || !exists("g:colorcycleindex")
        echo "You must define the g:colorcycle list and g:colorcycleindex number."
        return
    endif
    if a:direction =~ '^\d+$'
        let g:colorcycleindex = a:count
    elseif a:direction == "f"
        let g:colorcycleindex += 1
    elseif a:direction == "b"
        let g:colorcycleindex -= 1
    else
        let g:colorcycleindex = a:direction
    endif
    if g:colorcycleindex >= len(g:colorcycle)
        let g:colorcycleindex = 0
    elseif g:colorcycleindex < 0
        let g:colorcycleindex = len(g:colorcycle) - 1
    end
    exec "colorscheme " . g:colorcycle[g:colorcycleindex]
endfunc

command! -nargs=1 ColorCycle :call <SID>ColorCycle("<args>")

" EOF
