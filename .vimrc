" .vimrc

" NeoBundle
" =====
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

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

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'

" 便利
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

" 補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'kana/vim-smartinput'

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
set shiftwidth=2  " 自動インデントやコマンド <<, >> でずれる幅

" スクロールする時に上下が見えるようにする
set scrolloff=5

" ビープ音を鳴らさない
set visualbell t_vb=


" mapping
" =====


" Plugin
" =====

" Unite
" ---
nnoremap [unite] <Nop>
nmap <Space>u [unite]

nnoremap <silent> [unite]u :<C-u>Unite buffer bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir file<CR>
nnoremap <silent> [unite]g :<C-u>Unite register<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>

" Start insert. (挿入モードで開始する)
call unite#custom#profile('default', 'context', {
\   'start_insert': 1
\ })

" matchers - あいまい検索
call unite#custom#source('file,file/new,buffer,file_rec',
\ 'matchers', 'matcher_fuzzy')

" sorters - 一致した順に並べる
call unite#custom#source('buffer,file,file_rec',
\ 'sorters', 'sorter_rank')


" Vimfiler
" -----
nnoremap [vimfiler] <Nop>
nmap <Space>f [vimfiler]

nnoremap <silent> [vimfiler]c :<C-u>VimFilerCurrentDir<CR>
nnoremap <silent> [vimfiler]b :<C-u>VimFilerBufferDir<CR>


" neocomplete
" ---
" Use neocomplete.
let g:neocomplete#enable_at_startup=1

