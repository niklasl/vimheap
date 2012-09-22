
syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?:\?$"
hi def link cppFuncDef Special 

" EOF
