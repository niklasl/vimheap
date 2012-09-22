if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'jquery-tmpl'
endif

runtime! syntax/html.vim
unlet b:current_syntax

syn case match
syn include @js syntax/javascript.vim
syn region jqueryTmpl matchgroup=jqueryTmplScript start=/<script.*type="text\/x-jquery-tmpl">/ end=/<\/script>/ contains=@htmlTop,jqueryTmplTag,jqueryTmplTagWrap,jqueryTmplTagEnd,jqueryTmplTagJs
syn region jqueryTmplTag matchgroup=identifier start=/{{/ end=/}}/ contained contains=@js,jqueryTmplKeywords,jqueryTmplWrapInner,jqueryTmplIdentifier
syn region jqueryTmplTagEnd matchgroup=identifier start=/{{\// end=/}}/ contained
syn region jqueryTmplTagJs matchgroup=identifier start=/${/ end=/}/ contained contains=@js,jqueryTmplIdentifier
syn cluster htmlPreproc add=jqueryTmplTag,jqueryTmplTagEnd,jqueryTmplTagJs

syn keyword jqueryTmplKeywords html wrap each if else tmpl contained
syn keyword jqueryTmplIdentifier $index $item $value contained

hi def link jqueryTmplScript comment
hi def link jqueryTmplKeywords keyword
hi def link jqueryTmplIdentifier structure
hi def link jqueryTmplTagEnd keyword

if main_syntax == 'jquery-tmpl'
  unlet main_syntax
endif

let b:current_syntax = "jquery-tmpl"
