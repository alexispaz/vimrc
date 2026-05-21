
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

" enter spaces when tab is pressed
set expandtab           
setlocal softtabstop=4
setlocal tabstop=4      

" break lines when line length increases
setlocal textwidth=120       
set autoindent          " copy indent from current line when starting a new line
setlocal shiftwidth=4   " number of spaces to use for auto indent
 
" make backspaces more powerfull
set backspace=indent,eol,start

" set showcmd             " show (partial) command in status line

