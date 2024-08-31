" ~./vimrc

" Vundle (pluggin manager for vim)
" ================================

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
                  
"Quedan por defecto las opciones default del vim y no las del viejo vi
"This is also required for vundle
set nocompatible

"required for vundle
filetype off 

" set the runtime path to include Vundle and initialize
let s:path = substitute($HOME . '/.vim/bundle/Vundle.vim', '/', has('win32' ) ? '\\' : '/', 'g')
execute 'set rtp+=' . s:path

" Initialize bundle
call vundle#begin()

  " NOTE: Do not set options of plugins here, do it below vundle#end
      
  " Vundle automatic instalation bootstrap.
  " https://github.com/VundleVim/Vundle.vim/issues/414
  if ! exists('*vundle#begin') 
    echomsg 'Probably you need to install vundle...'
    if executable('git') &&
    \  confirm('Install vundle?', "&Yes\n&No", 2, 'Qusetion') == 1 &&
    \  mkdir(s:path, 'p')
        echo 'Cloning vundle...'
        execute '! git clone https://github.com/gmarik/vundle.git' s:path
        if v:shell_error
          echohl ErrorMsg | echomsg 'Cannot clone ' . vundle_repo . ' (' . s:path . ' may be not empty)' | echohl None
        else
          autocmd VimEnter * PluginInstall
        endif
        quit
    else
      echomsg 'Failed to install Vundle automatically.  Please install it yourself.'
    endif
  endif


  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
                         
  " Themes
  " ------

  " Color theme
  Plugin 'lifepillar/vim-solarized8'
 
  " Status line
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Tmux integration
  " Plugin 'edkolev/tmuxline.vim'
  " NOTE: No lo uso porque me desconfigura el tmux al salir del vim

  " Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
  " " let g:Powerline_symbols = 'unicode' " (e.g. 'fancy')
  " set laststatus=2 "show powerline even if no split window
 
  " View
  " ----
  
  Plugin 'szw/vim-maximizer'

  " Tools for writers
  " -----------------

  " Soft and Hard line wrapping for text.
  Plugin 'reedes/vim-pencil'
  " usage:
  "	 :SoftPencil
  "	 :HardPencil
  " Should I set F1 to togle between them.

  "Plugin 'LaTeX-Suite-aka-Vim-LaTeX'

  " " Move lines with alt
  " " ------------------- 
  "Plugin 'matze/vim-move'

  " cvs from https://github.com/chrisbra/csv.vim
  " Plugin 'chrisbra/csv.vim'
   
  " DrawIt 
  " ------
  " usage: <Leader>di

  Plugin 'DrawIt'

  " cecutil 
  " -------
  " routines used in many utilities

  Plugin 'cecutil'

  " Visual Sum
  " usage: highlight numbers and <Leader>su
  Plugin 'https://github.com/vim-scripts/visSum.vim'

  " Coding
  " ------

  " tComment (use gcc, and others)
  Plugin 'tomtom/tcomment_vim'

  " Tablas
  " ------
  Plugin 'godlygeek/tabular'
  " usage: :Tabularize /&

  Plugin 'dhruvasagar/vim-table-mode'
  " Table Mode
  " usage: 
  "
  " <Leader>tm
  " Name|Place
  " ||
  " Pepe| Jose 
  "
  " <Leader>tr realing
  "
  " <Leader>T tableize asking for delimiter
  " <Leader>tt convert csv into table
  "
  " <Leader>tdd delete row
  " <Leader>tdc delete column
  " <Leader>tic insert column
  "
  " <Leader>tfe evaluate formulas
  " <Leader>tfa add `f = formula` in the cells 
  "
  " You can directly add / manipulate formula expressions in the formula line
  " after the table, beginning with 'tmf:' (table mode formula). You can add
  " multiple formulas on the line separated with a ';' eg) # tmf:
  " $3=$2*$1;$4=$3/3.14
  " Target: 
  " $n: column number n. So for each cell in that column and the result would
  " be placed in it. You can use negative indice to represent column relative
  " to the last, -1 being the last.
  " $n,m: cell (row, column). So the result will be placed in this cell. You
  " can also use negative values to refer to cells relative to the size, -1
  " being the last (row or column).
  " Formula:
  " r1:r2: cells in the current column from row r1 through r2. If r2 is
  " negative it represents r2 rows above the current row (of the target cell).
  " r1,c1:r2,c2: This represents cells in the table from cell r1,c1 through
  " cell r2,c2 (row, column).
                   
  " MarkDown
  "---------
  "
  " tpope plugin is the native choice of vim
  
  " FIXME <Leader>tt overwrite table mode key
  " Plugin 'jkramer/vim-checkbox'
  " " usage: <Leader>tt to toggling checkboxes
  " let g:checkbox_states = [' ', 'x']
  " map <silent> <leader>cb :call checkbox#ToggleCB()<cr>
  
  Plugin 'shime/vim-livedown'
  nmap gm :LivedownToggle

  Plugin 'plasticboy/vim-markdown'
  " Other details like hilight simple code or conceal links
  " NOTE: tabular plugin must come before plasticboy/vim-markdown.
  "
  " Plugin 'rhysd/vim-gfm-syntax'
 
  " Pandoc
  " ------
  " Plugin 'vim-pandoc/vim-pandoc'
  " Plugin 'vim-pandoc/vim-pandoc-syntax'
   

  " Pending tasks list (browser of TODO, XXX, FIXME tags)
  " ----------------------
  " usage: <Leader>t
  Plugin 'fisadev/FixedTaskList.vim'          

  " Parentheses, brackets, quotes, XML tags, and more 
  " Plugin 'tpope/vim-surround'                 

  " A better vimdiff mergetool
  Plugin 'whiteinge/diffconflicts'
 
  " AI
  " Plugin 'madox2/vim-ai' chatGPT
  Plugin 'github/copilot.vim'

