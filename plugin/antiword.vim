" Setup vim to view Ms-Word documents, requires antiword
" From tip: <http://www.vim.org/tips/tip.php?tip_id=918>
" Antiword from: <http://www.winfield.demon.nl/>

autocmd BufReadPre *.doc set ro
"autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPre *.doc set buftype=nowrite
autocmd BufReadPost *.doc echo "Filtering through antiword"
autocmd BufReadPost *.doc %!antiword "%"

" EOF
