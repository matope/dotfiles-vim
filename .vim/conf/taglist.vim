"================================================================================
" Taglist
"================================================================================
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
map <silent> <leader>l :TlistToggle<CR>
let tlist_go_settings = 'go;f:func;t:type;v:var'
