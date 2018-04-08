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
  " call dein#add('cohama/lexima.vim')
  call dein#add('tyru/caw.vim')
  call dein#add('tpope/vim-surround')

  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  " インターフェイス
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim') " 最近開いたファイル
  call dein#add('Shougo/neoyank.vim') " ヤンク履歴

  " シンタックスハイライト
  call dein#add('slim-template/vim-slim')

  " カラースキーム
  call dein#add('crusoexia/vim-monokai')

  " Git
  call dein#add('tpope/vim-fugitive')

  " 検索
  call dein#add('mileszs/ack.vim')

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
" Change file/rec command.
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

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


" ack.vim
" ---
" ack ではなく ag を使用する
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" colorscheme
" ---
" ### カラースキームからの変更
" Normal
autocmd ColorScheme * highlight Normal guibg=#000000
" 行番号
autocmd ColorScheme * highlight LineNr guibg=#000000
" カーソルがある画面上の行を強調
autocmd ColorScheme * highlight CursorLine guibg=#303030
" "nbsp", "space", "tab" and "trail" in 'listchars'
autocmd ColorScheme * highlight Whitespace guifg=#ff0000
" コメント
autocmd ColorScheme * highlight Comment guifg=#909090
" ステータスライン(カレントウィンドウ)
autocmd ColorScheme * highlight StatusLine guifg=#476a8d guibg=#e8e8e3
" ステータスライン(非カレントウィンドウ)
autocmd ColorScheme * highlight StatusLineNC guibg=#e8e8e3
" 対応する括弧
autocmd ColorScheme * highlight MatchParen guibg=#ff0000
" autocmd ColorScheme * highlight MatchParen guifg=NONE guibg=#00ff00

" denite フィルタにマッチした文字の色
autocmd ColorScheme * highlight deniteMatchedChar guifg=#ff0000 guibg=NONE
" denite プレビューウィンドウのハイライト
autocmd ColorScheme * highlight denitePreviewLine guibg=#404040
" autocmd ColorScheme * highlight denitePreviewLine gui=underline

" 使用するカラースキーム
colorscheme monokai
" colorscheme slate


" options
" ---
" マウスを利用可能にする
" set mouse=a

" 行番号を表示
set number

" 不可視文字を表示
set list
" デフォルトの不可視文字設定
" listchars=tab:> ,trail:-,nbsp:+

" ステータス行の表示
" 2: 常に表示
set laststatus=2

" ステータス行の表示内容
" %f        バッファ内のファイルのパス(入力された通り、またはカレントディレクトリに対する相対パス)
" %m        修正フラグ。表示されるのは "[+]"。'modifiable' がオフのときは"[-]"。
" %=        左寄せ項目と右寄せ項目の区切り。欄 width は指定できない。
"           つまり、これより左に書いてあるものは左寄せで、右側に書いてあるものは右寄せで表示される。
" \         ただの空白。\でエスケープする必要がある。
" %r        読み込み専用フラグ。表示されるのは "[RO]"。
" %h        ヘルプバッファフラグ。表示されるのは "[ヘルプ]"。
" %w        プレビューウィンドウフラグ。表示されるのは "[プレビュー]"。
" %q        "[Quickfix List]"、"[Location List]" または空文字。
" %{fugitive#statusline()}
"           現在のブランチと現在編集されているファイルのコミットを含むインジケータを取得します。
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
set statusline=%f%m%=\ %r%h%w%q%{fugitive#statusline()}%y%{'['.(&fileencoding!=''?&fileencoding:&encoding).'/'.&fileformat.']'}\ %3.l/%3.LL,%2.cC\ %3.p%%

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

" bracketed paste を無効にする
" set t_BE=

" カーソルがある画面上の行を強調
" set cursorline


" Key mapping
" ---
" v を二回で行末まで選択
vnoremap v $h

" Mac のショートカットと同じキーで左右移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" ### Denite
" :Denite だけ入力
nnoremap <Space>d :Denite
" resume
nnoremap <Space>dd :Denite<Space>-resume<CR>
" バッファ
nnoremap <Space>db :Denite<Space>buffer<CR>
" changes
nnoremap <Space>dc :Denite<Space>change<CR>
" command history
nnoremap <Space>dh :Denite<Space>command_history<CR>
" カレントディレクトリ以下のディレクトリ
nnoremap <Space>di :Denite<Space>directory_rec<CR>
" カレントディレクトリのみのファイル
nnoremap <Space>df :Denite<Space>file<CR>
" カレントディレクトリ以下のファイル
nnoremap <Space>dr :Denite<Space>file_rec<CR>
" カレントディレクトリ以下の grep (ag)
nnoremap <Space>dg :Denite<Space>grep<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
" 最近開いたファイル
nnoremap <Space>dm :Denite<Space>file_mru<CR>
" ヤンク履歴
nnoremap <Space>dy :Denite<Space>neoyank<CR>

" 以前のバッファで次の候補をすぐに開く
nnoremap <Space>dn :Denite<Space>-resume<Space>-cursor-pos=+1<Space>-immediately<CR>
" 以前のバッファで前の候補をすぐに開く
nnoremap <Space>dp :Denite<Space>-resume<Space>-cursor-pos=-1<Space>-immediately<CR>

" Rails grep
nnoremap <Space>rag :Denite<Space>grep<Space>-path=app/assets<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>rcg :Denite<Space>grep<Space>-path=app/controllers<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>rhg :Denite<Space>grep<Space>-path=app/helpers<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>rig :Denite<Space>grep<Space>-path=app/mailers<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>rmg :Denite<Space>grep<Space>-path=app/models<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>rvg :Denite<Space>grep<Space>-path=app/views<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>

" Rails RSpec grep
nnoremap <Space>scg :Denite<Space>grep<Space>-path=spec/controllers<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>sfg :Denite<Space>grep<Space>-path=spec/factories<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>shg :Denite<Space>grep<Space>-path=spec/helpers<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>slg :Denite<Space>grep<Space>-path=spec/lib<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>sig :Denite<Space>grep<Space>-path=spec/mailers<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>smg :Denite<Space>grep<Space>-path=spec/models<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>srg :Denite<Space>grep<Space>-path=spec/requests<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>ssg :Denite<Space>grep<Space>-path=spec/support<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
nnoremap <Space>svg :Denite<Space>grep<Space>-path=spec/views<Space>-auto-preview<Space>-highlight-preview-line=denitePreviewLine<CR>
