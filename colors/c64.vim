""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ColorScheme: C64
"
" Maintainer: Niklas Lindström <lindstream@gmail.com>
" Last Change: 2011-01-23
" Version: 0.1.0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This vim script and colorscheme can use different C64 color profiles and is
" generally made as a toy.
"
" For good fun with a boot load sequence, define:
"
"   :let g:hi_c64_boot = 1
"
" before sourcing the script (e.g. doing :colorscheme c64).
"
"
" It's nigh mandatory to combine this colorscheme with these awesome C64
" fonts:
"
"   <http://www.kreativekorp.com/software/fonts/c64.shtml>
"
" For the best C64 experience, install some of those and do e.g.:
"
"   :set guifont=Pet\ Me\ 64\ 2Y:h11
"
"
" While this is somewhat of a draft, I hope you enjoy it!
"
" ?SYNTAX ERROR
" READY.
"
""

hi clear
let g:colors_name = "c64"


command! -nargs=* HiC64 :call <SID>HiC64(<f-args>)

func! s:HiC64(group, fg, bg, gui)
  let fg = s:get_color(a:fg)
  let bg = s:get_color(a:bg)
  exec printf("hi %s guifg=%s guibg=%s gui=%s", a:group, fg, bg, a:gui)
endfunc

func! s:get_color(name)
  let [setname, name] = [g:hi_c64_colorset, a:name]
  if name =~ ':'
    let [setname, name] = split(name, ':')
  endif
  return get(s:colorsets[setname], name, name)
endfunc

let s:colorsets = {}

if !exists('g:hi_c64_colorset')
  let g:hi_c64_colorset = 'ccs'
endif


""
" Bonus: Rotate the colors LOAD style
"
func! HiC64Rotate(group, parts, step)
  let group = a:group == '.'?
        \ synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
        \ : a:group
  let groupId = hlID(group == ''? 'Normal' : group)
  let cmd = 'hi ' . group
  let colorset = s:colorsets[g:hi_c64_colorset]
  let colorkeys = keys(colorset)
  let colors = values(colorset) "map(colorkeys, 'colorset[v:val]')
  for part in a:parts
    let current = index(colors, synIDattr(hlID(a:group), part.'#'))
    if current != -1
      let i = current + a:step
      let i = i >= len(colorkeys)? 0 : i < 0? len(colorkeys)-1 : i
      let cmd .= printf(' gui%s=%s', part, colorset[colorkeys[i]])
    endif
  endfor
  exec cmd
endfunc

""
" Bonus: Theme BOOT
"
func! HiC64Boot()
  HiC64 Normal lightblue blue NONE
  HiC64 LineNr blue lightblue NONE
  HiC64 NonText blue lightblue NONE
  redraw
  echo 'READY.' | echo ''
  for c in split('LOAD "*",8,1', '\zs')
    sleep 50 m | echon c
  endfor
  echo 'LOADING'
  sleep 600 m | echo 'READY.'
  sleep 200 m | echo 'RUN'
  sleep 400 m | redraw | sleep 200 m
  let i = 0
  let rotation = len(s:colorsets[g:hi_c64_colorset]) * 2
  while i < rotation
    let i += 1
    sleep 5 m
    for group in ['Normal', 'LineNr', 'NonText']
      call HiC64Rotate(group, ['bg', 'fg'], 1)
    endfor
    redraw
  endwhile
endfunc


" <http://www.blitzbasic.com/Community/posts.php?topic=52312>
let s:colorsets.basic = {
  \ 'black': '#000000',
  \ 'white': '#FFFFFF',
  \ 'red': '#68372B',
  \ 'cyan': '#70A4B2',
  \ 'purple': '#6F3D86',
  \ 'green': '#588D43',
  \ 'blue': '#352879',
  \ 'yellow': '#B8C76F',
  \ 'orange': '#6F4F25',
  \ 'brown': '#433900',
  \ 'lightred': '#9A6759',
  \ 'darkgrey': '#444444',
  \ 'grey': '#6C6C6C',
  \ 'lightgreen': '#9AD284',
  \ 'lightblue': '#6C5EB5',
  \ 'lightgrey': '#959595'
\}

" CCS 3.2.2002
let s:colorsets.ccs = {
  \ 'black': '#191d19',
  \ 'white': '#fcf9fc',
  \ 'red': '#933a4c',
  \ 'cyan': '#b6fafa',
  \ 'purple': '#d27ded',
  \ 'green': '#6acf6f',
  \ 'blue': '#4f44d8',
  \ 'yellow': '#fbfb8b',
  \ 'orange': '#d89c5b',
  \ 'brown': '#7f5307',
  \ 'lightred': '#ef839f',
  \ 'darkgrey': '#575753',
  \ 'grey': '#a3a7a7',
  \ 'lightgreen': '#b7fbbf',
  \ 'lightblue': '#a397ff',
  \ 'lightgrey': '#eff9e7'
\}


if exists('g:hi_c64_boot') && g:hi_c64_boot == 1
  call HiC64Boot()
endif


HiC64 Normal lightblue black NONE
HiC64 NonText green darkgrey NONE
HiC64 LineNr black darkgrey NONE
HiC64 StatusLine black white italic
HiC64 StatusLineNC white darkgrey NONE
HiC64 Cursor NONE NONE inverse
"CursorIM
HiC64 CursorColumn blue lightblue NONE
HiC64 CursorLine NONE darkgrey NONE
"IncSearch
"ModeMsg
HiC64 Search NONE NONE inverse
HiC64 SpecialKey blue NONE NONE
HiC64 VertSplit NONE grey NONE
HiC64 Visual NONE blue NONE

"Directory
"ErrorMsg
"MoreMsg
"Question
"SignColumn
"TabLine
"TabLineFill
"TabLineSel
"Title
"WarningMsg
"WildMenu

"DiffAdd
"DiffChange
"DiffDelete
"DiffText
"FoldColumn
"Folded

"MatchParen
"Pmenu
"PmenuSbar
"PmenuSel
"PmenuThumb
"SpellBad
"SpellCap
"SpellLocal
"SpellRare

HiC64 Comment red NONE NONE
HiC64 Constant cyan NONE NONE
"  HiC64 Boolean
"  "Character
"  "Float
"  HiC64 Number
"  HiC64 String
"HiC64 Error
HiC64 Identifier purple NONE NONE
"  "Function
"HiC64 Ignore
"HiC64 PreProc
"  "Define
"  "Include
"  "Macro
"  "PreCondit
"HiC64 Special
"  "Debug
"  "Delimiter
"  "SpecialChar
"  "SpecialComment
"  "Tag
HiC64 Statement lightgreen NONE NONE
"HiC64 Statement
"  HiC64 Conditional
"  HiC64 Exception
"  HiC64 Keyword
"  "Label
"  HiC64 Operator
"  HiC64 Repeat
"HiC64 Todo
HiC64 Type orange NONE NONE
"  "StorageClass
"  "Structure
"  "Typedef
"HiC64 Underlined

