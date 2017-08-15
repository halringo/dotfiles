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
  call dein#add('Shougo/denite.nvim')
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  " カラースキーム
  call dein#add('crusoexia/vim-monokai')

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


" 使用するカラースキーム
colorscheme monokai
" colorscheme slate

" 行番号を表示する
set number
