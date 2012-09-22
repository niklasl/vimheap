"==================================================="
" Conditional Delimiter Closing for Vim             "
"                                                   "
" Closes delim and steps left if:                   "
"   - at eol or next char is enddelim or expression "
"     separator                                     "
"   - and char is not quote or prev char is neither "
"     word, quote nor enddelim                      "
"                                                   "
" Author: Niklas Lindström <lindstream@gmail.com>   "
" Last Changed: 2007-09-30                          "
"==================================================="
" TODO:
" - Is current (conservative) 'nextchar =~'-version ok?
"   else revert to::
"       nextchar !~ '\w'.or.quote.or.'\s'.or.startdelim
" - Also see <http://www.vim.org/scripts/script.php?script_id=1849>,
"   may be better (or at least has complementary ideas)

func! SmartClose(char, closechar)
    let quote = "[\"'`]"
    let startdelim = '[([{<]'
    let enddelim = '[])}>]'
    let exprseps = '[,;&|:+-.]'
    let or = '\|'
    let c = col(".")
    let line = getline('.')
    let nextchar = line[c-1]
    let prevchar = line[c-2]
    if (c == col('$') || nextchar =~ enddelim.or.exprseps)
        \&& (c == 1 || a:char !~ quote
            \|| prevchar !~ '\w'.or.quote.or.enddelim)
        \|| (c > 1 && a:char =~ quote && prevchar =~ '=')
        return a:char . a:closechar . "\<Left>"
    endif
    return a:char
endfunc

inoremap ( <C-R>=SmartClose("(", ")")<CR>
inoremap [ <C-R>=SmartClose("[", "]")<CR>
inoremap { <C-R>=SmartClose("{", "}")<CR>
inoremap < <C-R>=SmartClose("<", ">")<CR>
inoremap " <C-R>=SmartClose('"', '"')<CR>
inoremap ' <C-R>=SmartClose("'", "'")<CR>
inoremap ` <C-R>=SmartClose("`", "`")<CR>

