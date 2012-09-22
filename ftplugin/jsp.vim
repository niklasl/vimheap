" Vim filetype plugin
" Language: JSP
" Author: <lindstream AT gmail.com>
" Last Change: 2005-09-26

" Re-use html ftplugin(s)
" WARNING: currently this is safe since it only contains mappings. If this
" changes it is wise to extract those to a 'mappings.vim' and source that
runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

" Re-use xml ftplugin(s)
runtime! ftplugin/xml.vim ftplugin/xml_*.vim ftplugin/xml/*.vim

" Abbreviations
inoreabbrev <buffer> el__IABBREV ${}<Left>
inoreabbrev <buffer> val__IABBREV value="${}"<Left><Left>
inoreabbrev <buffer> tes__IABBREV test="${}"<Left><Left>

" EOF