call vundle#end()

" FILETYPES
" =========

" File types are handled by files on ~/.vim/ftplugin/
filetype plugin on

" " OPTIONAL: This enables automatic indentation as you type.
" filetype plugin indent on  

" Note that the global plugin will be loaded after this, it may overrule the
" settings that you do here.  If this is the case, you need to use one of the
" following two methods. Make a copy of $VIMRUNTIME/ftplugin/fortran.vim in
" ~/.vim/ftplugin/fortran.vim. Since the b:did_ftplugin
" variable will be set, the global plugin will not be loaded.

" Get extention name
let s:extfname = expand("%:e")

" Defaults are in $VIMRUNTIME/ftplugin/ (:echo $VIMRUNTIME on vi)
" If the extension will load a default, make sure to use the same name
" of the default, to add the settings to the default ones.

" COLORS
" ======

" STATUS LINE
" -----------
" With 'vim-airline/vim-airline' plugin
" With 'vim-airline/vim-airline-themes' plugin
"" With 'edkolev/tmuxline.vim' plugin
  
let g:airline_theme='solarized'
" let g:airline_solarized_bg='light'
let g:airline_solarized_bg='dark'

" For the nice looking powerline symbols to appear, you will need to install
" a patched font. Instructions can be found in the official powerline
" documentation. Prepatched fonts can be found in the powerline-fonts
" repository. In arch:
" pacman -S powerline-fonts
let g:airline_powerline_fonts = 1

" Enable tmuxline
" let g:airline#extensions#tmuxline#enabled = 1
" let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" In .tmux.conf add if-shell "test -f ~/.tmux-status.conf" "source ~/.tmux-status.conf"
 
" ENVIRONMENT
" -----------
" With 'lifepillar/vim-solarized8' plugin
" With 'vim-airline/vim-airline' plugin
" With 'vim-airline/vim-airline-themes' plugin

" Tel vim terminal support true / 24 bit / RGB  colors
if has('termguicolors') && (&term == 'screen-256color' || &term == 'tmux-256color' || &term == 'xterm-256color')
  set termguicolors
  if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

set background=dark
" colorscheme solarized8
" colorscheme solarized8_high
" colorscheme solarized8_low
" colorscheme solarized8_flat

