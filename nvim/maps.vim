let mapleader=" "
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"Convert tabs into spaces
nmap <Leader>rt :set tabstop=2 shiftwidth=2 softtabstop=2 <Bar> retab<CR>

nnoremap <silent> <cr> :noh<CR><CR>

"Remove trailing whitespaces in a file
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" plugins
map <Leader>nt :NERDTreeFind<CR>
map <leader>mp :MarkdownPreview<CR>

" external
nmap <leader>bp :! pandoc -t beamer %:t -o %.pdf<CR>
nmap <leader>op :! chromium %.pdf &<CR>

"snippets
imap cl<Tab> console.log("");<Esc>2hi
imap sout<Tab> System.out.println("");<Esc>2hi
imap mds<Tab> <Esc>:read $HOME/.dotfiles/nvim/snippets/slides.md<CR>kdd15ja

"tmux_navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-p> :TmuxNavigatePrevious<cr>
