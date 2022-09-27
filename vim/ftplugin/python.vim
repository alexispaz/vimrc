setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

nmap <F5> :w <CR> :!clear; python % <CR>
nmap <F6> :w <CR> :!python % 
" set foldmethod=indent
let python_highlight_all=1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line as bad.
match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/
