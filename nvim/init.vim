"register '*' for all yank, delete, change and put operations
"register '+' for the system
set clipboard=unnamed
set encoding=utf-8

"Folding
set foldmethod=indent
"Notes:
" -zR: unfold all
" -zM: fold all
" -za: toggle fold

set noshowmode "hide default mode indicator
set signcolumn=yes
"set scrolloff=999 "number of context lines around the cursor
"Notes:
" Center current line: zz
" View current line on top:zt
" Move screen up keeping the cursor's position <C-e>
" Move screen down keeping the cursor's position <C-y>

"Have unwritten changes to a file and open a new file
"without being forced to write or undo changes first
set hidden

"Spelling
"use zg to add word to the dictionary, z= to show the list of suggestions, and
"zw to mark as incorrect
"set spell spelllang=en,es

"Sorting
":sort

""Line numeration
set number "show current line number
set relativenumber
set numberwidth=1
"Note: use <C-A> in visual mode to increase enumeration

" Searching
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

"File searching
set autochdir
set wildmenu
set wildignore+=*/node_modules/**,*/build/**,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk
"To find a file
":find **/<fileName>
":ls
":b
"To find a word inside the files
":vim /word/g **/*
"To search and replace do the following:
"1.- vimgrep/<jose>/gj **/*
"2.- cfdo %s/<jose>/<pato>/g | update
"Notes:
" - You can use copen to navigate through the quickfix list
" - The j option is to prevent vim from jumping to the first occurence

"Tabs and spaces
set expandtab "Use spaces instead of tab characters
set tabstop=2
set shiftwidth=2 "One tab will use the width of 2 characters
set softtabstop=2
set smarttab

"Cursor
set cursorline

"Invisible characters
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»

"Indentation
set cindent
set autoindent

syntax enable
filetype plugin on

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/plugin-config.vim
so ~/.config/nvim/maps.vim

"THEME
colorscheme gruvbox
"Prevents colorscheme overriding console bg color
highlight Normal ctermbg=NONE
"Color of the cursor line
highlight CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
"Color of popup windows
highlight NormalFloat ctermbg=0 ctermfg=4
"Color of the column to the left of line numbers
highlight SignColumn ctermbg=233 ctermfg=4
"Highlight search color
highlight Search cterm=NONE ctermfg=3* ctermbg=0

"*cterm-colors*
"NR-16   NR-8    COLOR NAME
"0       0       Black
"1       4       DarkBlue
"2       2       DarkGreen
"3       6       DarkCyan
"4       1       DarkRed
"5       5       DarkMagenta
"6       3       Brown, DarkYellow
"7       7       LightGray, LightGrey, Gray, Grey
"8       0*      DarkGray, DarkGrey
"9       4*      Blue, LightBlue
"10      2*      Green, LightGreen
"11      6*      Cyan, LightCyan
"12      1*      Red, LightRed
"13      5*      Magenta, LightMagenta
"14      3*      Yellow, LightYellow
"15      7*      White
