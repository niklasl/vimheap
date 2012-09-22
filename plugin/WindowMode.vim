"---------------------------------------------------"
" Window Mode for Vim                               "
" Author: Niklas Lindström <lindstream@gmail.com>   "
"---------------------------------------------------"

"----------------------------------------------------------------------------------
" <C-W>m starts WindowMode, in which the following keys have special meaning:
"
"   _           like <C-W>_ - maximizes current window height
"   |           like <C-W>| - maximizes current window width
"   =           like <C-W>= - equalizes all window sizes
"   +           like <C-W>+ - increases current window height by 1
"   -           like <C-W>- - decreases current window height by 1
"   >           like <C-W>> - increases current window width by 1
"   <           like <C-W>< - decreases current window width by 1
"   <Up>
"   <Down>
"   <Left>
"   <Right>
"   [...]       many (though not all) other <C-W>[...] equivalents
"
"   <S-[Up|Down|Left|Right]>
"               maximize current (in move axis) while moving
"   <Space>     leaves WindowMode AND maximizes both current window hegiht and width
"   <Esc>       leaves WindowMode immediately
"   <C-W>m                -||-
"   <Enter>               -||-
"
"----------------------------------------------------------------------------------

let s:windowmode = 0

func! s:WindowMode()

    if s:windowmode == 0

        let s:windowmode = 1

        let s:old_winwidth = &winwidth
        set winwidth=1
        let s:old_winheight = &winheight
        set winheight=1
        "let s:old_statusline = &statusline
        "set statusline=%<%f\ %h%m%r\ %([--\ WINDOW\ MODE\ --]%)%=%-14.(%l,%c%V%)\ %P

        " Maximise window
        "wincmd =

        " Opening and closing a window
        " NOT USED


        " Moving cursor to other windows
        noremap <Down>              <C-W><Down>
        noremap j                   <C-W>j
        noremap <Up>                <C-W><Up>
        noremap k                   <C-W>k
        noremap <Left>              <C-W><Left>
        noremap <BS>                <C-W><BS>
        noremap h                   <C-W>h
        noremap <Right>             <C-W><Right>
        noremap l                   <C-W>l
        noremap w                   <C-W>w
        noremap W                   <C-W>W
        noremap t                   <C-W>t
        noremap b                   <C-W>b
        noremap p                   <C-W>p
        noremap P                   <C-W>P

        " maximize current (in move axis) while moving
        noremap <S-Down>            <C-W><Down><C-W>_
        noremap <S-Up>              <C-W><Up><C-W>_
        noremap <S-Left>            <C-W><Left><C-W>\|
        noremap <S-Right>           <C-W><Right><C-W>\|

        " Moving windows around
        noremap r                   <C-W>r
        noremap R                   <C-W>R
        noremap x                   <C-W>x
        noremap K                   <C-W>K
        noremap J                   <C-W>J
        noremap H                   <C-W>H
        noremap L                   <C-W>L

        " Window resizing
        noremap =                   <C-W>=
        noremap -                   <C-W>-
        noremap +                   <C-W>+
        noremap _                   <C-W>_
        noremap <                   <C-W><
        noremap >                   <C-W>>
        noremap \|                  <C-W>\|

        " TODO: make a function to control map/unmap-to-old (like this) for
        " everything here!
        " maximize current and exit
        let s:old_spacemap = maparg('<Space>', 'n')
        nnoremap <Space>            <C-W>_<C-W>\|:call <SID>WindowMode()<CR>

        " exit as is
        nnoremap <Esc>              :call <SID>WindowMode()<CR>
        " TODO: this too?
        nnoremap <Enter>            :call <SID>WindowMode()<CR>

        echo "WindowMode ON"
    else
        let s:windowmode = 0

        let &winwidth = s:old_winwidth
        let &winheight = s:old_winheight
        "let &statusline = s:old_statusline

        unmap <Down>
        unmap j
        unmap <Up>
        unmap k
        unmap <Left>
        unmap <BS>
        unmap h
        unmap <Right>
        unmap l
        unmap w
        unmap W
        unmap t
        unmap b
        unmap p
        unmap P

        nunmap <S-Down>
        nunmap <S-Up>
        nunmap <S-Left>
        nunmap <S-Right>

        unmap r
        unmap R
        unmap x
        unmap K
        unmap J
        unmap H
        unmap L

        unmap =
        unmap -
        unmap +
        unmap _
        unmap <
        unmap >
        unmap \|

        "nunmap <Space>
        if s:old_spacemap != ""
            exe 'nnoremap <Space> '.s:old_spacemap
        endif
        nunmap <Esc>
        nunmap <Enter>

        echo "WindowMode OFF"
    endif

endfunc

command! -nargs=0 WindowMode call <SID>WindowMode()
nnoremap <C-W>m :WindowMode<CR>
" Bonus: also triggers WindowMode:
nnoremap <C-W><C-M> :WindowMode<CR>
" And this triggers *plus* exposé!
nnoremap <C-W><Space> :exec "WindowMode"<Bar>wincmd =<CR>
nnoremap <C-W><C-Space> :exec "WindowMode"<Bar>wincmd =<CR>

" EOF
