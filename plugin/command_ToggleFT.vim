
command! -nargs=+ ToggleFt :let &ft = (&ft==[<f-args>][0])? [<f-args>][1] : [<f-args>][0]

command! -nargs=+ TogglePipeScript :if &ft == 'sh' | exec "%!bash" | else | undo | endif | let &ft = (&ft=='sh')? <q-args> : 'sh'

