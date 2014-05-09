"--------------------------------------------------------------------------------
" lightline
"--------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }
