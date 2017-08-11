" .gvimrc

" General
" =====

" フォント
" Mac なら下記の設定でも上手く表示される
" 本当は幅が2倍で同じ高さのフォントを指定しなければならない？
set guifont=Source\ Code\ Pro:h14
set guifontwide=Migu\ 1M\ Regular:h14

" 下記のようにウエイトを指定することも可能
" set guifont=Source\ Code\ Pro\ Light:h12


" ウィンドウ幅
" set columns=207
set columns=237

" ウィンドウ高さ
" set lines=55
set lines=63

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
" highlight CursorLine gui=underline guifg=NONE guibg=NONE guisp=DarkGray

" プリプロセッサ命令
highlight PreProc guibg=NONE

" コメント
highlight Comment guifg=#999999

" IM ON の時のカーソル
highlight CursorIM guibg=red
