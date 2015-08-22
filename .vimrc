" .vimrc

" NeoBundle
" =====
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

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
NeoBundle 'scrooloose/nerdtree'

" 補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'  " 下の方で call している
NeoBundle 'tyru/caw.vim'
NeoBundle 'AndrewRadev/switch.vim'

" HTML
NeoBundle 'mattn/emmet-vim'

" 移動
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'Lokaltog/vim-easymotion'

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
set listchars=tab:›\ ,trail:‹,extends:»,precedes:«

" ステータスライン
set statusline=%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'/'.&ff.']'}\ %3.lL,%2.v\ /%3.LL\ %P

" カレント行ハイライトON
" set cursorline

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
set expandtab  " 半角スペースでインデントを行う。タブ文字を挿入したいときは CTRL-V<Tab> を使う。

" スクロールする時に上下が見えるようにする
set scrolloff=5

" ビープ音を鳴らさない
set visualbell t_vb=

" スワップファイルを作成しない
set noswapfile

" バックアップファイルを作成しない
set nobackup

" undofile を作成しない
set noundofile


" script
" =====
" matchit.vim
source $VIMRUNTIME/macros/matchit.vim


" mapping
" =====
" v を2回で行末まで選択
vnoremap v $h


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
" ---
nnoremap [vimfiler] <Nop>
nmap <Space>f [vimfiler]

nnoremap <silent> [vimfiler]c :<C-u>VimFilerCurrentDir<CR>
nnoremap <silent> [vimfiler]b :<C-u>VimFilerBufferDir<CR>


" neocomplete
" ---
" Use neocomplete.
let g:neocomplete#enable_at_startup=1


" Neosnippet
" ---
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" vim-smartinput-endwise
" ---
call smartinput_endwise#define_default_rules()


" caw.vim
" ---
nnoremap [caw] <Nop>
nmap <Space>c [caw]

vnoremap [caw] <Nop>
vmap <Space>c [caw]

nmap <silent> [caw]i <Plug>(caw:i:toggle)
vmap <silent> [caw]i <Plug>(caw:i:toggle)
nmap <silent> [caw]a <Plug>(caw:a:toggle)
vmap <silent> [caw]a <Plug>(caw:a:toggle)
nmap <silent> [caw]w <Plug>(caw:wrap:toggle)
vmap <silent> [caw]w <Plug>(caw:wrap:toggle)

" 行末にコメントを挿入する時に記号の左側に入る文字
let g:caw_a_sp_left="  "


" Emmet-vim
" ---
" すべてのファイルタイプで有効にしない
let g:user_emmet_install_global=0

" 有効にするファイルタイプを指定する
autocmd FileType html,css,eruby EmmetInstall

" trigger key 変更
" let g:user_emmet_leader_key='<C-k>'

" html:5 日本語化
" インデント変更
let g:user_emmet_settings={
\ 'lang': 'ja',
\ 'indentation': '  '
\}


" switch.vim
" ---
nmap <Space>s :Switch<CR>


" NERD tree
" ---
nnoremap [NERDtree] <Nop>
nmap <Space>n [NERDtree]

nnoremap <silent> [NERDtree]n :<C-u>NERDTree<CR>
nnoremap <silent> [NERDtree]t :<C-u>NERDTreeToggle<CR>
nnoremap <silent> [NERDtree]m :<C-u>NERDTreeMirror<CR>
nnoremap <silent> [NERDtree]w :<C-u>NERDTreeClose<CR>
nnoremap <silent> [NERDtree]i :<C-u>NERDTreeFind<CR>
nnoremap <silent> [NERDtree]c :<C-u>NERDTreeCWD<CR>
nnoremap <silent> [NERDtree]f :<C-u>NERDTreeFocus<CR>

" デフォルトで隠しファイルを表示する
let NERDTreeShowHidden=1


" clever-f.vim
" ---
let g:clever_f_mark_char_color="Error"


" EasyMotion
" ---
map <Leader> <Plug>(easymotion-prefix)
