" Puts the buffer in a pipe and back again.
" Author: Niklas Lindstrom <lindstream@gmail.com>

func! s:PipeBuffer(cmd, ...)
    if a:0 > 0
        let silent = a:1
    endif
    if exists('b:pipejob')
        echoerr 'A pipejob already exists for this buffer!'
    endif

    let inbuffer = bufnr("%")
    let outbuffer = tempname()

    if !silent
        exec 'sp ' . outbuffer
        set buftype=nofile bufhidden=wipe
    endif
    nnoremap <buffer> <C-C> :call StopPipeBuffer()<CR>

    let b:pipejob = job_start(a:cmd, {
            \ 'in_io': 'buffer',
            \ 'in_buf': inbuffer,
            \ 'out_io': 'buffer',
            \ 'out_name': outbuffer,
            \ 'err_io': 'buffer',
            \ 'err_name': outbuffer,
            \ 'out_msg': 0,
            \ 'close_cb': function('<SID>OnClose', [inbuffer, outbuffer])
            \ })
endfunc


func! s:OnClose(inbuffer, outbuffer, channel)
    call setbufline(a:inbuffer, 1, getbufline(a:outbuffer, 1, '$'))
    exec 'bw ' . a:outbuffer
    if exists('b:pipejob')
        unlet b:pipejob
    endif
endfunc


func! StopPipeBuffer()
    if exists('b:pipejob')
        call job_stop(b:pipejob)
        unlet b:pipejob
    endif
endfunc


command! -nargs=1 -complete=command -bang PipeBuffer :call <SID>PipeBuffer(<f-args>, <bang>0)


nnoremap <C-CR> :PipeBuffer bash<CR>
nnoremap <S-C-CR> :PipeBuffer! bash<CR>