" Web page of plugin suggest this way to start
" autocmd vimenter * ++nested colorscheme solarized8
" But I have found that some higlighting does not work well when vim start.
" This do it: 
if v:version < 801
  autocmd vimenter * nested colorscheme solarized8 | filetype detect
else
  autocmd vimenter * ++nested colorscheme solarized8 | filetype detect
endif 

" Toggle background with <F6>
function! ToggleBG()
  let g:airline_solarized_bg=( &background == "dark"? "light" : "dark" )
  exec "set background=".( &background == "dark"? "light" : "dark" )
	AirlineRefresh
endfunction
noremap <F6> <Esc>:call ToggleBG()


" HIGLIGHTING
" ===========

" enable syntax higlights
syntax enable

" resalta parentesis de entrada y cierre
set sm


" GVIM
" ====

" Si es llamado como evim nada de esto funciona
if v:progname =~? "evim" | finish | endif 

" (au GUIEnter *) es para ordenar al gvimrc
" Aca desactivo los avisos de errores
au GUIEnter * set t_vb=

" Necesario para que pase de 7 a 8
:set nrformats=hex
 
" Underline the current line with - signs
nnoremap - yyp<c-v>$r-
inoremap - <Esc>yyp<c-v>$r-A

" Underline the current line with = signs
nnoremap = yyp<c-v>$r=
inoremap = <Esc>yyp<c-v>$r=A

   

" YANK AND PASTE
" ==============

" <https://vi.stackexchange.com/a/96/22366>
" For X11-based systems (ie. Linux and most other UNIX-like systems) there are
" two clipboards which are independent of each other:
"		PRIMARY - This is copy-on-select, and can be pasted with the middle mouse button.
"		CLIPBOARD - This is copied with (usually) ^C, and pasted with ^V (It's like MS Windows).
"
" Vim has two special registers corresponding to these clipboards:
"		* uses PRIMARY; mnemonic: Star is Select (for copy-on-select)
"		+ uses CLIPBOARD; mnemonic: CTRL PLUS C (for the common keybind)
" Thus, you could maybe use this keybinds:
"   noremap y "*y
"   noremap p "*p
"   noremap y "+y
"   noremap P "+p
"
" If you want to "automatically" interface with the system's clipboard instead
" of referring to it manually all the time, you can:
" Set it to unnamed to use * (PRIMARY, on select)
   set clipboard=unnamed
" Set it to unnamedplus to use + (CLIPBOARD, ^C)
"   set clipboard=unnamedplus
" Now, just using yy will go to the system's clipboard, instead of Vim's
" unnamed register, and p will paste the system's clipboard.
"
" NOTA: Para que esto ande se necesita version >7.3 y vim compilado con
" +xterm_clipboard " (you can see the compilations flags in `vim --version`). 
" Apparently on native vim in Arch there is no support for X so the +clipboard
" feature is missing. To fix this, install gvim.
  
" Para copiar sin los breaklines jejeje
" vnoremap gy :s/\n\(\p\)/ \1/g<CR>gvyu
vnoremap gy :s/\n\(\p\)/ \1/g<CR>gvyu
 
" Para pegar sin sobre escribir el buffer
vnoremap op "_dP

" Toggle 'paste' mode
if version>=508
    " Para cambiar en el modo insert
    set pastetoggle=<F2>
    " Para cambiar con un mensaje de aviso
    noremap <F2> :set paste!<CR><Bar>:echo "Paste mode: " . strpart("OffOn", 3 * &paste, 3)<CR>
endif
 
 
" copy+paste using a temporal file
if has("unix")
    nnoremap _Y :.w! $HOME/.vi_tmp<CR>
    vnoremap _Y :w! $HOME/.vi_tmp<CR>
    nnoremap _P :r $HOME/.vi_tmp<CR>
elseif has("win32") || has("gui_win32")
    nnoremap _Y :.w! $vim\_vi_tmp<CR>
    vnoremap _Y :w! $vim\_vi_tmp<CR>
    nnoremap _P :r $vim\_vi_tmp<CR>
endif
 

" VIMDIFF
" =======

