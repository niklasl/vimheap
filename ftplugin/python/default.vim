
" TODO: why is this needed?! didn't use to be..?
runtime ftplugin/python.vim

" smartindent plays (not so) funny tricks when typing '#'
setlocal nosmartindent
setlocal cindent

setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal foldmethod=indent

let python_highlight_all = 1
let python_highlight_space_errors = 0 " too much of it around..

" see also 'indent/python.vim' ..


compiler pychecker


"######## ABBREVIATIONS ########

" NOTE: these uses a generic mapping to force expansions of abbrevs ending
" with "__IABBREV" - see $HOME/.vim/plugin/abbrs_maps.vim

inoreabbrev <buffer> ifmain__IABBREV if __name__ == '__main__':
inoreabbrev <buffer> main__IABBREV ifmain
inoreabbrev <buffer> bang__IABBREV #!/usr/bin/env python
inoreabbrev <buffer> shebang__IABBREV bang
inoreabbrev <buffer> exe__IABBREV bang
inoreabbrev <buffer> pyexe__IABBREV bang
inoreabbrev <buffer> init__IABBREV def __init__(self):
inoreabbrev <buffer> coding__IABBREV # -*- coding: UTF-8 -*-
inoreabbrev <buffer> im__IABBREV import
inoreabbrev <buffer> with__IABBREV from __future__ import with_statement
inoreabbrev <buffer> a__IABBREV *args, **kwargs

" Large abbreviations
inoreabbrev <buffer> optparse__IABBREV from optparse import OptionParser<NL>
    \parser = OptionParser(usage="usage: %prog [options] ...")<NL>
    \parser.add_option("-p", "--port", type="int", default=8080, help="")<NL>
    \parser.add_option("-t", "--theme", help="")<NL>
    \parser.add_option("-n", "--nocache", action="store_false", dest="usecache", default=True)<NL>
    \opts, args = parser.parse_args()<NL>


