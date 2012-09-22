
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'aspjs'
endif

runtime! syntax/html.vim
exe "syn include @Html " . expand("$VIMRUNTIME")."/syntax/html.vim"
unlet b:current_syntax
exe "syn include @AspJS " . expand("$VIMRUNTIME")."/syntax/javascript.vim"
unlet b:current_syntax

syn cluster htmlPreproc add=AspJSInsideHtmlTags

syn region  AspJSInsideHtmlTags keepend matchgroup=Delimiter start=+<%=\=+ skip=+".*%>.*"+ end=+%>+ contains=@AspJS

syn clear javascript
" TODO: when matching script without type or with type= javascript|ecmascript
"syn region  javaScript start=+<script[^>]*>+ keepend end=+</script>+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc

