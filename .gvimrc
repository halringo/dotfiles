" .gvimrc

" General
" =====

" フォント
set guifont=Ricty\ Diminished\ Regular:h14

" ウィンドウ幅
set columns=240

" ウィンドウ高さ
set lines=70

" ウィンドウ透明度(0=不透明 100=透明)
set transparency=15


" Color
" =====

" カラースキーム
colorscheme slate

" カレント行ハイライト(アンダーライン)
highlight CursorLine gui=underline guifg=NONE guibg=NONE guisp=DarkGray

" プリプロセッサ命令
highlight PreProc guibg=NONE

" IME ON の時のカーソル
highlight CursorIM guibg=red