if &diff

  " Difput para una linea
  noremap d.p :.diffput<CR>
  noremap d.o :.diffget<CR>

  " Difput para rango
  vnoremap dp :diffput<CR>
  vnoremap do :diffget<CR>

  " Diff update
  nnoremap <silent> du :diffupdate<cr>

  " Toggle diff highlighting in a single windowEdit
  " Disable one diff window during a three-way diff allowing you to cut out the
  " noise of a three-way diff and focus on just the changes between two versions
  " at a time. Inspired by Steve Losh's Splice
  function! DiffToggle(window)
    " Save the cursor position and turn on diff for all windows
    let l:save_cursor = getpos('.')
    windo :diffthis
    " Turn off diff for the specified window (but keep scrollbind) and move
    " the cursor to the left-most diff window
    exe a:window . "wincmd w"
    diffoff
    set scrollbind
    set cursorbind
    exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
    " Update the diff and restore the cursor position
    diffupdate
    call setpos('.', l:save_cursor)
  endfunction

  " Toggle diff view on the left, center, or right windows
  nnoremap <silent> dt1 :call DiffToggle(1)<cr>
  nnoremap <silent> dt2 :call DiffToggle(2)<cr>
  nnoremap <silent> dt3 :call DiffToggle(3)<cr>
  nnoremap <silent> dt  :windo :diffthis<cr>
     
  " diffconflicts (modified) is the wraper that I use for git mergetool
  nnoremap <silent> dl :diffget LOCAL<cr> :diffupdate<cr>
  nnoremap <silent> db :diffget BASE<cr> :diffupdate<cr>
  nnoremap <silent> dr :diffget REMOTE<cr> :diffupdate<cr>
endif


"ignore whitespace in vimdiff
"if &diff
"    ignore multiple line spacing
"    set diffopt+=iwhite
"endif

"" To quickly disable search highlighting
"noremap     <F12>   :nohlsearch<CR>
"inoremap    <F12>   <ESC>:nohlsearch<CR>i
"vnoremap    <F12>   <ESC>:nohlsearch<CR>gv

" DISPLAY
" =======

"show cursor line and column in the status line
set ruler

"show matching brackets
set showmatch

"display mode INSERT/REPLACE/...
set showmode

"Enable show commands
set showcmd

" Maximizer
let g:maximizer_default_mapping_key = '<C-w>z'
 
" FORMATTING
" ==========

"Redefino la movilidad, salta entre el primer y ultimo
"caracter del parrafo actual.
noremap } }OAOF
noremap { {OBOH

" shortcut for formatting paragraph
inoremap    <C-d>   <C-O>gqap
vnoremap    <C-d>   gq

" Hasta el fin del renglon
noremap     <C-d>OC   gwOC
" Hasta el fin del parrafo
noremap     <C-d>OB   gw}
" Hasta el punto
noremap     <C-d>OD   gwas
" Todo el parrafo
noremap     <C-d>OA   gqap

" WRAPING
" =======
  
" With 'reedes/vim-pencil' plugin
let g:pencil#conceallevel = 0
 
"textwidth (tw): controls the wrap width; by default it's unset and
"thus disables line-wrapping. If this value is set, you're entirely at
"the whimsy of the below formatoptions, which is often filetype
"sensitive.

au FileType gitcommit set tw=72
                               
"formatoptions (fo): Automatic wrapping (t) and other options (cop)
"set fo+=t
"set fo-=t

"wrapmargin (wm): controls when to wrap based on terminal size.

"El siguiente comando externo funciona reacomodando los finales de
"linea Fija a 80 las columnas. El -w es el ancho y el -c que preserve
"la identacion -s para que no una lineas cortas (para programcion) 
"" noremap º :.!fmt -w90 -c  i
"" noremap r !}fmt -w90 -c 
"" vnoremap r !fmt -w80 -c  
"" noremap º gwapi
"" Este comando funciona tanto antes como despues de escribir y/o con o
"" sin un wrapeado previo. Es decir, uno puede ingresarlo primero, y luego
"" escribir que se acomoda todo solo. Por eso al map le agrege la i. Asi 
"" uno puede apretar la r y escribir tranqui y todo queda wrapeadito. Solo
"" hay que tener cuidado de estar separado de un parrafo que no se quiera
"" wrapear por una linea

