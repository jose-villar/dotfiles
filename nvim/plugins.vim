call plug#begin('~/.config/nvim/plugged')

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

"IDE
Plug 'scrooloose/nerdcommenter'
Plug 'yggdroot/indentline' "show vertical indent guidelines
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'michaeljsmith/vim-indent-object' "<count>ii to select an indentation block
Plug 'tpope/vim-surround'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

"Syntax
Plug 'sheerun/vim-polyglot' "Also helps for indenting properly

"Git
Plug 'mhinz/vim-signify'

"Css
Plug 'ap/vim-css-color'

"Fuzzy finder
Plug 'wincent/Command-T'

"Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()
