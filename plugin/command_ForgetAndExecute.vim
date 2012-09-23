"---------------------------------------------------"
" Vim script: command_ForgetAndExecute.vim          "
" About:                                            "
" Author:   Niklas Lindström <neuron@canit.se>      "
"---------------------------------------------------"

command! ForgetAndExecute let @" = expand("%:p") | new | bd # | exec "so ".@"

" EOF
