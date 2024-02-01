
" latex-suite
" ===========
" `:help latex-suite.txt` for more information
 
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex' 

" Also, vim-latexsuite package installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Compile and view
" ----------------
let g:Tex_DefaultTargetFormat='pdf'

" Compilation rule
" ----------------
" Default is 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style --shell-escape $*'
let g:Tex_CompileRule_pdf = 'latexmk -shell-escape -pdf $*'
let g:Tex_ViewRule_pdf = 'mupdf'

function! CompileCurrentSlide()
   let tmpfile = "current-slide.tex"
   silent! exe '1,/\s*\\begin{document}/w! '.tmpfile
   silent! exe '.+1?\\begin{z*frame}?,.-1/\\end{z*frame}/w! >> '.tmpfile
   silent! exe '/\s*\\end{document}/w! >> '.tmpfile
   exe '!latexmk -shell-escape -pdf '.tmpfile
endfunction

noremap <silent><buffer> \ff :call CompileCurrentSlide()<CR>
noremap \fv :execute "silent !mupdf current-slide.pdf 2>/dev/null &"<CR>:!redraw<CR><CR>


" Error handling
" --------------

let g:Tex_GotoError=0
" NOTE: Return from another file with CTRL-^ or CTRL-o CTRL-o

" Default of g:Tex_IgnoredWarnings = 
" \'Underfull'."\n".
" \'Overfull'."\n".
" \'specifier changed to'."\n".
" \'You have requested'."\n".
" \'Missing number, treated as zero.'."\n".
" \'There were undefined references'."\n".
" \'Citation %.%# undefined'

" Append g:Tex_IgnoredWarnings
" \'LaTeX Font Warning:'."\n".

" The first `Tex_IgnoreLevel` of `Tex_IgnoredWarnings` are ignored
" let g:Tex_IgnoreLevel = 7

" This is mostly a matter of taste. But LaTeX looks good with just a bit of
" indentation.
set sw=2

" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
" set iskeyword+=_,$,@,%,# " none of these are word dividers

"  El folding para frames de latex se controla en el archivo
"  .vim/ftplugins/latex-suite/folding.vim.

" Refrescado de foldings:
" map [17~ \rf

" Other things
" ============

" Convert letter to vector or array
noremap dv i\vec{<Esc>/\><CR>i}<Esc>
noremap da i\arr{<Esc>/\><CR>i}<Esc>


" Convert delimiters to latex syntax. You should put the cursor in the open
" character. (Deprecated... use \ab from physics2 package)
noremap ds :call PutDelims()<CR>
noremap sd :call ReverseDelims()<CR>

function! PutDelims()

  " let del=getline('.')[col('.')-1]
  " let beg=col('.')
  " execute 'normal %r}'
  " execute 'normal '.beg.'|r\'

  " if (del ==? '(')
  "   execute 'normal lipars*'
  " endif
  " if (del ==? '{')
  "   execute 'normal librcs*'
  " endif
  " if (del ==? '[')
  "   execute 'normal librks*'
  " endif
  " execute 'normal li{'
  execute 'normal i\ab'

endfunction         

function! ReverseDelims()

  let del=getline('.')[col('.')-1:col('.')+3]
  let beg=col('.')
  execute "normal /{\<CR>"

  if (del ==? '\pars')
    execute 'normal %r)'
  endif
  if (del ==? '\brcs')
    execute 'normal %r}'
  endif
  if (del ==? '\brks')
    execute 'normal %r]'
  endif

  execute 'normal '.beg.'|'

  if (del ==? '\pars')
    execute "normal v/{\<CR>"
    execute 'normal d'
    execute 'normal i('
  endif
  if (del ==? '\brcs')
    execute "normal v/{\<CR>"
    execute 'normal d'
    execute 'normal i{'
  endif
  if (del ==? '\brks')
    execute "normal v/{\<CR>"
    execute 'normal d'
    execute 'normal i['
  endif
 

endfunction         
 
" Documentation
let pdfapp="nohup mupdf " 
nnoremap zm1 :execute '!'.pdfapp.'/usr/share/texmf/doc/generic/pgf/pgfmanual.pdf &'<CR>
"nnoremap zm2 :execute '!'.pdfapp.'$HOME/Documentos/Manuales-Soporte/TEX/pgfplots.pdf &'<CR>
nnoremap zm2 :execute '!'.pdfapp.'/usr/share/texmf/doc/latex/pgfplots/pgfplots.pdf &'<CR>
nnoremap zm3 :execute '!'.pdfapp.'$HOME/Documentos/Manuales-Soporte/TEX/symbols-a4.pdf &'<CR>

