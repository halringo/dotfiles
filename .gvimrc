" .gvimrc

" General
" =====

" フォント
set guifont=Ricty\ Diminished\ Regular:h14

" ウィンドウ幅
set columns=270

" ウィンドウ高さ
set lines=76

" ウィンドウ透明度(0=不透明 100=透明)
set transparency=15

" 日本語入力(IM)自動オン/オフを無効にする
" 挿入モードで日本語入力時にIMが自動でOFFになってしまうことがあるのでその対策
set imdisable


" Color
" =====

" カラースキーム
colorscheme slate

" カレント行ハイライト(アンダーライン)
highlight CursorLine gui=underline guifg=NONE guibg=NONE guisp=DarkGray

" プリプロセッサ命令
highlight PreProc guibg=NONE

" コメント
highlight Comment guifg=#999999

" IM ON の時のカーソル
highlight CursorIM guibg=red
