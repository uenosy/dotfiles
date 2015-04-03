set nocompatible

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
filetype plugin indent on
NeoBundleCheck

set background=dark
colorscheme solarized

" 表示系
" 行番号表示
set number
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" カーソルの上または下に表示する最小限の行数
set scrolloff=3
" ファイル名表示
set title
" 制御文字表示 
set list
set listchars=tab:▸␣,trail:␣,eol:↵,extends:»,precedes:«,nbsp:␥
" コマンド行表示
set cmdheight=2
" ステータス行表示
set laststatus=2
set statusline=%<[%n]%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%F\%m%r%h%w%=%y\ %l,%c%V%8P
" モードでステータス行の色変更
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
" 入力中のコマンド表示
set showcmd
" 現在のモード表示
set showmode
" 対応するカッコの表示
set showmatch
" シンタックスハイライト
syntax on

" 動作
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2 shiftwidth=2 softtabstop=0
"補完候補を表示する
set wildmenu
" OSのクリップボードを共有する
set clipboard=unnamed
" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread
" 保存しないで他のファイルを表示することが出来るようにする
set hidden
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" ビープ音 ビジュアルベルを使用しない
set vb t_vb=
" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  <  - [←]        ノーマルモード ビジュアルモード
"  >  - [→]         ノーマルモード ビジュアルモード
"  [ - [←]         挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,<,>,[,],~

highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" swpとバックアップファイルの保存場所
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

" Search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
