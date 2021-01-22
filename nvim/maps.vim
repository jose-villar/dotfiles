let mapleader=" "
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"Resize panes
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :resize -5<CR>
nnoremap <C-Down> :resize +5<CR>

"Convert tabs into spaces
nmap <Leader>rt :set tabstop=2 shiftwidth=2 softtabstop=2 <Bar> retab<CR>

"Remove highlight from words on ENTER when searching
nnoremap <silent> <cr> :noh<CR><CR>

"Removes trailing whitespaces all over the file
function! TrimWhiteSpaces()
  let _save_pos=getpos(".")
  let _s=@/
  %s/\s\+$//e
  let @/=_s
  nohl
  unlet _s
  call setpos('.', _save_pos)
  unlet _save_pos
endfunction

"Removes trailing whitespace in the current line
function! TrimWhiteSpace()
  let _save_pos=getpos(".")
  let _s=@/
  .s/\s\+$//e
  let @/=_s
  nohl
  unlet _s
  call setpos('.', _save_pos)
  unlet _save_pos
endfunction

"Remove trailing whitespaces in a file
nnoremap <silent><F5> :call TrimWhiteSpaces()<CR>

function SpreadCurlyBrackets()
  .s/{/{ /ge
  .s/}/ }/ge
  .s/\s\+,/,/ge
  .s/,/, /ge
  .s/\s\s\+/ /ge
  call TrimWhiteSpace()
  normal! ==
endfunction

function SchrinkCurlyBrackets()
  .s/{ /{/ge
  .s/ }/}/ge
  .s/\s\+,/,/ge
  .s/, /,/ge
  call TrimWhiteSpace()
endfunction

function RemoveSlashFromClosingTag()
  .s/\/\s*>/>/ge
endfunction

function AddSlashToSelfClosingTag()
  .s/>$/\/>/g
endfunction

function IsSelfClosedTag(line)
  return match(a:line, ".*<.*\/>")
endfunction

function SortTagAttributes()
  let _save_pos=getpos(".")
  let line=getline('.')
  let isSelfClosedTag=IsSelfClosedTag(line)

  call SchrinkCurlyBrackets()
  if isSelfClosedTag==0
    call RemoveSlashFromClosingTag()
    normal gsi>
    call AddSlashToSelfClosingTag()
  else
    normal gsi>
  endif

  call SpreadCurlyBrackets()
  call setpos('.', _save_pos)
  unlet _save_pos
  unlet isSelfClosedTag
  unlet line
endfunction

nnoremap <Leader>J :call SpreadCurlyBrackets()<CR>
nnoremap <Leader>j :call SchrinkCurlyBrackets()<CR>
nnoremap <Leader><Leader> :call SortTagAttributes()<CR>

" plugins
map <Leader>nt :NERDTreeFind<CR>
map <leader>mp :MarkdownPreview<CR>

" external
nmap <leader>mtp :! pandoc -t beamer %:t -o %.pdf<CR>
nmap <leader>oib :! chromium %.pdf &<CR>

"snippets
imap cl<Tab> console.log("");<Esc>2hi
imap sout<Tab> System.out.println("");<Esc>2hi
imap mds<Tab> <Esc>:read $HOME/.dotfiles/nvim/snippets/slides.md<CR>kdd15ja

"tmux_navigator
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-p> :TmuxNavigatePrevious<cr>

"Spell checking
function! FixLastSpellingError()
  normal! mm[s1z=`m
endfunction
nnoremap <Leader>sc :call FixLastSpellingError()<CR>

"Search and replace
nnoremap <Leader>r viw"hy<ESC>/\<<c-r>h\><CR>:%s///gc<left><left><left>
vnoremap <Leader>r "hy<ESC>/<c-r>h<CR>:%s///gc<left><left><left>

"Convert Line To Title Case
nnoremap <Leader>gt :s/\<\(\w\)\(\S*\)/\u\1\L\2/g<CR>:noh<CR>

"source: http://stolarscy.com/dryobates/2014-05/sorting_paragraphs_in_vim/
function! SortParagraphs() range
  execute a:firstline . "," . a:lastline . 'd'
  let @@=join(sort(split(substitute(@@, "\n*$", "", ""), "\n\n")), "\n\n")
  put!
endfunction

vnoremap <F4> :call SortParagraphs()<CR><CR>
