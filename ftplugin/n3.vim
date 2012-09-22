
"==== ABBREVIATIONS ====

" NOTE: these uses a generic mapping to force expansions of abbrevs ending
" with "__IABBREV" - see $HOME/.vim/plugin/abbrs_maps.vim

inoreabbrev <buffer> label__IABBREV rdfs:label ""@en, ""@sv

inoreabbrev <buffer> prefix__IABBREV @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .<CR>
    \@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .<CR>
    \@prefix owl:  <http://www.w3.org/2002/07/owl#> .<CR>
    \@prefix dc: <http://purl.org/dc/elements/1.1/> .<CR>

inoreabbrev <buffer> cls__IABBREV a owl:Class .
inoreabbrev <buffer> prop__IABBREV a rdfs:Property;<CR>
    \<Tab>rdfs:domain rdfs:Resource; rdfs:range rdfs:Resource .

