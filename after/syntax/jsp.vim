
" this deactivates the folding used in after/syntax/java.vim. It's needed due to
" syntax problems with mixing java and html (I havent' figured out how to
" solve this -- if it's even possible).
"
"syn region foldBraces start=/{/ end=/}/
" Just restore to original
syn match  javaBraces  "[{}]"

" EOF
