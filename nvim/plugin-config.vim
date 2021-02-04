"NerdTree
let NERDTreeQuitOnOpen=1

"vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

"MarkdownPreview
let g:mkdp_refresh_slow = 1

"Tmux-navigator
let g:tmux_navigator_no_mappings = 1

"Gruvbox
let g:gruvbox_contrast_dark ='hard'
"Gruvbox theme for the status bar
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

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
