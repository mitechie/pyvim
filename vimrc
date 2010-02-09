" ==================================================
" Dependencies
" ==================================================
" Pep8 : http://pypi.python.org/pypi/pep8
" pylint script
" curl - Gist plugin
"

" ==================================================
" Shortcuts Documented
" ==================================================
" jj - esc
" ,b - bufferlist
" ,v - load .vimrc
" ,V - reload .vimrc
" ,m - run make
" ,M - alt make for filetype (pep8 for python, etc)
" ,y - yank to clipboard
" ,p - paste from clipboard
" ,s - toggle spellcheck
" ,c  - open the quickfix window
" ,cc - close the quickfix window
" ,t - toggle nerdtree
"
" Y  - yank to the end of the line
"
" <CR> - create newline with enter key
" C-n  - clear search
" C-l  - Omnicompletion
" C-p  - ctags completion
"
" gc        - comment the highlighted text
" gcc       - comment out the current line
"
" ,,   - complete snippet
" ,,   - tab to next section of snippet
" ,n   - list available snippets for this filetype
"
" ,pw  - search for keyword in pydocs
" ,pW  - search any pydoc for this keyword
"
" Windows
" ctrl-jklm - swap to that split without the ctrl-w
" +/-       - shrink the current split verticall
" alt-,/.   - move the split vertically
" F2        - close current split
"
" :Gist
" :Gist -p (private)
" :Gist XXXX (fetch Gist XXXX and load)
"
" :PG XXXX php - vimgrep the project for XXXX in .php files

syntax on          " syntax highlighing
filetype plugin indent on

" In GVIM
if has("gui_running")
    set guifont=Liberation\ Mono\ 8" use this font 
    set lines=75          " height = 50 lines
    set columns=180       " width = 100 columns
    set background=dark   " adapt colors for background
    set keymodel=
    set mousehide
    colorscheme hornet

    " To set the toolbars off (icons on top of the screen)
    set guioptions-=T
else
    set background=dark   " adapt colors for dark background
    colorscheme hornet
endif

" ==================================================
" Basic Settings
" ==================================================
let mapleader=","     " change the leader to be a comma vs slash
set textwidth=80        " Try this out to see how textwidth helps
set ch=3                " Make command line two lines high
set ls=2                " allways show status line
set tabstop=4           " numbers of spaces of tab character
set shiftwidth=4        " numbers of spaces to (auto)indent
set scrolloff=3         " keep 3 lines when scrolling
set nocursorline        " have a line indicate the cursor location
set cindent             " cindent
set autoindent          " always set autoindenting on
set showcmd             " display incomplete commands
set ruler               " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set nobackup            " do not keep a backup file
set number              " show line numbers
set title               " show title in console title bar
set ttyfast             " smoother changes
set modeline            " last lines in document sets vim mode
set modelines=3         " number lines checked for modelines
set shortmess=atI       " Abbreviate messages
set nostartofline       " don't jump to first character when paging
set backspace=start,indent,eol
set matchpairs+=<:>     " show matching <> (html mainly) as well
set showmatch
set matchtime=3
set spell
set expandtab           " tabs are converted to spaces, use only when required
set sm                  " show matching braces, somewhat annoying...

" move freely between files
set whichwrap=b,s,h,l,<,>,[,]   

set tags=tags;/         " search for tags file in parent directories

" complete in vim commands with a nice list
set wildmenu
set wildmode=longest,list
set wildignore+=*.pyc

" ==================================================
" Basic Maps
" ==================================================

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" map ctrl-c to something else so I quick using it
map <c-c> <Nop>
imap <c-c> <Nop>

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Y yanks to the end of the line
nmap Y y$

" Run Make with ctrl-m or ,m
map <silent> <leader>m :make<CR>

" quick insertion of a newline
nmap <CR> o<Esc>            

" shortcuts for copying to clipboard
nmap <leader>y "*y 
nmap <leader>p "*p

" shortcut to toggle spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" shortcuts to open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" ==================================================
" Windows / Splits
" ==================================================

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" use - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+

