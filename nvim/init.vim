"register '*' for all yank, delete, change and put operations
"register '+' for the system
set clipboard=unnamed
set encoding=utf-8
set cc=80

"Folding
set foldmethod=indent

set noshowmode "hide default mode indicator
set signcolumn=yes

" Allow to have unwritten changes to a file and open a new file without being
" forced to write or undo changes first
set hidden

"Spelling
"use zg to add word to the dictionary, z= to show the list of suggestions, and
"zw to mark as incorrect
set spell spelllang=en,es

"Line numeration
set number "show current line number
set relativenumber
set numberwidth=1

" Searching
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

"File searching
set autochdir
set wildmenu
set wildignore+=*/node_modules/**,*/build/**,_site,*/__pycache__/,*/venv/*,
      \*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,
      \*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

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

"Undo history
set nobackup
set noswapfile
set nowritebackup
set undolevels=1000
set history=1000

if has('persistent_undo')
  set undodir=$HOME/.config/nvim/undoHistory
  set undofile
endif

syntax enable
filetype indent plugin on

"Before plugins are added
let g:ale_disable_lsp = 1

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/plugin-config.vim
so ~/.config/nvim/maps.vim

"THEME
colorscheme gruvbox

highlight CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
highlight Search cterm=NONE ctermfg=0 ctermbg=3
highlight ColorColumn cterm=NONE ctermbg=234 ctermfg=NONE
highlight Comment cterm=italic


"*cterm-colors* NR-8    COLOR NAME
"0       Black
"0*      DarkGray, DarkGrey
"1       DarkRed
"1*      Red, LightRed
"2       DarkGreen
"2*      Green, LightGreen
"3       Brown, DarkYellow
"3*      Yellow, LightYellow
"4       DarkBlue
"4*      Blue, LightBlue
"5       DarkMagenta
"5*      Magenta, LightMagenta
"6       DarkCyan
"6*      Cyan, LightCyan
"7       LightGray, LightGrey, Gray, Grey
"7*      White
