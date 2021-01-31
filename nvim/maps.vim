let mapleader=" "
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>somv :so $MYVIMRC<CR>

function! s:CharAt(index, str) abort
  if a:index < 0 || strchars(a:str) < 1 || a:index >= strchars(a:str)
    return
  endif
  return nr2char(strgetchar(a:str, a:index))
endfunction

function! CopyFromUpperLine()
  let s:reg_save = @@
  let s:originalStartPos = getpos('.')
  let s:originalLine = line('.')
  let s:originalCol = col('.')

  call cursor(s:originalLine - 1, s:originalCol)

  execute 'normal! 0' . s:originalCol . 'lh'
  if s:originalCol != col('.')
    return
  endif


  if s:originalCol > 1
    let s:preCol = col('.')
    normal! l
    let s:posCol = col('.')
    if s:preCol == s:posCol
      call setpos('.', s:originalStartPos)
      startinsert!
      return
    endif
  endif

  normal! yw

  call cursor(s:originalLine, s:originalCol)
  execute 'normal! 0' . s:originalCol . 'l'

  normal! p


  "Patch for the case where the line to be ciopied starts with a single '"'
  if s:originalCol == 1 && type(s:CharAt(0, getline('.'))) == v:t_string && s:CharAt(0, getline('.')) == '"' && type(s:CharAt(1, getline('.'))) == v:t_string && s:CharAt(1, getline('.')) == '"' && type(s:CharAt(0, getline(s:originalLine - 1))) == v:t_string && s:CharAt(0, getline(s:originalLine - 1)) == '"' && ! (s:CharAt(1, getline(s:originalLine - 1) == '"'))
    call cursor(s:originalLine - 1, s:originalCol)
    execute 'normal! 0' . s:originalCol . 'l'
    normal! yiw
    call cursor(s:originalLine, s:originalCol)
    execute 'normal! 0' . s:originalCol . 'l'
    normal! p
    execute 'normal! 0x'
  endif

  startinsert!

  let @@ = s:reg_save
  unlet! s:preCol
  unlet! s:posCol
  unlet s:reg_save
  unlet s:originalCol
  unlet s:originalLine
  unlet s:originalStartPos
endfunction

imap <F2> <Esc>:call CopyFromUpperLine()<CR>

"Resize panes
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :resize -5<CR>
nnoremap <C-Down> :resize +5<CR>

function! ConvertTabsIntoSpaces()
  let s:savedPos = getpos('.')
  set tabstop=2 shiftwidth=2 softtabstop=2
  retab
  normal!gg=G
  call setpos('.', s:savedPos)
  unlet s:savedPos
endfunction

nnoremap <Leader>rt :call ConvertTabsIntoSpaces()<CR>

"Remove highlight from words on ENTER when searching
nnoremap <silent><CR> :noh<CR><CR>

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

function! ExpandCurlyBraces()
  .s/{/{ /ge
  .s/}/ }/ge
  .s/\s\+,/,/ge
  .s/,/, /ge
  .s/\s\s\+/ /ge
  call TrimWhiteSpace()
  normal! ==
endfunction

function! ShrinkCurlyBraces()
  .s/{ /{/ge
  .s/ }/}/ge
  .s/\s\+,/,/ge
  .s/, /,/ge
  call TrimWhiteSpace()
endfunction

nnoremap <Leader>J :call ExpandCurlyBraces()<CR>
nnoremap <Leader>j :call ShrinkCurlyBraces()<CR>

" plugins
map <Leader>nt :NERDTreeFind<CR>
nnoremap <Leader>h :UndotreeToggle<CR>
nmap <Leader>nm <Plug>(coc-diagnostic-next)
nmap <Leader>Nm <Plug>(coc-diagnostic-prev)

" external
nmap <leader>mtp :! pandoc -t beamer %:t -o %.pdf<CR>
nmap <leader>oib :! chromium %.pdf &<CR>

"snippets
imap ,cl<Tab> console.log("");<Esc>2hi
imap ,sout<Tab> System.out.println("");<Esc>2hi
imap ,mds<Tab> <Esc>:read $HOME/.dotfiles/nvim/snippets/slides.md<CR>kdd15ja

"tmux_navigator
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-p> :TmuxNavigatePrevious<CR>

function! FixLastSpellingError() abort
  normal! mm[s1z=`m
endfunction

nnoremap <Leader>sc :call FixLastSpellingError()<CR>

"Search and replace
nnoremap <Leader>r viw"hy<ESC>/\<<c-r>h\><CR>:%s///gc<left><left><left>
vnoremap <Leader>r "hy<ESC>/<c-r>h<CR>:%s///gc<left><left><left>

function! FormatCurrentLineToTitleCase()
  .s/\<\(\w\)\(\S*\)/\u\1\L\2/ge
endfunction

nnoremap <Leader>gt :call FormatCurrentLineToTitleCase()<CR>

"source: http://stolarscy.com/dryobates/2014-05/sorting_paragraphs_in_vim/
function! SortParagraphs() range abort
  execute a:firstline . "," . a:lastline . 'd'
  let @@=join(sort(split(substitute(@@, "\n*$", "", ""), "\n\n")), "\n\n")
  put!
endfunction

vnoremap <Leader><F4> :call SortParagraphs()<CR><CR>
