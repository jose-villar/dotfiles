"NerdTree
let NERDTreeQuitOnOpen = 1

"vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

"MarkdownPreview
let g:mkdp_refresh_slow = 1

"Tmux-navigator
let g:tmux_navigator_no_mappings = 1

"Gruvbox
let g:gruvbox_contrast_dark ='hard'

"Sneak
let g:sneak#label = 1

"Undotree
let g:undotree_WindowLayout = 2

"Limelight
let g:limelight_conceal_ctermfg = 'gray'

"Goyo
function! s:goyo_enter()
  Limelight
endfunction

function! s:goyo_leave()
  "Prevents colorscheme overriding console bg color
  highlight Normal ctermbg=NONE
  "Color of the cursor line
  highlight CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
  "Color of popup windows
  highlight NormalFloat ctermbg=0 ctermfg=4
  "Color of the column to the left of line numbers
  highlight SignColumn ctermbg=233 ctermfg=4
  "Highlight search color
  highlight Search cterm=NONE ctermfg=0 ctermbg=4*
  SignifyToggle
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Signify
let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'

" Lightline
let g:lightline = {
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\}

" Register the components:
let g:lightline.component_expand = {
\ 'linter_checking': 'lightline#ale#checking',
\ 'linter_infos': 'lightline#ale#infos',
\ 'linter_warnings': 'lightline#ale#warnings',
\ 'linter_errors': 'lightline#ale#errors',
\ 'linter_ok': 'lightline#ale#ok',
\  'gitbranch': 'FugitiveHead',
\ }

" Set color to the components:
let g:lightline.component_type = {
\ 'linter_checking': 'right',
\ 'linter_infos': 'right',
\ 'linter_warnings': 'warning',
\ 'linter_errors': 'error',
\ 'linter_ok': 'right',
\ }

" Add the components to the lightline, for example to the right side:
let g:lightline.active = {
\ 'right': [
\    [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
\    [ 'percent', 'lineinfo' ],
\    [ 'fileformat', 'fileencoding', 'filetype' ],
\ ],
\ 'left': [ [ 'mode', 'paste' ],
\           [ 'gitbranch', 'gitstats', 'readonly', 'filename', 'modified' ]
\ ]
\}

let g:lightline.inactive = {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }

" Icons
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

