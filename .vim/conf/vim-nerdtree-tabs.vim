" 起動時に自動的にNERDtree有効化
let g:nerdtree_tabs_open_on_console_startup=1

" 終了時自動的にNERDTree無効化(Sessionからの復元で多重起動するのを防止する)
autocmd VimLeave * NERDTreeTabsClose
autocmd VimLeave * mksession!