"Evita cortar virtualmente las lineas cuando superan la pantalla
set nowrap


" SOUNDS
" ======

"Evita los pitidos en caso de ciertos error
set noerrorbells  

"Cambia todos los mensajes de error a un destello de la pantalla
set vb

"Cambia todos los mensajes de error a nada
set vb t_vb=


" SEARCH
" ======

"Ignorar mayúsculas y minúsculas salvo si se buscan mayúsculas explicitamente
set ignorecase smartcase  

"changes special characters in search patterns (default)
"set magic

"To search non-printable characters: /[^ -~] 

" SPELLING 
" ========

" La lista de palabras del español esta en .vim/spell/es.XXXX.

" Se puede perzonalizar el diccionario que se guarda en ~/.vim/dict.add
set spl=es spell
set spl=en_us spell

" Set nospell es para que no joda de entrada 
set nospell

" toggle spelling with F4 key
" Al ultimo, syntax sync fromstart, puede ser muy lento
noremap <F3> :set spellfile=~/.vim/spell/dict.es.add<CR>:set spl=es spell!<CR><Bar>:echo "Spell Check en español: " . strpart("OffOn", 3 * &spell, 3)<CR>:syntax sync fromstart<CR>
noremap <F4> :set spellfile=~/.vim/spell/dict.en.add<CR>:set spl=en_us spell!<CR><Bar>:echo "Spell Check en ingles: " . strpart("OffOn", 3 * &spell, 3)<CR>:syntax sync fromstart<CR>
   

" Abreviaciones
noremap z1 1z=
noremap z2 2z=
noremap z3 3z=
noremap z4 4z=

" Para reemplazar por el mas probable
noremap z0 ]s

" Para repetir el ultimo spell en todo el documento
noremap z. :spellrepall]s


" Reduce la lista de palabras a las mejores 10    
set sps=best,10

"  Highlighting
"  ctermfg/bg: 0-negro 1-rojo 2-verde 3-naranja 4-lila 5-fuxia 6-cyan
"  other options:  term=underline cterm=underline
highlight SpellBad term=standout    ctermbg=1
highlight clear SpellCap
highlight SpellCap term=underline   ctermbg=4
highlight clear SpellRare
highlight SpellRare term=underline  ctermbg=6
highlight clear SpellLocal
highlight SpellLocal term=underline ctermbg=3


" TABLES
" ======

"mover el cursor como si hubiera espacios donde no los hay
set virtualedit=all

" CODING 
" ======

" tComment: Extension to column insertion
vnoremap gC g>^yt ugvI<c-r>"<ESC>l

" None of these are word dividers
set iskeyword+=_,$,@,%,# 

" Tab behavior
set tabstop=2
set expandtab

" Automatically indent lines (default)
set shiftwidth=2
set autoindent

" Smart indent like in a C code
set cindent

"The "Tag List" plugin is a source code browser for the Vim editor. 
"The taglist plugin relies on the features supported by exuberant ctags and
"will not work with GNU ctags or the Unix ctags utility. You can use the
"following command to determine whether the ctags installed in your system is
"exuberant ctags:
"$ ctags --version
" let Tlist_Ctags_Cmd = '/usr/bin/exuberant-ctags' 
" let Tlist_Compact_Format = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" nnoremap <C-l> :TlistToggle<CR>

" Mouse and X cliboard
" ====================

" Give the mouse, If you want paste an external copy, use shift
set mouse=a

