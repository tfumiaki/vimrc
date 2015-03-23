"""""""""""""""""""""""""""""""""""
"NeoBundleの設定
"""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=$VIM/_vim/bundle/neobundle.vim
  "call neobundle#rc(expand('$VIM/_vim/bundle'))
endif 

call neobundle#begin(expand('$VIM/_vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

"プラグイン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'tpope/vim-surround'

NeoBundleCheck

filetype plugin indent on

""""""""""""""""""""""""""""""""""""
"テンポラリファイルの設定
""""""""""""""""""""""""""""""""""""
set backupdir=$VIM/_vimtmp/backup
set directory=$VIM/_vimtmp/swap
set undodir=$VIM/_vimtmp/undo


"""""""""""""""""""""""""""""""
"ステータスバー表示の設定
"""""""""""""""""""""""""""""""
"ステータスバーにエンコード表示。nyan-modokiと衝突する
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"nyan-modokiの設定
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 4
let g:nayn_modoki_animation_enabled= 1

""""""""""""""""""""""""""""""""
"NeoCompleteの設定
""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""
"全角空白に色を付ける
""""""""""""""""""""""""""""""""
scriptencoding utf-8 "これ入れないと下記が反映されない
augroup highlightZenkakuSpace "全角スペースを赤色にする
  autocmd!
  autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=darkgrey guibg=darkgrey
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END

"""""""""""""""""""""""""""""""""
"キーマップ設定
"""""""""""""""""""""""""""""""""
nmap U <C-r>

