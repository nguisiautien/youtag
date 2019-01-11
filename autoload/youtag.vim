" This is basic vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim

function! s:UsingPython3()
  if has('python3')
    return 1
  endif
  return 0
endfunction


let s:using_python3 = s:UsingPython3()
let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
let s:python_command = s:using_python3 ? "py3 " : "py "

function! s:Pyeval( eval_string )
  if s:using_python3
    return py3eval( a:eval_string )
  endif
  return pyeval( a:eval_string )
endfunction


function! Youtag(opencmd)
exec s:python_until_eof

import vim

theline = vim.eval( 'getline(".")' ).split(":")
opencmd = vim.eval( 'a:opencmd' )

vim.command( opencmd + ' ' + theline[1].strip() )
vim.command( '0' )
vim.command( '/' + theline[2].strip() )

EOF
endfunction

nnoremap <leader>f :call Youtag("e")<CR> 
nnoremap <leader>vf :call Youtag("vsp")<CR> 

" This is basic vim plugin boilerplate
let &cpo = s:save_cpo
unlet s:save_cpo
