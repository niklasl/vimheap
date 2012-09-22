"-------------------------------------------------------"
" Simple Abbreviations, Mappings, Commands for Vim      "
" Author: Niklas Lindström <lindstream@gmail.com>       "
"-------------------------------------------------------"

" define special key for <Leader> mappings (default is '\')
"let mapleader = '§'
" FIXME: seems broken; works sometimes when used interactively..

" ---- for normal mode ----

" strip trailing whitespace (and return to start-position)
noremap <Leader>tw :%s/\s\+$//g<CR>``:noh<CR>

" spacious newline - new lines above and below
inoremap ^<CR> <Left><Right><ESC>O<ESC><Down>o<ESC><Up>A

" give a custom <tag > an endtag one line below:
inoremap ^/ <ESC>T<yt>o</<ESC>pF<EylD"0pa>

" open or close quickfix window
"nnoremap <F3> :botright cwindow<CR>
nnoremap <F3> :if &buftype == "quickfix"<Bar>cclose<Bar>else<Bar>botright copen<Bar>endif<CR>

" make and opt. errors
nnoremap <S-F3> :silent make <Bar> botright cwindow<CR>

" toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" toggle TagList
nnoremap <F4> :Tlist<CR>

" refresh view on ESC in Normal Mode
" NOTE: this version breaks console vim (arrow keys):
" #nnoremap <ESC> <C-L><ESC>
" do :noh and refresh view
nnoremap <silent> <F5> :noh<CR><C-L>
nnoremap <silent> <leader>n :noh<cr><c-l>

" prev/next fold
noremap <C-k> [z
noremap <C-j> ]z

" -- additional edit commands --
" Require: surround.vim (the ones using nmap)

" "Delete Call": delete function calls but leave parameters
nmap dc ebdt(ds)
" delete parens of call
nnoremap dC f(%x``r<Space>b

" "Delete Lisp": delete list-style function calls
nnoremap dl F(%x``xdw=``
" "Lisp-Surround"
nmap sl vi)s)<Esc>ha<Space><Esc>gv=gvo<Esc>i


" ---- for insert/command/replace mode (lang modes) ----

" generic mapping to force expansions of abbrevs ending with "__IABBREV"
"noremap! <C-CR> __IABBREV
map! <C-CR> __IABBREV<C-]>
" NOTE: <C-Space> is generally used for code assist, and this isn't the same
"map! <C-Space> __IABBREV<C-]>

" expand current date and time
abbrev dtime__IABBREV <c-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>
abbrev ztime__IABBREV <c-r>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>
abbrev date__IABBREV <c-r>=strftime("%Y-%m-%d")<CR>
abbrev time__IABBREV <c-r>=strftime("%H:%M:%S")<CR>
abbrev modtime__IABBREV <c-r>=strftime("%Y-%m-%d %H:%M:%S", getftime(expand("%")))<CR>
" more compact versions
abbrev sdtime__IABBREV <c-r>=strftime("%y%m%d_%H%M%S")<CR>
abbrev sdate__IABBREV <c-r>=strftime("%y%m%d")<CR>
abbrev stime__IABBREV <c-r>=strftime("%H%M%S")<CR>
" URI path versions
abbrev pdate__IABBREV <c-r>=strftime("%Y/%m/%d")<CR>

" expand current %
abbrev fhere__IABBREV <c-r>=expand("%")<nl>
" expand current filename
abbrev fname__IABBREV <c-r>=expand("%:p:t")<nl>
" expand current filepath
abbrev fpath__IABBREV <c-r>=expand("%:p")<nl>
" expand current filedir
abbrev fdir__IABBREV <c-r>=expand("%:p:h")<nl>
" expand current folder
abbrev folder__IABBREV <c-r>=expand("%:p:h:t")<nl>
" expand current 'logical' root name
abbrev rname__IABBREV <c-r>=expand("%:t:r")<nl>
" create backup name for filename
abbrev fbak__IABBREV <c-r>=expand("%:t:r")."-bak".strftime("%y%m%d").".".expand("%:e")<nl>
abbrev fbak2__IABBREV <c-r>=expand("%:t:r")."-bak_".strftime("%y%m%d_%H%M").".".expand("%:e")<nl>
abbrev start__IABBREV start<c-r>=strftime("%y%m%d")<CR>

" replace allbackslashes on current line with slashes (mad mapping)
ia slall__IABBREV <BS><Esc>:s#\\#/#g<CR>

" generic C-style code blocks (for C, Java etc)
inoreabbrev fun__IABBREV <BS>()<CR>{<CR>}<Esc>O
inoreabbrev br__IABBREV {<CR>}<Esc>O
inoreabbrev ibr__IABBREV {}<Left>
inoreabbrev sbr__IABBREV <Esc>kA {<Esc>jo}
inoreabbrev brb__IABBREV {<Esc>}o}<Esc>=%
inoreabbrev else__IABBREV else {<CR>}<Esc>O

