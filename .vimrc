set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'


" Bundle 'Valloric/YouCompleteMe'

Bundle 'fugitive.vim'
Bundle 'motemen/git-vim'
" Bundle 'airblade/vim-gitgutter'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/Align'
Bundle 'scrooloose/syntastic'
Bundle 'rking/ag.vim'
Bundle 'vim-jp/cpp-vim'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'kien/ctrlp.vim'
" Bundle 'elzr/vim-json'
Bundle 'tpope/vim-surround'

" NERDTree系
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
source ~/.vim/conf/vim-nerdtree-tabs.vim

" Golang系
Bundle 'fatih/vim-go'
source ~/.vim/conf/vim-go.vim
Bundle 'google/vim-ft-go'
"Bundle 'vim-jp/vim-go-extra'

Bundle 'Shougo/echodoc.vim'
set cmdheight=2
let g:echodoc_enable_at_startup = 1

"Bundle 'vim-scripts/taglist.vim'
"source ~/.vim/conf/taglist.vim

Bundle 'majutsushi/tagbar'
source ~/.vim/conf/tagbar.vim

Bundle 'itchyny/lightline.vim'
source ~/.vim/conf/lightline.vim

" neocomplete.vimの動作要件を満たさない環境ならneocomplcacheにフォールバックする
if (has('lua') && (v:version > 703 || (v:version == 703 && has('patch885'))))
  Bundle 'Shougo/neocomplete.vim'
  source ~/.vim/conf/neocomplete.vim
else
  Bundle 'Shougo/neocomplcache.vim'
  source ~/.vim/conf/neocomplcache.vim
endif

" Bundle 'mileszs/ack.vim'

" カラースキーム
Bundle 'croaker/mustang-vim'
Bundle 'vim-scripts/Wombat'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/Lucius'
Bundle 'vim-scripts/Zenburn'
Bundle 'mrkn/mrkn256.vim'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'therubymug/vim-pyte'
Bundle 'tomasr/molokai'
Bundle 'altercation/solarized'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/pyte'
Bundle 'w0ng/vim-hybrid'
Bundle 'vim-scripts/desert256.vim'
Bundle 'vim-scripts/wombat256.vim'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

"================================================================================
" ruler, statusline
"================================================================================
set number

"ステータスラインを常に表示
set laststatus=2
" ステータスラインの表示
" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff}%{']'}%y%{fugitive#statusline()}\ %F%=%l,%c%V%8P

"if &term =~ "screen"
"  " screen Buffer 切り替えで screen にファイル名を表示
"  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe '!echo -n "kv:%\\"' | endif
"endif

"================================================================================
" syntax and colors
"================================================================================
" set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm
" tmux内で実行したときに背景色を保護する
set t_ut=
syntax enable

"--- solarized ------------------------
" let g:solarized_termcolors=256 
let g:solarized_termtrans=1
" colorscheme solarized
"--- molokai ------------------------
let g:molokai_original = 1
let g:rehash256 = 1
"--- lucius ------------------------
let g:lucius_style='dark'
" let g:lucius_contrast='high'
set background=dark

colorscheme molokai

"タブ文字の表示
set list
set listchars=tab:-\ ,trail:\ 

"括弧入力時の対応する括弧を表示
set showmatch

" Don't wrap words by default
set textwidth=0

" 選択範囲が見えなくなるのでコメントアウト
if !has('macunix')
  highlight Visual ctermbg=0
else
  highlight Visual ctermbg=8
end

" highlight SpecialKey ctermbg=2
" highlight MatchParen cterm=none ctermbg=15 ctermfg=0
" highlight Search ctermbg=5 ctermfg=0

" highlight 上書き
" autocmd VimEnter,WinEnter * highlight SpecialKey ctermbg=0
" autocmd VimEnter,WinEnter * highlight PmenuSel ctermbg=12


"================================================================================
" tabstop and indents
"================================================================================
if has("autocmd")
  filetype plugin on
  filetype indent on
  " これらのftではインデントを無効に
  " autocmd FileType php filetype indent off
  " autocmd FileType xhtml :set indentexpr=
endif

" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=0

set smartindent
"================================================================================
" search
"================================================================================
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索で色をつける
set hlsearch
" 検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
" インクリメンタル検索
set incsearch
" gh で hilight を消す
nnoremap <silent> gh :let @/=''<CR>

" 検索レジストリに入ってる文字で現在のファイルを検索し、quickfix で開く
nnoremap <unique> g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
" G/ ではすべてのバッファ
nnoremap <unique> G/ :silent exec ':cexpr "" \| :bufdo vimgrepadd /' . getreg('/') . '/j %'<CR>\|:silent cwin<CR>

