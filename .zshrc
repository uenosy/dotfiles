export LANG=ja_JP.UTF-8
# 色を使用出来るようにする
autoload -Uz colors
colors
# vi 風キーバインドにする
bindkey -v
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
local p_whoami="%n@%m"
local p_pwd="%F{yellow}%~%f"
local p_prompt="%(?.%F{green}(*'-') < %f.%F{red}(#;_;%) < %f)"
PROMPT="$p_whoami $p_pwd
$p_prompt %B%#%b "
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

zstyle ':completion:*' list-colors ''
########################################
# vcs_info

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{blue}%1v%f|)"


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

setopt correct
########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# sidekiq
# start
alias skstart='bundle exec sidekiq -C config/sidekiq.yml'

# stop
alias skstop='kill -TERM $(<tmp/pids/sidekiq.pid)'

# less
alias lrf='less -R +F'
alias lf='less +F'

alias hs='history 1 | grep '
alias reload='source ~/.zshrc'
alias gip="curl -s checkip.dyndns.org | sed -e 's/^.*Current IP Address: //' -e 's/<.*$//'"
########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ll='ls -l'
which rbenv > /dev/null && eval "$(rbenv init -)"
export PATH="/usr/local/sbin:~/.composer/vendor/bin:$(brew --prefix homebrew/php/php54)/bin:$HOME/.nodebrew/current/bin:$PATH:/usr/local/share/git-core/contrib/diff-highlight"
alias vim='mvim -v'
export PGDATA=/usr/local/var/postgres
# export RUBYGEMS_GEMDEPS=-
# vim:set ft=zsh:

if [ -f $(brew --prefix)/etc/brew-wrap ];then
    source $(brew --prefix)/etc/brew-wrap
fi
export GOROOT=/usr/local/Cellar/go/1.7.1/libexec
export GOPATH=/opt/vuls/go
export PATH=$PATH:$GOROOT:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
