set clipboard=unnamedplus
set encoding=utf-8
set foldmethod=indent
set noshowmode "hide default mode indicator
set signcolumn=yes
set scrolloff=999 "number of context lines around the cursor

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
"To find a file
":find **/<fileName>
":ls
":b
"To find a word inside the files
":vim /word/g **/*

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

colorscheme gruvbox
let g:gruvbox_contrast_dark ='hard'
highlight Normal ctermbg=NONE "Prevents colorscheme overriding console bg color
highlight CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
 "Color of popup windows
highlight NormalFloat ctermbg=0 ctermfg=4
highlight SignColumn ctermbg=233 ctermfg=4

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
