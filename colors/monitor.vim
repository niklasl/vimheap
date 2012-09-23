" Vim color file
" Maintainer: Niklas Lindström <lindstream@gmail.com>
" Last Change: 2004-05-05
" Version: 0.1
" URL: http://


""" Init
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "monitor"


""""""""\ Colors \""""""""


"""" GUI Colors

highlight Cursor        gui=None guibg=#aa6500 guifg=#9c5d00
highlight CursorIM gui=bold guifg=#ff9900 guibg=#553200
hi CursorColumn     guifg=NONE      guibg=#3a2300   gui=NONE
hi CursorLine       guifg=NONE      guibg=#3a2300   gui=NONE
highlight Directory     guifg=#7e4b00 guibg=bg
highlight DiffAdd gui=None guifg=fg guibg=#5c3700
highlight DiffChange gui=None guifg=fg guibg=#2e1b00
highlight DiffDelete gui=None guifg=fg guibg=#000000
highlight DiffText gui=bold guifg=fg guibg=bg
highlight ErrorMsg      guifg=#f49200  guibg=#523100
" FillColumn is renamed to VertSplit:"
"highlight FillColumn    gui=NONE guifg=#000000 guibg=#995b00
highlight VertSplit    gui=NONE guifg=#000000 guibg=#995b00
highlight Folded        gui=bold guibg=#4a2c00 guifg=#ca7900
highlight FoldColumn        gui=bold guibg=#4a2c00 guifg=#ca7900
highlight IncSearch gui=reverse guifg=fg guibg=bg
highlight LineNr        gui=bold guibg=#0f0900 guifg=#7a4900
highlight ModeMsg       guibg=#211300 guifg=#af6900
highlight MoreMsg       gui=bold  guifg=#5a3600 guibg=bg
if version < 600
    " same as SpecialKey
    highlight NonText       guibg=#321e00 guifg=#573400
else
    " Bottom fill (use e.g. same as LineNr)
    highlight NonText       gui=None guibg=#0f0900 guifg=#905600
endif
highlight Normal        gui=None guibg=#201300 guifg=#d68000
highlight Question      gui=bold  guifg=#9a5c00 guibg=bg
highlight Search        gui=NONE guibg=#533100 guifg=NONE
highlight SpecialKey    guibg=#321e00 guifg=#5c3700
highlight StatusLine    gui=bold guibg=#e08600 guifg=#000000
highlight StatusLineNC  gui=NONE guibg=#995b00 guifg=#1a0f00
highlight Title         gui=bold  guifg=#c17300 guibg=bg
highlight Visual        gui=reverse guibg=#ff9900 guifg=#5a3600
highlight VisualNOS     gui=bold,underline guifg=fg guibg=bg
highlight WarningMsg    gui=bold guifg=#754600 guibg=bg
highlight WildMenu      gui=bold guibg=#7f4c00 guifg=#000000


"""" Syntax Colors

if exists("colors_nightshimmer_reverse_comment")
            \ && colors_nightshimmer_reverse_comment == 1
    highlight Comment       gui=reverse guifg=#6a3f00
else
    highlight Comment       gui=None guifg=#7a4900
endif

highlight Constant      guifg=#aa6500 guibg=bg
    "hi String gui=None guifg=#aa6500 guibg=bg
    "hi Character gui=None guifg=#aa6500 guibg=bg
    highlight Number gui=None guifg=#aa6500 guibg=bg
    highlight Boolean gui=bold guifg=#aa6500 guibg=bg
    "hi Float gui=None guifg=#aa6500 guibg=bg

highlight Identifier    guifg=#d47f00
    "hi Function gui=None guifg=#d47f00 guibg=bg

highlight Statement     gui=NONE guifg=#af6900
    highlight Conditional gui=None guifg=#af6900 guibg=bg
    highlight Repeat gui=None guifg=#9a5c00 guibg=bg
    "hi Label gui=None guifg=#af6900 guibg=bg
    highlight Operator gui=None guifg=#7f4c00 guibg=bg
    highlight Keyword gui=bold guifg=#af6900 guibg=bg
    highlight Exception gui=bold guifg=#af6900 guibg=bg

highlight PreProc       guifg=#b96e00
    "hi Include gui=None guifg=#b96e00 guibg=bg
    "hi Define gui=None guifg=MediumPurple1g guibg=bg
    "hi Macro gui=None guifg=MediumPurple1g guibg=bg
    "hi PreCondit gui=None guifg=MediumPurple1g guibg=bg

highlight Type          gui=NONE guifg=#ce7b00
    "hi StorageClass gui=None guifg=#ce7b00 guibg=bg
    "hi Structure gui=None guifg=#ce7b00 guibg=bg
    "hi Typedef gui=None guifg=#ce7b00 guibg=bg

highlight Special       gui=bold guifg=#ff9900
    "hi SpecialChar gui=bold guifg=#ff9900 guibg=bg
    "hi Tag gui=bold guifg=#ff9900 guibg=bg
    "hi Delimiter gui=bold guifg=#ff9900 guibg=bg
    "hi SpecialComment gui=bold guifg=#ff9900 guibg=bg
    "hi Debug gui=bold guifg=#ff9900 guibg=bg

highlight Underlined gui=underline guifg=#854f00 guibg=bg

highlight Ignore    guifg=#3a2200

highlight Error      guifg=#f49200  guibg=#523100

highlight Todo          guifg=#aa6500 guibg=#6a3f00

""" OLD COLORS



