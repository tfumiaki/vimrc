"""""""""""""""""""""""""""""""""
"memo
"$VIMに配置してください。
""""""""""""""""""""""""""""""""""

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
NeoBundle 'cohama/vim-insert-linenr'
NeoBundle 'Align'
NeoBundle 'PProvost/vim-ps1'
"プラグイン導入後の後処理
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

""""""""""""""""""""""""""""""
"一般設定
""""""""""""""""""""""""""""""
set autoindent

set clipboard=unnamed

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

set number

set cursorline

" デフォルトvimrc_exampleのtextwidth設定上書き
autocmd FileType text setlocal textwidth=0
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
noremap <C-j> <Esc>
noremap! <C-j> <Esc>
noremap <C-Tab> <C-o>      "前カーソル位置への移動

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""
"undo履歴クリア関数
""""""""""""""""""""""""""""""""
command -nargs=0 ClearUndo call <sid>ClearUndo()
function! s:ClearUndo()
  let old_undolevels = &undolevels
  set undolevels=-1
  exe "normal a \<BS>\<Esc>"
  let &undolevels = old_undolevels
  unlet old_undolevels
endfunction

"""""""""""""""""""""""""""""""""
"Alignの日本語向け設定
""""""""""""""""""""""""""""""""
:let g:Align_xstrlen = 3

"""""""""""""""""""""""""""""""""
"vimgrepのエラーファイルを読み込む設定
""""""""""""""""""""""""""""""""
command -complete=file -nargs=1 GetQuickfixFile call GetQuickfixFile(<f-args>)
function GetQuickfixFile(filename)
  let l:orgErrorformat = &errorformat
  let &errorformat='%f\|%l\ col\ %c\|\ %m'
  execute 'cfile ' . a:filename
  copen
  let &errorformat=l:orgErrorformat
endfunction

