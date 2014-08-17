" .vimrc

" NeoBundle
" =====
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" 便利
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'

" ファイル
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'

" 補完
NeoBundle 'Shougo/neocomplete.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" General
" =====

" 行番号表示
set number

" 不可視文字表示
set list

" 不可視文字を表示する文字
set listchars=tab:›\ ,trail:∙,extends:»,precedes:«

" ステータスライン
set statusline=%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'/'.&ff.']'}\ %3.lL,%2.v\ /%3.LL\ %P

" カレント行ハイライトON
set cursorline

" 入力途中のコマンドを表示
set showcmd

" タイムアウト(マッピングはタイムアウトしない。キーコードは0.1秒でタイムアウトする)
set notimeout
set ttimeout
set ttimeoutlen=100

" 履歴に保存される項目の数
set history=1000

" 自動インデント
set autoindent

" タブ
set tabstop=2  " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントやコマンド "<<", ">>" でずれる幅

" スクロールする時に上下が見えるようにする
set scrolloff=5

" ビープ音を鳴らさない
set visualbell t_vb=


" mapping
" =====


" Plugin
" =====

" neocomplete
" ---
" Use neocomplete.
let g:neocomplete#enable_at_startup=1

