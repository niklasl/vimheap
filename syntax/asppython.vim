" Vim syntax file
" Language:	Active State's Python (ASP)
" Maintainer:	Aaron Hope <edh@brioforge.com>
" URL:		http://nim.dhs.org/~edh/aspperl.vim
" Last Change:	2001 Jan 15

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'asppython'
endif

runtime! syntax/html.vim
unlet b:current_syntax
exe "syn include @AspPython " . expand("$VIMRUNTIME")."/syntax/python.vim"
unlet b:current_syntax

syn cluster htmlPreproc add=AspPythonInsideHtmlTags

syn region  AspPythonInsideHtmlTags keepend matchgroup=Delimiter start=+<%=\=+ skip=+".*%>.*"+ end=+%>+ contains=@AspPython
syn region  AspPythonInsideHtmlTags keepend matchgroup=Delimiter start=+<script\s\+language="\=python"\=[^>]*>+ end=+</script>+ contains=@AspPython
