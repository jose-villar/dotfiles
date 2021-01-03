call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'morhetz/gruvbox'
"Status bar
Plug 'itchyny/lightline.vim'
Plug 'jose-villar/lightline-gruvbox.vim'

"Tree
Plug 'scrooloose/nerdtree'

"Tmux
Plug 'christoomey/vim-tmux-navigator'

"IDE
Plug 'scrooloose/nerdcommenter'
Plug 'yggdroot/indentline' "show vertical indent guidelines
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

"Syntax
Plug 'sheerun/vim-polyglot' "Also helps for indenting properly

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"Git
Plug 'mhinz/vim-signify'

call plug#end()
