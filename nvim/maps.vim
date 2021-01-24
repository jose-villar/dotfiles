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

nnoremap <Leader>J :call ExpandCurlyBraces()<CR>
nnoremap <Leader>j :call ShrinkCurlyBraces()<CR>

function! CharAt(index, str)
  if a:index < 0
    return -1
  endif
  return nr2char(strgetchar(a:str, a:index))
endfunction

function! FormatTag()
  let s:savedPos = getpos(".")
  let s:line = getline('.')
  let s:res = GetCurrentTag()
  call setpos('.', s:savedPos)
  if empty(s:res)
    return
  endif
  let s:tag=s:res[0]
  if strchars(s:tag) < 3
    return
  endif
  let s:startIndex=s:res[1]
  let s:endIndex=s:res[2]
  let s:originalTag = s:res[0]

  let s:firstPart = strcharpart(s:line, 0, s:startIndex)
  let s:secondPart = strcharpart(s:line, s:endIndex, len(s:line) - 1)

  .s/ \s\+/ /ge
  call setpos('.', s:savedPos)
  let s:tag = substitute(s:tag, ">", " >", "ge")
  let s:tag = substitute(s:tag, "/ >", "/>", "ge")
  let s:tag = substitute(s:tag, "/>", " />", "ge")

  "Shrink Curly Braces
  let s:tag = substitute(s:tag, "{ ", "{", "ge")
  let s:tag = substitute(s:tag, " }", "}", "ge")
  let s:tag = substitute(s:tag, "\s\+,", ",", "ge")
  let s:tag = substitute(s:tag, ", ", ",", "ge")
  let s:tag = substitute(s:tag, "= >", "=>", "ge")
  let s:tag = substitute(s:tag, "=> ", "=>", "ge")
  let s:tag = substitute(s:tag, " =>", "=>", "ge")

  let s:tag = substitute(s:tag, "/ >", "/>", "ge")
  let s:tag = substitute(s:tag, "/  >", "/>", "ge")
  let s:tag = substitute(s:tag, "/>", " />", "ge")

  let s:tag = SortTag(s:tag)

  "Expand curly braces
  let s:tag = substitute(s:tag, "{", "{ ", "ge")
  let s:tag = substitute(s:tag, "}", " }", "ge")
  let s:tag = substitute(s:tag, "\s\+,", ",", "ge")
  let s:tag = substitute(s:tag, ",", ", ", "ge")
  let s:tag = substitute(s:tag, "=>", " => ", "ge")
  let s:tag = substitute(s:tag, "{ {", "{{", "ge")
  let s:tag = substitute(s:tag, "} }", "}}", "ge")
  let s:tag = trim(s:tag)

  let s:finalResult = s:firstPart.s:tag.s:secondPart
  let s:finalResult = substitute(s:finalResult, "><", "> <", "ge")

  call setline('.', s:finalResult)
  call setpos('.', s:savedPos)
  .s/ \s\+/ /ge
  call setpos('.', s:savedPos)
  normal!==
  call setpos('.', s:savedPos)
  unlet s:tag
  unlet s:finalResult
  unlet s:savedPos
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
  let s:prevPos = getpos('.')

  while( s:ch != '>' && getline('.') == s:line)
    normal! f>
    if getpos('.') == s:prevPos
      return [-1,-1,-1,-1]
    endif
    let s:pos = getpos('.')
    let s:ch = CharAt(s:pos[2] - 1, s:line)
    let s:prevCh = CharAt(s:pos[2] - 2, s:line)
    while (s:prevCh == '=' && getline('.') == s:line )
      normal! f>
      if getpos('.') == s:prevPos
        return [-1,-1,-1,-1]
      endif
      let s:pos = getpos('.')
      let s:ch = CharAt(s:pos[2] - 1, s:line)
      let s:prevCh = CharAt(s:pos[2] - 2, s:line)
      let s:prevpos = getpos('.')
    endwhile
    let s:prevpos = getpos('.')
  endwhile

  if s:line != getline('.')
    echo "Tag not found, aborting in 10..."
    sleep 10
    return [-1,-1,-1,-1]
  endif

  return getpos('.')
endfunction

" Returns the tag found where the cursor is located, and its position in the
" current line
function! GetCurrentTag()
  let s:line = getline('.')
  let s:originalPos = getpos('.')
  let s:originalPosLineNumber = s:originalPos[1]
  let s:originalPosColNumber = s:originalPos[2]
  let s:charAtCursor = CharAt(s:originalPosColNumber - 1, s:line)

  if s:charAtCursor == '<'
    let s:startIndex = s:originalPosColNumber
    let s:endIndex = FindNextClosingTag()[2]
    if s:endIndex == -1
      echo "Tag not found, aborting in 3 seconds..."
      sleep 3
      return
    endif
  elseif s:charAtCursor == '>'
    let s:endIndex = s:originalPosColNumber
    normal! F<
    let s:startIndex = getpos('.')[2]
  else
    let s:endIndex = FindNextClosingTag()[2]
    if s:endIndex == -1
      echo "Tag not found, aborting in 4 seconds..."
      sleep 4
      return
    endif
    normal! F<
    let s:startIndex = getpos('.')[2]
  endif

  if s:line != getline('.')
    echo "Tag not found, aborting in 5 seconds..."
    sleep 5
    return
  endif

  let s:tag = s:line[s:startIndex - 1 : s:endIndex - 1]
  return [s:tag, s:startIndex - 1, s:endIndex]
  unlet s:line
  unlet s:originalPos
  unlet s:originalPosLineNumber
  unlet s:originalPosColNumber
  unlet s:charAtCursor
  unlet s:startIndex
  unlet s:endIndex
  unlet s:tag
endfunction

function! SortTag(tag)
  let s:tagAsList = split(a:tag, ' ')
  let s:openTag = remove(s:tagAsList, 0)
  let s:closeTag = remove(s:tagAsList, len(s:tagAsList) - 1)
  call sort(s:tagAsList)
  call add(s:tagAsList, s:closeTag)
  call insert(s:tagAsList, s:openTag, 0)
  return join(s:tagAsList)
  unlet s:tagAsList
  unlet s:openTag
  unlet s:closeTag
  unlet a:tag
endfunction

nnoremap <Leader><Leader> :call FormatTag()<CR>

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
