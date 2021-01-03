set clipboard=unnamedplus
set encoding=utf-8
set foldmethod=indent
set autochdir
set noshowmode "hide default mode indicator
set signcolumn=yes

"Line numeration
set number "show current line number
set relativenumber
set numberwidth=1

" Searching
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

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
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

"Indentation
set cindent
set autoindent

syntax enable

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/plugin-config.vim
so ~/.config/nvim/maps.vim

colorscheme gruvbox
let g:gruvbox_contrast_dark ='hard'
highlight Normal ctermbg=NONE "Prevents colorscheme overriding console bg color
highlight CursorLine cterm=NONE ctermbg=233 ctermfg=NONE

augroup templates
  autocmd BufNewFile *.md 0r ~/.config/nvim/templates/skeleton.md
augroup END