" common coding idioms
inoreabbrev t__IABBREV TODO
inoreabbrev f__IABBREV FIXME
inoreabbrev el__IABBREV ${}<Left>
inoreabbrev hx__IABBREV #{}<Left>
inoreabbrev be__IABBREV {{  }}<Left><Left><Left>
inoreabbrev bif__IABBREV {% if  %}<CR>{% endif %}<Esc><Up>_ffla
inoreabbrev bfor__IABBREV {% for  in %}<CR>{% endfor %}<Esc><Up>_frla
inoreabbrev pb__IABBREV <? ?><Left><Left><Left>
inoreabbrev ab__IABBREV <%  %><Left><Left><Left>
inoreabbrev blco__IABBREV /* {{{ */<CR>/* }}} */
inoreabbrev snip__IABBREV -- 8< --<CR>-- >8 --<Esc>O

" for shell stuff
inoreabbrev shdate__IABBREV $(date "+%y%m%d_%H%M")

" misc shortcuts
inoreabbrev btt__IABBREV ````<Left><Left>


" ---- command mode only ----

cnoreabbrev clip__IABBREV let @* = expand("%")<Left><Left>
cnoreabbrev sess__IABBREV exec "mksession! ".v:this_session
cnoreabbrev su__IABBREV %!sort <Bar> uniq
cnoreabbrev iconv__IABBREV %!iconv -f utf-8 -t ascii --unicode-subst="\\u\%04x"
cnoreabbrev ucode__IABBREV %!python -c 'import sys; s = sys.stdin.read(); sys.stdout.write(eval("u\"\"\""+s+"\"\"\"").encode("utf-8"))'
cnoreabbrev fg__IABBREV %!find . -name '*' <Bar> xargs grep ''<Left>
cnoreabbrev awk__IABBREV %!awk 'BEGIN{} { print $0 }'
cnoreabbrev curl__IABBREV %!curl -s -L -HAccept:application/rdf+xml<Space>

" jump-to-vimgrep search
cnoremap <C-S> <C-B><Right><Right><Right><Right><Right><Right><Right><Right><Right>
" last-vimgrep and -||-
cnoremap <C-G> vimgrep<UP><C-B><Right><Right><Right><Right><Right><Right><Right><Right><Right>
" vimgrep semi-prepared
cnoreabbrev vg__IABBREV vimgrep //j **/*<Left><Left><Left><Left><Left><Left><Left>
" vimgrep for 'resource'
cnoreabbrev rg__IABBREV vimgrep /<c-r>=expand("%:t:r")<nl>/j **/*.<c-r>=expand("%:t:e")<nl>
" vimgrep for search
cnoreabbrev sg__IABBREV vimgrep /<c-r>//j **/*.<c-r>=expand("%:t:e")<nl>
" vimgrep for 'cword'
cnoreabbrev cg__IABBREV vimgrep /<c-r>=expand("<cword>")<nl>/j **/*.<c-r>=expand("%:t:e")<nl>
" vimgrep for 'CWORD'
cnoreabbrev Cg__IABBREV vimgrep /<c-r>=expand("<cWORD>")<nl>/j **/*.<c-r>=expand("%:t:e")<nl>
" vimgrep for maven test reports
cnoreabbrev tg__IABBREV vimgrep /Failures: [^0]\\|Errors: [^0]/j **/target/*reports/*.txt

" todo and related search mapping
cnoreabbrev todo__IABBREV TODO\\|FIXME
cnoreabbrev dev__IABBREV TODO\\|FIXME\\|DEBUG\\|\\<print\\>\\|\\<println\\>
inoreabbrev do__IABBREV #DO_<C-R>=strftime("%s")<CR>{{{<CR>#}}}<ESC>k_

" my special "manual scripting" process macro
cnoreabbrev brainscript__IABBREV let @a = '0f$wvg_"*yI#'
cnoreabbrev brainscript2__IABBREV let @a = '0f$wvg_"*yj'
" and for "from vim command notes"
cnoreabbrev vimc__IABBREV let @a = '0f:wyg_j:"'


" ---- Mac (at least OS X) related mappings ----

map! <D-CR> __IABBREV<C-]>
map <D-7> \
map! <D-7> \
map <D-8> {
map <D-9> }
map! <D-8> {
map! <D-9> }

" Open URL in browser
if has("mac")
    nnoremap <C-CR> _f>bvi>"ly:silent !open "<C-R>l"<CR>
endif

" Copy URI under cursor to system clipboard and prepare to open
nnoremap <D-u> 0f<vi<"*y:silent !open <C-R>*

" ---- text-object stuff (built-in in Vim 7) ----
" Quote motions for operators: da" will delete a quoted string.
if version < 700
    " From Vim tip 956:
    omap i" :normal vT"ot"<CR>
    omap a" :normal vF"of"<CR>
    omap i' :normal vT'ot'<CR>
    omap a' :normal vF'of'<CR>
    " From Vim script 72: TODO: Save and restore the search history
    vmap i" ?"<CR>/.<CR>o/"<CR>?.<CR><Esc>:noh<CR>gv
    vmap i' ?'<CR>/.<CR>o/'<CR>?.<CR><Esc>:noh<CR>gv
    vmap a" ?"<CR>o/"<CR><Esc>:noh<CR>gv
    vmap a' ?'<CR>o/'<CR><Esc>:noh<CR>gv
endif


