set textwidth=77

function! Zplt_plt()

  let mainplt=expand("%:t")
  let basename=mainplt[0:len(mainplt)-5]

  " Run plot
  let stringaux='silent ! gnuplot -e "plt=\"'.basename.'\"" '.mainplt
  execute stringaux

  execute 'silent !pdflatex -shell-escape -jobname '.basename.' -file-line-error -halt-on-error '.basename.' >& /dev/null'
  silent redraw!
 
endfunction                                               

function! Zplt_run()

  let mainplt=expand("%:t")
  let basename=mainplt[0:len(mainplt)-5]

  " Run associated script
  let stringaux='silent ! ./'.basename.'.sh'
  execute stringaux

  call Zplt_plt()

endfunction                                               
                  

" compilacion
nnoremap <leader>zx  :call Zplt_run()<CR>
nnoremap <leader>zc  :call Zplt_plt()<CR>

" visualizacion
let pdfapp="nohup mupdf -r 150 -A2 " 
nnoremap <leader>zv  :execute "silent !".pdfapp."%:r.pdf &"<CR>:silent ! sleep 0.3"<CR>: redraw!<CR>  
 
