call plug#begin('~/.config/nvim/plugged')

" Sorting
" For ex. use gsi( to sort csv inside parenthesis
Plug 'christoomey/vim-sort-motion'
Plug 'jose-villar/vim-tagasort'
" Plug '~/Workspace/code/vimscript/vim-tagasort'

" Startup time
Plug 'dstein64/vim-startuptime'

" Themes
Plug 'morhetz/gruvbox'

" Goyo
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Fonts
Plug 'ryanoasis/vim-devicons'

" Tree
Plug 'scrooloose/nerdtree'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Navigation
Plug 'justinmk/vim-sneak' "s<2 characters>

" IDE
Plug 'michaeljsmith/vim-indent-object' "<count>ii to select an indentation block
Plug 'tpope/vim-surround'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'yggdroot/indentline' "show vertical indent guidelines
Plug 'tpope/vim-commentary' "gcc to comment out a line of code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-scriptease' "use g= to evaluate an expression

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Undo history
Plug 'mbbill/undotree'

" Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Syntax
" A collection of languaje packs
Plug 'sheerun/vim-polyglot' "Also helps for indenting properly
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Tests
Plug 'vim-test/vim-test'
Plug 'neomake/neomake'
Plug 'tpope/vim-projectionist'

" Css
Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'

" Fuzzy finder
Plug 'wincent/Command-T'

"Follow symlinks automatically
" Plug 'moll/vim-bbye' " optional dependency to consistenly wipe buffers without
"impacting the windows order.
Plug 'aymericbeaumet/vim-symlink'

"Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

"Misc
Plug 'tpope/vim-eunuch' " sugar for UNIX shell commands
Plug 'tpope/vim-unimpaired' " [l and ]l to navigate through warnings
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat' "repeat mappings with . operator
Plug 'tpope/vim-endwise'
"By default titlecase maps itself to gt, note that this interferes with the
"default mapping for switching tabs
Plug 'christoomey/vim-titlecase'
Plug 'tpope/vim-dispatch'

call plug#end()
