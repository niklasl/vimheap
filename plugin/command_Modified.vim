
let s:tlabel = '\(\(last \)\?\(date\|changed\?\|updated\|modified\):\s\+\)[0-9-: ]\{6,\}[0-9]\(.*\)$'

func! s:Modified()
    let timeformat = "%Y-%m-%d" " %H:%M
    let tstamp = strftime(timeformat)
    let mask = s:tlabel . '!\1' . tstamp . '\4'
    let subst = 's!' . mask . '!e' . 'i'
    let lines = &modelines*4
    if lines > line('$')
        let lines = '$'
    endif
    let range = '1,' . lines
    exec '' . range . subst
endfunc

command! Modified call <SID>Modified()

