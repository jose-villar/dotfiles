let mapleader=" "
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>somv :so $MYVIMRC<CR>
nmap <Leader>pwd :pwd<CR>
nmap <Leader>c ysiw`<ESC>Bw
nmap <Leader>C ysiW`<ESC>Bw
nmap <Leader>i ysiw*<ESC>Bw
nmap <Leader>I ysiW*<ESC>Bw
nmap <Leader>b ysiw*a*<ESC>ea*<ESC>Bw
nmap <Leader>B ysiW*a*<ESC>Ea*<ESC>Bw
nmap <Leader>j i<C-m><ESC>

vmap <Leader>c S`<ESC>
vmap <Leader>i S*<ESC>
vmap <Leader>b S*gvS*<ESC>

"Git
"Press dv on the file that has merge conflicts, in the status menu
"Target branch (active branch):2
nmap <Leader>dg2 :diffget //2<BAR>:diffupdate<CR>
"Merge branch (named in the git merge command):3
nmap <Leader>dg3 :diffget //3<BAR>:diffupdate<CR>

"Resize panes
nnoremap <C-Right> :vertical resize +10<CR>
nnoremap <C-Left> :vertical resize -10<CR>
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>

function! Retab(tabSize) abort
  let savedPos = getpos('.')
  exec 'setlocal ts='.a:tabSize.' sw='.a:tabSize.' sts='.a:tabSize
  retab
  normal!gg=Gzz
  call setpos('.', savedPos)
endfunction

if !exists(":Retab")
  command -nargs=1 Retab :call Retab(<f-args>)
endif

nnoremap <Leader>rt :call Retab(2)<CR>

"Remove highlight from words on ENTER when searching
nnoremap <silent><CR> :noh

"Removes trailing whitespaces all over the file
function! TrimWhiteSpaces()
  let s:savedPos = getpos(".")
  let s:s=@/
  %s/\s\+$//e
  let @/=s:s
  nohl
  unlet s:s
  call setpos('.', s:savedPos)
  unlet s:savedPos
endfunction

"Removes trailing whitespace in the current line
function! TrimWhiteSpace()
  let s:savedPos = getpos(".")
  let s:s = @/
  .s/\s\+$//e
  let @/ = s:s
  nohl
  unlet s:s
  call setpos('.', s:savedPos)
  unlet s:savedPos
endfunction

"Remove trailing whitespaces in a file
nnoremap <silent><Leader><F5> :call TrimWhiteSpaces()<CR>

"source: http://stolarscy.com/dryobates/2014-05/sorting_paragraphs_in_vim/
function! SortParagraphs() range abort
  execute a:firstline . "," . a:lastline . 'd'
  let @@=join(sort(split(substitute(@@, "\n*$", "", ""), "\n\n")), "\n\n")
  put!
endfunction

vnoremap <Leader><F4> :call SortParagraphs()<CR><CR>

"Search and replace
nnoremap <Leader>r viw"hy<ESC>/\<<c-r>h\><CR>:%s///gc<left><left><left>
vnoremap <Leader>r "hy<ESC>/<c-r>h<CR>:%s///gc<left><left><left>

map <Leader>nt :NERDTreeFind<CR>
nnoremap <Leader>h :UndotreeToggle<CR>
nmap <Leader>nm <Plug>(coc-diagnostic-next)
nmap <Leader>Nm <Plug>(coc-diagnostic-prev)

"sneak
map <Leader>s <Plug>Sneak_s
map <Leader>S <Plug>Sneak_S

"titlecase
nmap <Leader>gt <Plug>Titlecase
vmap <Leader>gt <Plug>Titlecase
nmap <Leader>gT <Plug>TitlecaseLine

"tmux_navigator
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-p> :TmuxNavigatePrevious<CR>

"vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>

"Projectionist
nnoremap <Leader>a :A<CR>

"External
nmap <leader>mtp :! pandoc -t beamer %:t -o %.pdf<CR>
nmap <leader>oib :! chromium %:r.pdf &<CR>

"Snippets
imap ,cl<Tab> console.log("")<Esc>hi
imap ,sout<Tab> System.out.println("");<Esc>2hi
imap ,mds<Tab> <Esc>:read $HOME/.dotfiles/nvim/snippets/slides.md<CR>kdd15ja
imap ,!<Tab> <Esc>:read $HOME/.dotfiles/nvim/snippets/html.html<CR>7j3wa
