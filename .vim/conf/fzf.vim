# # https://engineering.mercari.com/blog/entry/mercari_codecast_1/
" nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
# 
# function! s:find_rip_grep() abort
#     call fzf#vim#grep(
#                 \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
#                 \   1,
#                 \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
#                 \   0,
#                 \ )
# endfunction
