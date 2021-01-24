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

function ExpandCurlyBraces()
  .s/{/{ /ge
  .s/}/ }/ge
  .s/\s\+,/,/ge
  .s/,/, /ge
  .s/\s\s\+/ /ge
  call TrimWhiteSpace()
  normal! ==
endfunction

function ShrinkCurlyBraces()
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

  call ShrinkCurlyBraces()
  if isSelfClosedTag==0
    call RemoveSlashFromClosingTag()
    normal gsi>
    call AddSlashToSelfClosingTag()
  else
    normal gsi>
  endif

  call ExpandCurlyBraces()
  call setpos('.', _save_pos)
  unlet _save_pos
  unlet isSelfClosedTag
  unlet line
endfunction

nnoremap <Leader>J :call ExpandCurlyBraces()<CR>
nnoremap <Leader>j :call ShrinkCurlyBraces()<CR>
nnoremap <Leader><Leader> :call FormatTag()<CR>

function! CharAt(index, str)
  return nr2char(strgetchar(a:str, a:index))
endfunction

function! FormatTag()
  let s:sp = getpos(".")
  let s:line = getline('.')
  let s:savedPos=getpos(".")
  let s:res=GetCurrentTag()
  let s:tag=s:res[0]
  let s:startIndex=s:res[1]
  let s:endIndex=s:res[2]
  let s:originalTag = s:res[0]

  let s:firstPart = strcharpart(s:line, 0, s:startIndex)
  let s:secondPart = strcharpart(s:line, s:endIndex, len(s:line) - 1)

  let s:tag = substitute(s:tag, ">", " >", "ge")
  let s:tag = substitute(s:tag, "/ >", "/>", "ge")
  let s:tag = substitute(s:tag, "/>", " />", "ge")

  "echo s:tag
  "sleep 5

  "Shrink Curly Braces
  let s:tag = substitute(s:tag, "{ ", "{", "ge")
  let s:tag = substitute(s:tag, " }", "}", "ge")
  let s:tag = substitute(s:tag, "\s\+,", ",", "ge")
  let s:tag = substitute(s:tag, ", ", ",", "ge")
  let s:tag = substitute(s:tag, "= >", "=>", "ge")
  let s:tag = substitute(s:tag, "=> ", "=>", "ge")
  let s:tag = substitute(s:tag, " =>", "=>", "ge")

  "echo s:tag
  "sleep 10
  "let s:tag = trim(s:tag)

  "echo s:tag

  "sleep 10
  let s:tag = SortTag(s:tag)

  "sleep 10
  "Expand curly braces
  let s:tag = substitute(s:tag, "{", "{ ", "ge")
  let s:tag = substitute(s:tag, "}", " }", "ge")
  let s:tag = substitute(s:tag, "\s\+,", ",", "ge")
  let s:tag = substitute(s:tag, ",", ", ", "ge")
  let s:tag = substitute(s:tag, "\s\s\+", " ", "ge")
  let s:tag = substitute(s:tag, "=>", " => ", "ge")
  let s:tag = trim(s:tag)

  "echo s:tag
  let s:finalResult = s:firstPart.s:tag.s:secondPart
  "echo s:finalResult
  "sleep 10
  "let s:finalResult = substitute(s:line, s:originalTag, s:tag, "ge")
  let s:finalResult = substitute(s:finalResult, "><", "> <", "ge")
  let s:finalResult = substitute(s:finalResult, "\s\s\+", " ", "ge")
  let s:finalResult = substitute(s:finalResult, "  ", " ", "ge")
  let s:finalResult = substitute(s:finalResult, "   ", " ", "ge")
  "echo s:finalResult

  call setline('.', s:finalResult)
  normal!==
  call setpos('.', s:sp)
  unlet s:tag
  unlet s:finalResult
  unlet s:savedPos
  unlet s:sp
  unlet s:res
  unlet s:firstPart
  unlet s:secondPart
  unlet s:startIndex
  unlet s:endIndex
  unlet s:line
  unlet s:originalTag
endfunction

function! FindNextClosingTag()
  let s:pos = getpos('.')
  let s:line = getline('.')
  let s:ch = CharAt(s:pos[2] - 1, s:line)
  let s:prevCh = CharAt(s:pos[2] - 2, s:line)

  while( s:ch != '>' && getline('.') == s:line)
    normal! f>
    let s:pos = getpos('.')
    let s:ch = CharAt(s:pos[2] - 1, s:line)
    "echo "ch"
    "echo s:ch
    "sleep 5
    let s:prevCh = CharAt(s:pos[2] - 2, s:line)
    "echo "prev"
    "echo s:prevCh
    "sleep 10
    while (s:prevCh == '=' && getline('.') == s:line )
      normal! f>
      let s:pos = getpos('.')
      let s:ch = CharAt(s:pos[2] - 1, s:line)
      let s:prevCh = CharAt(s:pos[2] - 2, s:line)
    endwhile
  endwhile
  return getpos('.')
endfunction

function! GetCurrentTag()
  let s:line = getline('.')
  let s:originalPos = getpos('.')
  let s:originalPosLineNumber = s:originalPos[1]
  let s:originalPosColNumber = s:originalPos[2]

  let s:charAtCursor = CharAt(s:originalPosColNumber - 1, s:line)

  if s:charAtCursor == '<'
    "sleep 5
    let s:startIndex = s:originalPosColNumber
    let s:endIndex = FindNextClosingTag()[2]
  elseif s:charAtCursor == '>'
    "sleep 5
    let s:endIndex = s:originalPosColNumber
    normal! F<
    let s:startIndex = getpos('.')[2]
  else
    let s:endIndex = FindNextClosingTag()[2]
    let s:endIndex = getpos('.')[2]
    normal! F<
    let s:startIndex = getpos('.')[2]
  endif
  let s:tag = s:line[s:startIndex - 1:s:endIndex - 1]
  "echo s:tag
  "sleep 10
  return [s:tag, s:startIndex - 1, s:endIndex]
endfunction

function! SortTag(tag)
  "echo a:tag
  "sleep 5
  let s:tagAsList = split(a:tag, ' ')
  let s:openTag = remove(s:tagAsList, 0)
  "sleep 10
  let s:closeTag = remove(s:tagAsList, len(s:tagAsList) - 1)
  "sleep 10
  call sort(s:tagAsList)
  call add(s:tagAsList, s:closeTag)
  call insert(s:tagAsList, s:openTag, 0)
  return join(s:tagAsList)
endfunction

function! SortTagAtts()
  let s:currentTag = GetCurrentTag()
  let s:currentTag = SortTag(s:currentTag)
  echo s:currentTag
endfunction

" plugins
map <Leader>nt :NERDTreeFind<CR>
map <leader>mp :MarkdownPreview<CR>

" external
nmap <leader>mtp :! pandoc -t beamer %:t -o %.pdf<CR>
nmap <leader>oib :! chromium %.pdf &<CR>

"snippets
imap ,cl<Tab> console.log("");<Esc>2hi
imap ,sout<Tab> System.out.println("");<Esc>2hi
imap ,mds<Tab> <Esc>:read $HOME/.dotfiles/nvim/snippets/slides.md<CR>kdd15ja

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
