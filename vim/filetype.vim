" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
	au! BufNewFile,BufFilePre,BufRead Makefile.inc setfiletype make
	au! BufNewFile,BufFilePre,BufRead makefile.inc setfiletype make
	au! BufNewFile,BufFilePre,BufRead *.gms setfiletype gems
	au! BufNewFile,BufFilePre,BufRead *.plt setfiletype gnuplot
	au! BufNewFile,BufFilePre,BufRead *.m setfiletype matlab
	au! BufNewFile,BufFilePre,BufRead *.vmd setfiletype tcl
	au! BufNewFile,BufFilePre,BufRead *.namd setfiletype tcl
	au! BufNewFile,BufFilePre,BufRead *.sqlite setfiletype sql
	au! BufNewFile,BufFilePre,BufRead *.sqlite3 setfiletype sql
augroup END
