call plug#begin('~/.config/nvim/plugged')

"Sorting
"For ex. use gsi( to sort csv inside parenthesis
Plug 'christoomey/vim-sort-motion'
Plug 'jose-villar/vim-tagattsort'
"Plug '~/Workspace/code/vimscript/vim-tagattsort'

"Startup time
Plug 'dstein64/vim-startuptime'

"Themes
Plug 'morhetz/gruvbox'

"Status bar
Plug 'itchyny/lightline.vim'

"Fonts
Plug 'ryanoasis/vim-devicons'

"Tree
Plug 'scrooloose/nerdtree'

"Tmux
Plug 'christoomey/vim-tmux-navigator'

"Navigation
Plug 'justinmk/vim-sneak' "s<2 characters>

"IDE
Plug 'michaeljsmith/vim-indent-object' "<count>ii to select an indentation block
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'yggdroot/indentline' "show vertical indent guidelines
Plug 'tpope/vim-commentary' "gcc to comment out a line of code

"Undo history
Plug 'mbbill/undotree'

"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

"Syntax
Plug 'sheerun/vim-polyglot' "Also helps for indenting properly

"Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"Css
Plug 'ap/vim-css-color'

"Fuzzy finder
Plug 'wincent/Command-T'

"Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()
