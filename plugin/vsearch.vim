" Adaptation of:
" Search for selected text.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text (/VimTip171)
" Changes: Skip g:VeryLiteral and map to * and g* respectively.

let s:save_cpo = &cpo | set cpo&vim

function! s:VSetSearch(cmd, verbatim)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && a:verbatim
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if a:verbatim
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction

vnoremap <silent> * :<C-U>call <SID>VSetSearch('/', 1)<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?', 1)<CR>?<C-R>/<CR>
vnoremap <silent> g* :<C-U>call <SID>VSetSearch('/', 0)<CR>/<C-R>/<CR>
vnoremap <silent> g# :<C-U>call <SID>VSetSearch('?', 0)<CR>?<C-R>/<CR>
vmap <kMultiply> *

let &cpo = s:save_cpo | unlet s:save_cpo

