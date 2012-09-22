"---------------------------------------------------"
" Window Movement Mappings for Vim                  "
" Author: Niklas Lindström <lindstream@gmail.com>   "
"---------------------------------------------------"

" NOTE: Fixes annoying limit in Vim arrow movement (h and l works fine)
nnoremap <C-W><C-Left> <C-W><Left>
nnoremap <C-W><C-Right> <C-W><Right>

" NOTE: Commented since <Tab> also overrode <C-I> which is used for jumplist
" navigation. Also, Shift-modifier mappings with these keys didn't work for
" (certain) Carbon GVim versions on OS X.
"map <Tab> <C-W>w<C-W>_
"map <S-Tab> <C-W>W<C-W>_
"map <C-Tab> <C-W>l<C-W>\|
"map <C-S-Tab> <C-W>h<C-W>\|

" NOTE: currently removed in favour of 'smarter' movement below
"nnoremap <C-S-Down> <C-W><Down><C-W>_
"nnoremap <C-S-Up> <C-W><Up><C-W>_
"nnoremap <C-S-Left> <C-W><Left><C-W>\|
"nnoremap <C-S-Right> <C-W><Right><C-W>\|

set winwidth=1 " NOTE: makes the window flipping fit better with this plugin
func! WinFlip(dir)
    if a:dir == 'j' || a:dir == 'k'
        let revdir = 'k'
        let sizer = '_'
        let size = winheight(0)
    else
        let revdir = 'h'
        let sizer = '|'
        let size = winwidth(0)
    endif
    if a:dir == 'j' || a:dir == 'l'
        let old_winwidth = &winwidth | let &winwidth = &winminwidth
        let old_winheight = &winheight | let &winheight = &winminheight
        exec "wincmd ".a:dir
        if a:dir == 'l'
            let swapsize = winwidth(0)
        else
            let swapsize = winheight(0)
        endif
        exec "wincmd ".revdir
        exec swapsize."wincmd ".sizer
        exec "wincmd ".a:dir
        " if 'real' swapsize was 0 we lost one, set 'real' size
        exec size."wincmd ".sizer
        let &winwidth = old_winwidth | let &winheight = old_winheight
    else
        exec "wincmd ".a:dir
        exec size."wincmd ".sizer
    endif
endfunc


" Jump to filename using :sb and resize that window to the size of this
func! WinJump(...)
    let w = winheight(0)
    let h = winwidth(0)
    if a:0 == 1
        exec "sb ".a:1
    else
        wincmd p
    endif
    exec w."wincmd _"
    exec h."wincmd |"
endfunc
command! -complete=buffer -nargs=? Jump call WinJump(<f-args>)


" NOTE: disable if this has unwanted side-effects..
nnoremap <M-Down> <C-W>j
nnoremap <M-Up>  <C-W>k
nnoremap <M-Left> <C-W>h
nnoremap <M-Right> <C-W>l
nnoremap <M-S-Down> :call WinFlip('j')<Enter>
nnoremap <M-S-Up>  :call WinFlip('k')<Enter>
nnoremap <M-S-Left> :call WinFlip('h')<Enter>
nnoremap <M-S-Right> :call WinFlip('l')<Enter>

" NOTE: these used to be mapped to the WinFlip commands who now use <M-S-*>
nnoremap <C-S-Down> <C-W>-
nnoremap <C-S-Up> <C-W>+
nnoremap <C-S-Left> <C-W><
nnoremap <C-S-Right> <C-W>>


"map  <C-W>_
"map  <C-W>\|
nnoremap <C-W>\ <C-W>_<C-W>\|
"map <C-O> <C-W>=

"map <C-CR> <C-W>w
"map <C-S-CR> <C-W>W

" EOF
