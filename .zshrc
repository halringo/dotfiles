# Created by newuser for 5.0.5

export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# 補完機能を有効にする
autoload -Uz compinit
compinit

# プロンプト
# DEFAULT=$'\U2600 ' # BLACK SUN WITH RAYS
# ERROR=$'\U2601 '   # CLOUD
ERROR=$'\U2602 '   # UMBRELLA

# 左
PROMPT="
%F{yellow}[%~]%f
%n@%m %(?.%#.%F{blue}${ERROR}%f %F{red}%#%f) "
# %n@%m %(?.%#.%F{red}%#%f) "
# %n@%m %(?.%#.${ERROR} %F{red}%#%f) "
# %n@%m %(?.${DEFAULT}.${ERROR}) "

# 右
RPROMPT="%F{green}%*%f"

# %# rootなら #、そうでなければ %
# %F{色}%f 文字色

# もしかして
#   No    コマンドを訂正せずに実行する。
#   Yes   コマンドを「もしかして」の通りに訂正して実行する。
#   Abort コマンドの実行を中止する。
#   Edit  コマンドを編集する。
SPROMPT="%F{blue}もしかして: %r%f [No/Yes/Abort/Edit] -> "

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# コマンド名の訂正(もしかして)
setopt correct

# cd したディレクトリを記録する
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# ビープ音を鳴らさない
setopt no_beep
setopt nolistbeep

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# alias
alias ll='ls -aGlh'

# パス
# export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin"

# Homebrew
# export PATH=/usr/local/bin:$PATH

# rbenv
eval "$(rbenv init -)"