" and for vsplits with alt-< or alt->
map <M-,> <C-W>>
map <M-.> <C-W><

" F2 close current window (commonly used with my F1/F3 functions)
noremap <f2> <Esc>:close<CR><Esc>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


" ==================================================
" Search
" ==================================================

" Press Ctrl-N to turn off highlighting.
set hlsearch            " highlight searches
set incsearch           " do incremental searching
set ignorecase          " ignore case when searching 

nmap <silent> <C-N> :silent noh<CR>


" ==================================================
" Completion
" ==================================================

" complete on ctrl-l
inoremap <C-l> <C-x><C-o>

set complete+=.
set complete+=k
set complete+=b
set complete+=t


" ==================================================
" Filetypes
" ==================================================

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h 

" make the smarty .tpl files html files for our purposes
au BufNewFile,BufRead *.tpl set filetype=html

" Filetypes (au = autocmd)
au filetype help set nonumber      " no line numbers when viewing help
au filetype help nnoremap <buffer><cr> <c-]>   " Enter selects subject
au filetype help nnoremap <buffer><bs> <c-T>   " Backspace to go back

"If we're editing a mail message in mutt change to 70 wide and wrap
"without linex numbers
augroup mail
    autocmd!
    autocmd FileType mail set textwidth=70 wrap nonumber nocursorline 
augroup END

" If we're editing a .txt file then skip line numbers
au! BufRead,BufNewFile *.txt set nonu
 
" automatically give executable permissions if file begins with #! and contains
" '/bin/' in the path
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

" ==================================================
" Python
" ==================================================
au BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


" ==================================================
" Javascript
" ==================================================
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

au BufRead *.js set makeprg=jslint\ %
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


" ==================================================
" Syntax Files
" ==================================================

" xml.vim
" http://github.com/sukima/xmledit/
" % jump between '<' and '>' within the tag 
" finish a tag '>'
" press '>' twice it will complete and cursor in the middle

" jinja.vim
" http://www.vim.org/scripts/script.php?script_id=1856
" syntax file for jinja1 and 2

" ==================================================
" Plugins
" ==================================================

" lusty-juggler
" http://www.vim.org/scripts/script.php?script_id=2050
nmap <silent> <Leader>b :LustyJuggler<CR>

" NERDTree
" http://www.vim.org/scripts/script.php?script_id=1658
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <leader>t :NERDTree<CR>

" tComment
" http://www.vim.org/scripts/script.php?script_id=1173
" gc        - comment the highlighted text
" gcc       - comment out the current line

" XML Completion
" http://www.vim.org/scripts/script.php?script_id=301
" close xml/html tags like <div>

" pep8
" http://www.vim.org/scripts/script.php?script_id=2914
" set to <leader>M in the actual plugin

" python folding jpythonfold.vim
" http://www.vim.org/scripts/script.php?script_id=2527
" Setup as ftplugin/python.vim for auto loading

" PyDoc
" http://www.vim.org/scripts/script.php?script_id=910
" Search python docs for the keyword
" <leader>pw - search for docs for what's under cursor
" <leader>pW - search for any docs with this keyword mentioned

" Supertab
" http://www.vim.org/scripts/script.php?script_id=182
" :SuperTabHelp

" SnipMate
" http://www.vim.org/scripts/script.php?script_id=2540
" ,, - complete and tab to next section
" ,n - show list of snippets for this filetype

" Gist - github pastbin
" http://www.vim.org/scripts/script.php?script_id=2423
" :Gist
" :Gist -p (private)
" :Gist XXXX (fetch Gist XXXX and load)
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" ==================================================
" Custom Functions
" ==================================================

function! PGrep(pattern, ...)
    let pattern = a:pattern

    if a:0 == 0
        let ext = '*'
    else
        let ext = a:1
    endif

    let proj_path = system("echo $PROJ_PATH | tr -d '\n'")

    let search_path = proj_path . "/**/*." . ext

    :execute "vimgrep /" . pattern . "/j " search_path | :copen
endfunction
command! -nargs=* PG :call PGrep(<f-args>)


