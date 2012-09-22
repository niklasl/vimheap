" Use asterisks as 'comments', so that we can nicely text-wrap
" bulleted lists.
"
" Map Q (normally goes to ex command) to reformat-this-paragraph.
"
" Then you can just Q-Q-Q-Q down the page to clean up the STx.

noremap Q gqap
set comments=fb:*

" Personal preference settings: how much tabstop and do you want tabs?
" 
set ts=4
set et
set sw=4

" Automatically wrap at 76 line for neatness
" 
set tw=76

" Map [[ and ]] to previous/next wiki comment
"
noremap [[ ?<hr><b>\S\+, 20<CR>:set nohlsearch<CR>
noremap ]] /<hr><b>\S\+, 20<CR>:set nohlsearch<CR>
