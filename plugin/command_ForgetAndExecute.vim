"---------------------------------------------------"
" Vim script: command_ForgetAndExecute.vim          "
" About:                                            "
" Author:   Niklas Lindstr�m <neuron@canit.se>      "
"---------------------------------------------------"

command! ForgetAndExecute let @" = expand("%:p") | new | bd # | exec "so ".@"

" EOF
