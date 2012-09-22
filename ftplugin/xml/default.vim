" Vim filetype plugin for XML
" Language: XML
"Maintainer: Niklas Lindström
" Last Change: 2003-05-01

" TODO:
" Mappings for XML Schemas (and other recommendations from W3C?)
" make ElemWrap work with inline selections (not just line ranges)


setlocal foldmethod=syntax
let g:xml_syntax_folding = 1


"==== indent settings ====

setlocal expandtab
setlocal softtabstop=4
setlocal shiftwidth=4


" treat words concatenated with '-' as one word
setlocal iskeyword+=-
" make e.g. namespaces completable (creates other problems though)
"setlocal iskeyword+=:


compiler xmllint


" give a custom <tag > an endtag one line below:
inoremap <buffer> ^/ <ESC>T<yt>o</<ESC>pF<EylD"0pa>

" close the last tag on the line, wrapping eventual following text
inoremap ^> :s/.*<\([^ ]\+\)[^>]*>.*/&<\/\1>/ \| noh \| A


" element wrapper
func! XmlWrap(line1, line2, elemname, ...)
    if (a:0 > 0 && a:1 == 'i')
        exe "normal ".a:line1."ggI<".a:elemname.">"
        exe "normal ".a:line2."ggA</".a:elemname.">"
        exe a:line1.",".(a:line2)."normal =="
    else
        exe "normal ".a:line1."ggO<".a:elemname.">"
        exe "normal ".(a:line2+1)."ggo</".a:elemname.">"
        exe a:line1.",".(a:line2+2)."normal =="
    endif
endfunc


"######## ABBREVIATIONS ########
" NOTE: these use a generic mapping to force expansions of abbrevs ending
" with "__IABBREV" - see $HOME/.vim/plugin/abbrs_maps.vim

" Generic XML
inorea <buffer> cm__IABBREV <!--  --><Esc>F i
inorea <buffer> piiso__IABBREV <?xml version="1.0" encoding="iso-8859-1"?>
inorea <buffer> pistyle__IABBREV <?xml-stylesheet type="text/xsl" href=""?><Esc>2hi
inorea <buffer> xmllat__IABBREV <?xml version="1.0" encoding="iso-8859-1"?>
inorea <buffer> xmlutf__IABBREV <?xml version="1.0" encoding="utf-8"?>
inorea <buffer> xml__IABBREV <?xml version="1.0"?>
inorea <buffer> l__IABBREV xml:lang=""<Esc>F"a
inorea <buffer> ns__IABBREV xmlns:=""<Esc>F:a

" RDF
inorea <buffer> rdfdesc__IABBREV <rdf:Description>
inorea <buffer> abo__IABBREV rdf:about=""<Left>
inorea <buffer> res__IABBREV rdf:resource=""<Left>
inorea <buffer> parse__IABBREV rdf:parseType=""<Left>
inorea <buffer> nsrdf__IABBREV http://www.w3.org/1999/02/22-rdf-syntax-ns#
inorea <buffer> nsrdfs__IABBREV http://www.w3.org/2000/01/rdf-schema#