" Term
" ====            
" <https://stackoverflow.com/a/15378816/1342186>
" 
" You don't need to do anything in Vim as it's perfectly capable to
" do the right thing by itself.
"
" When you don't use tmux or screen, you only need to configure your terminal
" emulators to advertise themselves as "capable of displaying 256 colors" by
" setting their TERM to xterm-256color or any comparable value that works with
" your terminals and platforms. How you do it will depend on the terminal
" emulator. 
"
" When you use tmux or screen, those programs set their own default value for
" $TERM, usually screen, and Vim does what it has to do with the info it is
" given.
"
" If you want a more uniform (and colorful) behavior, you must configure screen
" or tmux to use a "better" value for $TERM. In tmux
"   set -g default-terminal "screen-256color"
" Then, the multiplexers will tell Vim they support 256 colors and Vim will do
" what you expect it to do.
"
" The value of the term option (retrieved with &term) is the name of the terminal
" as picked up by Vim upon startup. That name is what you are supposed to setup
" in your terminal emulator itself.
"
" When Vim starts up, it gets the value of the TERM environment variable,
" queries the terminfo database with that value and stores a number of
" informations on its environment in several t_… variables among which… the
" number of colors available in t_Co. Given a "legal" terminal type (one that Vim
" can lookup), Vim always assumes the correct number of colors.
" So, the value of the t_Co option (&t_Co) is what Vim considers to be the maximum
" number of colors that can be displayed by the host terminal.


" BROWSER  
" ========

" Seguir links con gx
let g:netrw_browsex_viewer= "google-chrome"
 
" Keyboard maps
" =============

" Required to be able to use keypad keys and map missed escape sequences
" set esckeys

" allow backspacing over everything in insert mode 
set backspace=indent,eol,start

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
" set wildmode=longest,full

" Miscelaneaous for tmux
" ----------------------
if exists('$TMUX')
  " Remap increment and decrement (ctrl-A is for my tmux!)
  noremap a <C-A> 
  noremap z <C-X> 
        
  " I want to suspend the session if I'm in insert mode (usefull for tmux)
  inoremap          <ESC>
endif
   

" NumPad in my laptop
" -------------------

" Vim, screen and tmux use the ncurses library to manage the terminal. One of the
" things ncurses is doing when it takes control of a VT100-compatible terminal is
" switching the arrow keys into "application mode", which changes the codes they
" emit. The up-arrow key, for example, changes from Esc [ A to Esc O A. 

" Number 5 of NumPad behave wrong in gnome terminal. Fixing with:
map  <ESC>OE <Nop>
map! <ESC>OE <Nop>
  
if exists('$TMUX')
	" Fixing NumPad keys that do not work in tmux with NumLock off.
	map  <ESC>Oj  *
	map! <ESC>Oj  *
	map  <ESC>Om  -
	map! <ESC>Om  -
	map  <ESC>Ok  +
	map! <ESC>Ok  +
	"  This work in opensuse:
	"    map  <ESC>Oo  :  
	"    map! <ESC>Oo  :  
	"    map  <ESC>OM  \\\
	"    map! <ESC>OM  \\\
	"  This work in arch:
	map  <ESC>Oo  /
	map! <ESC>Oo  /
	map  <ESC>OM  \ 
	map! <ESC>OM  \ 
endif

" MISCELANEUS
" -----------
 
" apparently my index finger is faster than my ring finger :)
nnoremap    :W      :w
nnoremap    :Q      :q
" ...and my right index finger is fat! :)
nnoremap    :Lw     :w

" lookup mappings a la unix
noremap     :alias      map
noremap     :which      map

" parenthize a word or a text with " "
noremap     ,,          maa0<ESC>mbbma$a x<ESC>`awgebi"<ESC>ea"<ESC>$xx`blx`a
vnoremap    ,,      v`<i"<ESC>`>a"<ESC>
" parenthize a word or a text with  ( )
noremap     ,,,         maa0<ESC>mbbma$a x<ESC>`awgebi(<ESC>ea)<ESC>$xx`blx`a
vnoremap    ,,,     v`<i(<ESC>`>a)<ESC>
 

" OTROS
" =====
 
" When editing a file, always jump to the last known cursor position.  Don't
" do it when the position is invalid or when inside an event handler (happens
" when dropping a file on gvim). 
" Only do this part when compiled with support for autocommands. 
if has("autocmd") 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
 
endif " has("autocmd")

" HARDCOPY 
" ========

" printer options  
set popt+=paper:a4


" AI
" ==

" let g:vim_ai_chat['options']['model'] = 'gpt-4'


