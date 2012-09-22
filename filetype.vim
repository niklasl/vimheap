" my filetype.vim

augroup filetypedetect

    " Structured Text
    au! BufRead,BufNewFile *.stx  setfiletype stx

    " ReStructuredText
    " NOTE: using shipped version (ft=rst) instead
    "au! BufRead,BufNewFile *.rst  setfiletype rest

    " Markdown
    "au BufRead,BufNewFile *.mkd,*.markdown  setfiletype mkd

    " JSON
    "au BufRead,BufNewFile *.json  setfiletype javascript
    au BufRead,BufNewFile *.json  setfiletype json

    " SPARQL Query Syntax
    au! BufNewFile,BufRead *.rq,*.sparql  setfiletype sparql

    " RDF Notation 3 Syntax
    au! BufNewFile,BufRead *.n3,*.ttl  set filetype=n3

    " Relax NG Compact Syntax
    au! BufRead,BufNewFile *.rnc  setfiletype rnc

    " SVG
    au BufNewFile,BufRead *.svg  setfiletype svg

    " XHTML
    au BufNewFile,BufRead *.xhtm,*.xhtml  setfiletype xhtml

    " Colors for rgb.txt
    au! BufRead,BufNewFile rgb.txt setfiletype rgb

    " Io
    au! BufRead,BufNewFile *.io  set filetype=io

    " INI cfg:s (override default '*.ini' => dosini)
    au! BufRead,BufNewFile *.ini  set filetype=cfg

    " Groovy
    au! BufRead,BufNewFile *.groovy,*.gy  setfiletype groovy

    " JSP Tag File
    au BufNewFile,BufRead *.tag  setfiletype jsp

    " FreeMarker
    au BufNewFile,BufRead *.ftl setfiletype ftl

    " Velocity macro
    au! BufRead,BufNewFile *.vm  setfiletype velocity

    " Gradle build file
    au BufNewFile,BufRead *.gradle setf groovy

augroup END
