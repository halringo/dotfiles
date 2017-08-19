# .zshrc
# ===

export LANG=ja_JP.UTF-8

# autoload
# ---
# 関数の自動読み込み
# ### オプション
# `-U`
# - 関数ロード時にユーザーが定義したエイリアスを展開しない
# `-z`
# - 関数を zsh 形式で読み込む

# 色を使用出来るようにする
autoload -Uz colors
colors

# 補完機能を有効にする
autoload -Uz compinit
compinit

# プロンプト
# DEFAULT=$'\U2600 ' # BLACK SUN WITH RAYS
# ERROR=$'\U2601 '   # CLOUD
# ERROR=$'\U2602 '   # UMBRELLA

# 左
PROMPT="
%F{yellow}[%~]%f
%n@%m %(?.%#.%F{red}%#%f) "
# %n@%m %(?.%#.%F{blue}${ERROR}%f %F{red}%#%f) "
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

# ディレクトリスタックのサイズ
DIRSTACKSIZE=20


# Options
# ---
# cd で移動したディレクトリを自動でディレクトリスタックに push する
setopt auto_pushd

# 重複したディレクトリはディレクトリスタックに push しない
setopt pushd_ignore_dups

# Tab キーを連続で押すと自動的にメニュー補完を使用する
# デフォルトで有効
setopt auto_menu

# 同時に起動されている Zsh の間で履歴を共有する
setopt share_history

# コマンドのスペル修正を行う(もしかして)
setopt correct

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ZLE でビープ音を鳴らさない
# unsetopt beep と同じ
setopt no_beep


# alias
# ---
# ### ll
# `-a`
# - `.` ではじまるファイルを含め、ディレクトリ中のすべてのファイルをリスト表示する
# `-l`
# - 詳細表示
# `-h`
# - サイズを人間が読みやすい形式で表示する
# `-G`
# - 色付けする
alias ll='ls -alhG'


# パス
# export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin"

# Homebrew
# export PATH=/usr/local/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
