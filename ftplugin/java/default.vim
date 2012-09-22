
"==== Editing options ====

"setlocal tabstop=8
setlocal softtabstop=4

setlocal foldmethod=marker
setlocal foldmarker={,}
" NOTE: SEE ALSO .vim/after/syntax/...


"==== Special options ====

compiler maven2


"==== Include options ====
" setting path like this allows for recursive searches is subdirs. Might be
" expensive if cwd is much shallower than the src dir.
"This option can also be used to point to bases of various stdlibs!
set path+=.**
" Seems that include doesn't need to be set..
"set include=^\s*import
"set includeexpr=substitute(v:fname,'\\.','/','g')
" only replace dots preceded by 'package', i.e. names starting with lowercase
set includeexpr=substitute(v:fname,'\\(\\<\\l\\w*\\)\\.','\\1/','g')


"==== Syntax highlighting options ====
let java_highlight_java_lang_ids=1
let java_highlight_all=1
let java_highlight_functions="style"
let java_highlight_debug=1
let java_ignore_javadoc=0

let java_minlines = 50


"======== ABBREVIATIONS ========
" NOTE: these use a generic mapping to force expansions of abbrevs ending
" with "__IABBREV" - see $HOME/.vim/plugin/abbrs_maps.vim
" Some also depend on the specifict indent defined for Java

inorea <buffer> a__IABBREV abstract<Space>
inorea <buffer> p__IABBREV public<Space>
inorea <buffer> pi__IABBREV private<Space>
inorea <buffer> po__IABBREV protected<Space>
inorea <buffer> st__IABBREV static<Space>
inorea <buffer> fi__IABBREV final<Space>
inorea <buffer> psf__IABBREV public static final<Space>
inorea <buffer> v__IABBREV void<Space>
inorea <buffer> ext__IABBREV extends
inorea <buffer> sync__IABBREV synchronized
inorea <buffer> class__IABBREV public class  {<CR>}<Esc><Up>$<Left>i
inorea <buffer> try__IABBREV try {<CR>} finally {<CR>}<Esc><Up>O
inorea <buffer> main__IABBREV public static void main(String[] args) {<CR>}<Esc>O
inorea <buffer> doc__IABBREV /**<CR><CR>/<Esc><Up>A 

inorea <buffer> g__IABBREV <Esc>Y2pjc2W<Tab>return<Esc>k_cwpublic<Esc>f;b~higet<Esc>f;C() {<Esc>jo}<Esc>
inorea <buffer> s__IABBREV <Esc>Y3pjjc2W<Tab>this.<Esc>lxywea = <Esc>pkk_dwj_c2Wpublic void<Esc>f;b~hiset<Esc>f;C() {<Esc>k_Djf(pxjo}<Esc>3kdd

"inorea <buffer> getset__IABBREV <BS><Esc>YA;<Esc>pp<Up>cepublic<Esc>ww~biget<Esc>ea() { return null; }<Esc><CR>wy2ww~biset<Esc>ea(<C-R>") {}<Esc>_c2epublic void<Esc><Up><Up>_

inorea <buffer> witer__IABBREV <BS><Esc>Iwhile (<Esc>wy$A.hasNext()) {<CR>}<Esc>O<C-R>".next();<Esc>_
inorea <buffer> fiter__IABBREV <BS><Esc>Ifor (Iterator iter = <Esc>A.iterator(); iter.hasNext();) {<CR>iter.next();<CR>}<Esc>-
inorea <buffer> thisis__IABBREV this.<C-R>" = <C-R>";


" EOF
