"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" コメントアウト
NeoBundle 'scrooloose/nerdcommenter'
" 閉じ括弧
NeoBundle 'Townk/vim-autoclose'
" Twigをハイライト
NeoBundle 'evidens/vim-twig'
" ディレクトリをツリー表示
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

" エンコード
set encoding=utf-8
" ターミナル高速接続
set ttyfast
" インクリメンタルサーチを有効にする
set incsearch
" 行番号表示
set number
" 括弧の対応をハイライト
set showmatch
" ハイライトまでの時間
set matchtime=0
" 自動インデント
set smartindent
" シンタックス
syntax on
	set nohlsearch
	set cursorline
		highlight Normal ctermbg=black ctermfg=gray
		highlight StatusLine term=none cterm=none ctermfg=black ctermbg=gray
		highlight CursorLine term=none cterm=none ctermfg=none ctermbg=none

" カラー
set t_Co=256
" インデント
set tabstop=2
set shiftwidth=2
set expandtab
" ターミナルでマウスを使用
set mouse=a
" ワイルドメニュー
set wildmenu
" スワップファイルを作成しない
set noswapfile
" 自動改行阻止
set textwidth=0
" ファイル変更時に自動最読み込み
set autoread
" C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

" 大文字小文字を区別しない
set ignorecase
" 大文字で検索されたら対象を大文字限定にする
set smartcase

" カーソル位置を復元
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
" バックスペースキーで行頭を削除する
set backspace=indent,eol,start


" コロンとセミコロンを入れ替え
noremap : ;
noremap ; :
noremap q; q:

" 挿入モード時に;;で改行
inoremap ;; <C-O>$;<CR>

"window間移動系
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" windowの大きさ調節系
nnoremap s< <C-w><
nnoremap s> <C-w>>
nnoremap s+ <C-w>+
nnoremap s- <C-w>-


" ----- nerdcommenter -----
" ,, でコメントアウト
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
" ----- here -----

" ----- nerdtree ----
"  Ctr-eで表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
