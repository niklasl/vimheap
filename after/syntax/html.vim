
let html_highlight_rdfa = 1
if exists("html_highlight_rdfa")
    " TODO: containedin html-elem..
    "syn match Special "\vprefix=|vocab=|resource=|property=|typeof=|datatype=|about=|rel=|rev=|href=|lang="
    "syn keyword Special prefix vocab resource property typeof datatype about rel rev href lang containedin=ALL
endif

