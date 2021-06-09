augroup filetype_md
  autocmd!
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd FileType markdown nmap <buffer> <LocalLeader>c ysiw`<ESC>3w
  autocmd FileType markdown nmap <buffer> <LocalLeader>C ysiW`<ESC>3w
  autocmd FileType markdown nmap <buffer> <LocalLeader>i ysiw*<ESC>3w
  autocmd FileType markdown nmap <buffer> <LocalLeader>I ysiW*<ESC>3w
  autocmd FileType markdown nmap <buffer> <LocalLeader>b ysiw*a*<ESC>ea*<ESC>w
  autocmd FileType markdown nmap <buffer> <LocalLeader>B ysiW*a*<ESC>Ea*<ESC>w
  autocmd FileType markdown vmap <buffer> <LocalLeader>c S`<ESC>
  autocmd FileType markdown vmap <buffer> <LocalLeader>i S*<ESC>
  autocmd FileType markdown vmap <buffer> <LocalLeader>b S*gvS*<ESC>
augroup END







