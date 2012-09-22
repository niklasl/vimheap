func! PresFold()
    set foldmethod=expr
    set foldexpr=getline(v:lnum)!~'^----'&&getline(v:lnum+1)!~'^----'
    nnoremap <Space> ]zjjjztzo
    nnoremap <S-Space> zckkk[zzt
    normal zMza
endfunc

command! -nargs=0 PresFold :call PresFold()