" バッファから検索
function! Bgrep(word)
  cexpr '' " quickfix を空に
  silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
  silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)

" :grepで組み込みのgrepを使う
set grepprg=internal

" *,#による検索時に次の検索結果にジャンプしないようにする
nmap * *N
nmap # #N
"================================================================================
" editing
"================================================================================
" Insert モード抜けたら nopaste
autocmd InsertLeave * set nopaste

" Visualモードのpで上書きされたテキストをレジスタに入れない
vnoremap p "_c<C-r>"<ESC>

" more powerful backspacing
set backspace=indent,eol,start

" http://d.hatena.ne.jp/edvakf/20100512/1273697666
" nnoremap sc :call system("pbcopy", @")
" copy to clipboard
if has("unix") && match(system("uname"),'Darwin') != -1 " mac
  " http://www.mail-archive.com/vim-latex-devel@lists.sourceforge.net/msg00773.html
  nnoremap fc :call system("pbcopy", @")<CR>
  nnoremap fp :r! pbpaste<CR>
elseif has('win32unix') " cygwin
  nnoremap fc :call system("putclip", @")<CR>
  nnoremap fp :r! getclip<CR>
endif

" Gスクロールが遅い件の対応
set timeoutlen=10
set ttimeoutlen=1

" C-CでESC
inoremap <C-C> <ESC>

" Foldingをマーカーに
set foldmethod=marker
"================================================================================
" cursor moving
"================================================================================
"表示行単位で行移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" カーソル移動時の全角半角の判定をうまいことやる
set ambiwidth=double 

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" スクロールオフセット
set scrolloff=5

" スクロールを高速化
set ttyfast



"================================================================================
" completion
"================================================================================
" 辞書ファイルからの単語補間
set complete+=k

" コマンドライン補間をシェルっぽく
set wildmode=list:longest

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"================================================================================
" buffers
"================================================================================
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread

"================================================================================
" windos
"================================================================================
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

"================================================================================
" encoding
"================================================================================

" svn/git での文字エンコーディング設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType git :set fileencoding=utf-8

"================================================================================
" backup, history
"================================================================================
set nobackup    " Don't keep a backup file
" set viminfo='50,<1000,s100,\"50 " read/write a .viminfo file, don't store more than
set viminfo='500,<10000,s1000,\"500 " read/write a .viminfo file, don't store more than
"set viminfo='50,<1000,s100,:0,n~/.vim/viminfo
set history=1000 " keep 50 lines of command line history

"================================================================================
" git, vcs
"================================================================================
" Bundle 'fugitive.vim'
" nnoremap <unique> gG :exec ':silent Ggrep ' . expand('<cword>')<CR>

"================================================================================
" quickfix
"================================================================================
" QuickFix のサイズ調整,自動で抜ける 
function! s:autoCloseQuickFix()
  let qllen = min([10, len(getqflist())])
  cclose
  if qllen
    execute 'cw' . qllen
    normal <C-W><C-W>
  endif
  redraw
endfunction

autocmd QuickFixCmdPost * :call s:autoCloseQuickFix()

" quickfix を閉じる
nnoremap <unique> ec :cclose<CR>



"================================================================================
" mouse
"================================================================================
" マウスは必要なときに有効化する
set mouse=

" For screen.
if &term =~ "^screen"
    augroup MyAutoCmd
        autocmd VimLeave * :set mouse=
     augroup END
    " screenでマウスを使用するとフリーズするのでその対策
    set ttymouse=xterm2
endif

"================================================================================
" misc
"================================================================================
" カレントディレクトリを自動的にカレントウィンドウに変更
"if exists('+autochdir')
"  set autochdir
"endif

" ビジュアルベルを抑止
set visualbell t_vb=

" <c-j>でEsc
imap <c-j> <esc>

nmap <F10> :set paste<CR>i<CR>

"================================================================================
" local setting
"================================================================================
" load ~/.vimrc.local
if filereadable(expand('$HOME/.vimrc.local'))
  source ~/.vimrc.local
endif

"================================================================================
" Templates
"================================================================================
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/cpp.txt
autocmd BufNewFile *.cc 0r $HOME/.vim/templates/cpp.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/templates/shell.sh

" Go のテンプレート
function! s:ReadGoTemplate(name)
  if a:name =~# '_test.go'
    0r $HOME/.vim/templates/main_test.go
  else
    0r $HOME/.vim/templates/main.go
  endif
endfunction
autocmd BufNewFile *.go call <SID>ReadGoTemplate(expand('%'))

"================================================================================
" Golang
"===============================================================================
"exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
"set completeopt=menu,preview
filetype off
filetype plugin off
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
filetype plugin on

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

