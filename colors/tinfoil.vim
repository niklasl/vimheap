" Vim ColorScheme : TinFoil
"
" Maintainer: Niklas Lindström <lindstream@gmail.com>
" Last Change: 2007-11-26
" Version: 1.0b
"


" Init
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "tinfoil"


" UI Colors

hi Cursor           guifg=fg        guibg=#ff00aa   gui=NONE
"hi Cursor           guifg=fg        guibg=#88ff99   gui=NONE
hi CursorIM         guifg=fg        guibg=#8844ff   gui=NONE
hi CursorColumn     guifg=NONE      guibg=#775088   gui=NONE
hi CursorLine       guifg=NONE      guibg=#665077   gui=NONE
hi IncSearch        guifg=#ffffaa   guibg=#60b040   gui=NONE
hi LineNr           guifg=#99b4b0   guibg=#222630   gui=NONE
hi ModeMsg          guifg=#99f4f0   guibg=NONE      gui=inverse,bold
hi NonText          guifg=#aabcba   guibg=#222630   gui=NONE
hi Normal           guifg=#ffffff   guibg=#414852   gui=NONE
hi Search           guifg=fg        guibg=#66bb44   gui=NONE
hi SpecialKey       guifg=#7e7e7e   guibg=#4a565e   gui=NONE
hi StatusLine       guifg=#000000   guibg=#ffffff   gui=bold
hi StatusLineNC     guifg=#333333   guibg=#999999   gui=NONE
hi VertSplit        guifg=#333333   guibg=#cccccc   gui=NONE
hi Visual           guifg=NONE      guibg=#22a9a9
""hi lCursor          guifg=NONE      guibg=NONE      gui=NONE

hi Directory        guifg=#66eeff   guibg=NONE      gui=bold
hi ErrorMsg         guifg=#ffffaa   guibg=#ff0000   gui=bold
hi MoreMsg          guifg=orange    guibg=NONE      gui=NONE
hi Question         guifg=#33ffcc   guibg=#333333   gui=bold
hi SignColumn       guifg=NONE      guibg=NONE      gui=NONE
hi TabLine          guifg=#333333   guibg=#cccccc   gui=NONE
hi TabLineFill      guifg=NONE      guibg=#999999   gui=NONE
hi TabLineSel       guifg=#000000   guibg=#ffffff   gui=NONE
hi Title            guifg=#aaffee   guibg=NONE      gui=bold
hi WarningMsg       guifg=#ffffaa   guibg=#ff6600   gui=bold
hi WildMenu         guifg=#33ffcc   guibg=#333333   gui=NONE

hi DiffAdd          guifg=lightyellow      guibg=green      gui=NONE
hi DiffChange       guifg=lightyellow      guibg=blue      gui=NONE
hi DiffDelete       guifg=lightyellow      guibg=red      gui=NONE
hi DiffText         guifg=lightyellow      guibg=#996699      gui=NONE
hi FoldColumn       guifg=#bac6ce   guibg=#2a363e   gui=bold
hi Folded           guifg=#bac6ce   guibg=#2a363e   gui=bold

if v:version >= 700
    hi MatchParen       guifg=fg        guibg=#33aaaa   gui=NONE
    hi Pmenu            guifg=#111133   guibg=#c2f4f4   gui=NONE
    hi PmenuSbar        guifg=NONE      guibg=#000000   gui=NONE
    hi PmenuSel         guifg=#ffffff   guibg=#103030   gui=NONE
    hi PmenuThumb       guifg=NONE      guibg=#ffffff   gui=NONE
    hi SpellBad         guifg=NONE    guibg=NONE    gui=undercurl
    hi SpellCap         guifg=NONE    guibg=NONE    gui=undercurl
    hi SpellLocal       guifg=NONE    guibg=NONE    gui=undercurl
    hi SpellRare        guifg=NONE    guibg=NONE    gui=undercurl
endif


" Syntax Colors

hi Comment          guifg=#a08a8a   guibg=bg        gui=NONE
hi Constant         guifg=#f0fada   guibg=bg        gui=bold
    hi Boolean      guifg=#60ffd0   guibg=NONE      gui=bold
    "Character
    "Float
    hi Number       guifg=#d0fafa   guibg=NONE      gui=NONE
    hi String       guifg=#f0fada   guibg=#4e555d   gui=NONE
hi Error            guifg=#ffff00   guibg=NONE      gui=inverse
hi Identifier       guifg=#c0ffea   guibg=NONE      gui=bold
    "Function
hi Ignore           guifg=#a08a8a   guibg=bg        gui=NONE
hi PreProc          guifg=#fad0fa   guibg=NONE      gui=bold
    "Define
    "Include
    "Macro
    "PreCondit
hi Special          guifg=#77ffaa   guibg=NONE      gui=bold
    "Debug
    "Delimiter
    "SpecialChar
    "SpecialComment
    "Tag
"hi Statement        guifg=#f6eec9   guibg=NONE      gui=NONE
hi Statement        guifg=#c9ffc9   guibg=NONE      gui=NONE
    hi Conditional  guifg=#ffcccc   guibg=NONE      gui=NONE
    hi Keyword      guifg=#f6bbf6   guibg=NONE      gui=NONE
    "Label
    hi Operator     guifg=#aafae0   guibg=bg        gui=NONE
    hi Repeat       guifg=#aae0fa   guibg=bg        gui=NONE
hi Todo             guifg=#eecccc   guibg=NONE      gui=inverse
hi Type             guifg=#eac0ff   guibg=NONE      gui=NONE
    hi Exception    guifg=#ffc0ea   guibg=NONE      gui=NONE
    "StorageClass
    "Structure
    "Typedef
hi Underlined       guifg=NONE      guibg=NONE      gui=underline
hi TaglistTagName   guifg=#ffc0ea   guibg=NONE      gui=bold


