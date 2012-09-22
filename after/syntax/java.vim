
" Highlight variable declarations

"syn match javaVarDecl "^\s\+\w\+\(\[\d*]\)*\s\+\zs\w\+\(\s*=\)\@="
"hi link javaVarDecl Special

syn match javaVarDecl "^\s\+\u\w\+\(\[\d*]\)*\(\s\+\w\+\s*=\)\@="
hi link javaVarDecl Function

syn match javaCastOper "(\u\w\+)"
hi link javaCastOper Constant

syn match javaLocalMethodInvoc "\s\@<=\w\+(\@="
hi link javaLocalMethodInvoc Operator

syn match javaOperator    "[][()]"
syn match javaBraces    "[{}]"
hi link javaBraces Identifier


" Folding:

syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

syn region foldJavadoc start=+/\*+ end=+\*/+ transparent fold keepend extend
" start=+/\*\(\(\*/\)\@!.\)*$+

syn keyword javaExternal        native package
" TODO: is '\n' enough in all situations?
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend

syn sync fromstart
setlocal foldmethod=syntax


" Lombok:

syn keyword javaSpecial val

