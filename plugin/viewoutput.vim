if exists("loaded_viewoutput") | finish | endif
let loaded_viewoutput=1

function! ViewOutput(...)
	let tfile=tempname()
	let cmd=""
	let i=1
	while i <= a:0
		exec "let cmd=cmd.' '.a:".i
		let i=i+1
	endwhile
	:exec "redir >".tfile
	silent exec cmd
	redir END
    sb
    exec "edit ".tfile
endfunction

" VO - view output of vim command in new buffer
command! -narg=+ VO :call ViewOutput(<f-args>)
