"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" カラーテーマ
call dein#add('tomasr/molokai') 
call dein#add('jacoborus/tender.vim')

" 横にディレクトリツリーを表示
call dein#add('preservim/nerdtree')

" インデント
call dein#add('Yggdroot/indentLine')

" 入力補完
call dein#add('neoclide/coc.nvim')

" Emmet
call dein#add('mattn/emmet-vim')

" HTML
call dein#add('othree/html5.vim')

" JavaScript
call dein#add('pangloss/vim-javascript')
call dein#add('othree/yajs.vim')
call dein#add('othree/es.next.syntax.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" 基本設定
set number
set title
set showmatch
syntax on
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set list listchars=tab:>- " 不可視文字の表示

colorscheme tender

" キーマップ
" Ctrl+eでNERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Emmet-vim設定
let g:user_emmet_settings = {
\  'variables' : {
\    'lang' : "ja"
\  },
\  'html' : {
\    'indentation' : '  ',
\    'snippets' : {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\        ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
\        ."\t<title>Document</title>\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>",
\    }
\  }
\}
