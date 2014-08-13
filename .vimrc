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
set listchars=tab:»\ ,trail:«,extends:›,precedes:‹

" ステータスライン
set statusline=%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'/'.&ff.']'}\ %3.lL,%2.v\ /%3.LL\ %P

" カレント行ハイライトON
set cursorline

" 自動インデント
set autoindent

" タブ
set tabstop=2  " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントやコマンド "<<", ">>" でずれる幅

" スクロールする時に上下が見えるようにする
set scrolloff=5

" ビープ音を鳴らさない
set visualbell t_vb=


" Plugin
" =====

" neocomplete
" ---
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

