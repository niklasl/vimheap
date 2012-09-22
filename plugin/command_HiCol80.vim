" From Vim Tip: <http://vim.wikia.com/wiki/Highlight_text_beyond_80_columns>

"highlight link Near80ColLimit WarningMsg
"highlight link Over80ColLimit Error
highlight link Over80ColLimit CursorLine

func! HiCol80()
    " any text in cols 73 .. 80
    "2match Near80ColLimit /\%<81v.\%>73v/
    " everything over 81 cols
    match Over80ColLimit /\%81v.*/
endfunc

command! HiCol80 call HiCol80()

