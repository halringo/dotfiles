" init.vim
" ===

" True Colour を有効にする
set termguicolors


" dein
" ---
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " 補完
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('cohama/lexima.vim')

  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  " インターフェイス
  call dein#add('Shougo/denite.nvim')

  " シンタックスハイライト
  call dein#add('slim-template/vim-slim')

  " カラースキーム
  call dein#add('crusoexia/vim-monokai')

  " Git
  call dein#add('tpope/vim-fugitive')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" deoplete
" ---
" deoplete を開始する
call deoplete#enable()


" denite
" ---
" file_rec は matcher_fuzzy と matcher_ignore_globs を使用する(この設定をすると動作が非常に遅くなってしまうのでコメントアウト)
" call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
" 除外するファイル・ディレクトリ
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"        \ [
"        \   '*~', '*.o', '*.exe', '*.bak',
"        \   '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
"        \   '.hg/', '.git/', '.bzr/', '.svn/',
"        \   'tags', 'tags-*'
"        \ ])


" colorscheme
" ---
" ### カラースキームからの変更
" コメント
autocmd ColorScheme * highlight Comment guifg=#909090
" ステータスライン(カレントウィンドウ)
autocmd ColorScheme * highlight StatusLine guifg=#476a8d guibg=#e8e8e3
" ステータスライン(非カレントウィンドウ)
autocmd ColorScheme * highlight StatusLineNC guibg=#e8e8e3
" 対応する括弧
" autocmd ColorScheme * highlight MatchParen guifg=NONE guibg=#00ff00

" 使用するカラースキーム
colorscheme monokai
" colorscheme slate


" options
" ---
" 行番号を表示
set number

" ステータス行の表示
" 2: 常に表示
set laststatus=2

" ステータス行の表示内容
" %f        バッファ内のファイルのパス(入力された通り、またはカレントディレクトリに対する相対パス)
" %=        左寄せ項目と右寄せ項目の区切り。欄 width は指定できない。
"           つまり、これより左に書いてあるものは左寄せで、右側に書いてあるものは右寄せで表示される。
" \         ただの空白。\でエスケープする必要がある。
" %m        修正フラグ。表示されるのは "[+]"。'modifiable' がオフのときは"[-]"。
" %r        読み込み専用フラグ。表示されるのは "[RO]"。
" %h        ヘルプバッファフラグ。表示されるのは "[ヘルプ]"。
" %w        プレビューウィンドウフラグ。表示されるのは "[プレビュー]"。
" %q        "[Quickfix List]"、"[Location List]" または空文字。
" [0x%02.B] カーソル下の文字の文字コードの16進数表現。
"           ゼロパディングする。最低2文字分の長さを使用する。
"           [0xと]は単純にその文字を表示しているだけ。
" %y        バッファ内のファイルのタイプ。例えば "[vim]"。'filetype' を参照。
" %{'['.(&fileencoding!=''?&fileencoding:&encoding).'/'.&fileformat.']'}
"           カレントバッファのファイルの文字エンコーディングと<EOL>(改行コード)を表示する。
"           %{}は間の expression を評価し、結果に置き換える。
"           .は文字列結合を行うようだ。
"           &を使用すると変数の内容を取得できるようだ。
"           ?と:は三項演算子のようだ。
" \ 
" %3.l      何行目にカーソルがあるか。
" /         ただのスラッシュ。
" %3.LL     バッファ内の総行数。末尾のLはただのL。
" ,         ただのカンマ。
" %2.cC     何列目にカーソルがあるか。末尾のCはただのC。
" \ 
" %3.p%%    現在行がファイル内の何％の位置にあるか (CTRL-G と同様)末尾の%%はただの%。
set statusline=%f%=\ %m%r%h%w%q[0x%02.B]%y%{'['.(&fileencoding!=''?&fileencoding:&encoding).'/'.&fileformat.']'}\ %3.l/%3.LL,%2.cC\ %3.p%%

" ファイル内の <Tab> が対応する空白の数
set tabstop=2

" (自動)インデントの各段階に使われる空白の数
" 自動インデントやコマンド "<<", ">>" でずれる幅
set shiftwidth=2

" 挿入モードで <Tab> を挿入するとき、代わりに適切な数の空白を使う
set expandtab

" カーソルの上または下に指定した数の行が表示される
" スクロールする時にカーソルの上下が見えるようにする
set scrolloff=5

" カーソルの外観
" カーソルを点滅させる(それ以外はデフォルト)
set guicursor=n-v-c-sm:block-blinkwait700-blinkon400-blinkoff250,i-ci-ve:ver25-blinkwait700-blinkon400-blinkoff250,r-cr-o:hor20-blinkwait700-blinkon400-blinkoff250


" Key mapping
" ---
" vを二回で行末まで選択
vnoremap v $h
