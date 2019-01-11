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


function! Youtag()
exec s:python_until_eof
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from __future__ import absolute_import

import os.path as p
import sys
import traceback
import vim

theline = vim.eval( 'getline(".")' ).split(":")
print(theline)
vim.command( 'vsp ' + theline[1].strip() )
vim.command( '/' + theline[2].strip() )
EOF
endfunction

nnoremap <leader>f :call Youtag()<CR> 

" This is basic vim plugin boilerplate
let &cpo = s:save_cpo
unlet s:save_cpo
