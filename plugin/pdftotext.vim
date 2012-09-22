
autocmd BufReadPre *.pdf set ro
autocmd BufReadPost *.pdf silent %!pdftotext "%" - |fmt -csw78

