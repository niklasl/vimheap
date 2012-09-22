" Vim filetype plugin for JavaScript
" Language: JavaScript/ECMAScript
" Author: Niklas Lindström <mailto:lindstream@gmail.com>
" Last Change: 2005-04-21

exec "set dictionary+=".expand("<sfile>:h:h:h")."/dictionaries/DOM.txt"

compiler jslint

"======== ABBREVIATIONS ========
" NOTE: these use a generic mapping to force expansions of abbrevs ending
" with "__IABBREV" - see $HOME/.vim/plugin/abbrs_maps.vim

"ia <buffer> jsfor__IABBREV <BS><Esc>F;Byt;ifor (var <Esc>f;i=0<Esc>lwi <Esc>hpwba <<Esc>Ea.length; <Esc>pa++) {}<Esc>
inorea <buffer> f__IABBREV function () {}<Esc>
inorea <buffer> fu__IABBREV function () {<CR>}<Esc>k_f(h
inorea <buffer> class__IABBREV function SomeClass() {<CR>}<CR>SomeClass.prototype = {<CR>};<Esc>3k_fS

inorea <buffer> for__IABBREV for (var i=0, l=LIST, ln=l.length; i < ln; i++) {<CR>var it = l[i];<CR>}<Esc>kk_fL
inorea <buffer> jsfor__IABBREV for (var l=LIST, it=null, i=0; it=l[i++];) {<CR>}<Esc>k_fL

inorea <buffer> proto__IABBREV <BS><Esc>Yp<Up>Ifunction <Esc>A()<CR>{<CR>}<Esc><CR>A.prototype = {<CR>};<Esc><Up><Up>

inoreabbrev q__IABBREV $()<Left>

" EOF
