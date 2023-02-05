"set runtimepath^=~/.vim runtimepath+=~/.vim/after
    "let &packpath = &runtimepath


" __  ____   __ __     _____ __  __ ____   ____
"|  \/  \ \ / / \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /   \ \ / / | || |\/| | |_) | |
"| |  | | | |     \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|      \_/  |___|_|  |_|_| \_\\____|
"
"
"Rossetta
"

""" options
let mapleader=" "
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set nocompatible
set updatetime=100
set shortmess+=c
set number
" set relativenumber
set scrolloff=10
set backspace=indent,eol,start
set ignorecase
set smartcase
set hlsearch
exec "nohlsearch"
set incsearch
set cursorline
set showcmd
set encoding=utf-8
set autochdir
set hidden
set fileencodings=utf-8,ucs-bom,GB2312,big5,gbk
set autoindent
set smartindent
set showmatch
set formatoptions-=tc
set termguicolors
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set ttimeoutlen=0
"set notimeout
set timeoutlen=500
set inccommand=split
set ttyfast "should make scrolling faster
set visualbell
"set colorcolumn=80
set completeopt=noinsert,menuone,noselect

" Prevent auto line split
set wrap
set tw=0

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                    " show a navigable menu for tab completion
set wildmode=longest,list,full

" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

au Filetype python set fileformat=unix
au Filetype python set textwidth=79

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""" keymaps
"分屏
noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sv <c-w>t<c-w>H
noremap sh <c-w>t<c-w>K

"分屏切换
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j

"窗口大小调整
noremap <silent> <c-up> :res +2<CR>
noremap <silent> <c-down> :res -2<CR>
noremap <silent> <c-left> :vertical resize-2<CR>
noremap <silent> <c-right> :vertical resize+2<CR>

"标签
noremap <silent> ti :tabe<CR>
noremap <silent> tl :+tabnext<CR>
noremap <silent> th :-tabnext<CR>

" visual mode to tail of a line
noremap <silent> \v v$h

inoremap jj <esc>
noremap s <NOP>
noremap E :e<space>
noremap q :q<CR>
noremap Q q
noremap <C-q> :q!<CR>
noremap R :source $MYVIMRC<CR>

nnoremap <LEADER>rc :e $MYVIMRC<CR>
nnoremap <LEADER>r :r !
nnoremap <LEADER><CR> :nohlsearch<CR>
"打开侧边文件树
nnoremap <silent> <LEADER>e :Lex 20<CR> 
"open a terminal window
noremap <leader>\ :set splitright<CR>:vsplit<CR>:term<CR>

"复制到剪贴板 - wsl
vnoremap <silent> Y :'<,'>w !clip.exe<CR>
"复制到剪贴板 - linux
vnoremap <silent> Y :'<,'>w !xclip -i -sec c<CR>
" vnoremap Y "+y
"yank to end of this line in normal mode
nnoremap Y y$

"缩进
nnoremap < <<
nnoremap > >>

"改变大小写
noremap ` ~

noremap fl :r !figlet<space>
noremap ; :
noremap <F5> :call CompileRunGcc()<CR>

"inc number and dec number
nnoremap <silent> + <c-a>
nnoremap <silent> _ <c-x>

"光标快速移动
noremap <silent> J 7j
noremap <silent> K 7k
noremap <silent> H 7h
noremap <silent> L 7l

"查找下一个
noremap = nzz
noremap - Nzz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
autocmd VimEnter * :source $MYVIMRC

" 全局替换
noremap \s :%s//g<left><left>

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!google-chrome-stable % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc


"" ____  _             _
""|  _ \| |_   _  __ _(_)_ __  ___
""| |_) | | | | |/ _` | | '_ \/ __|
""|  __/| | |_| | (_| | | | | \__ \
""|_|   |_|\__,_|\__, |_|_| |_|___/
""               |___/
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
"starus
Plug 'vim-airline/vim-airline'
" Plug 'liuchengxu/eleline.vim'
Plug 'mg979/vim-xtabline'

Plug 'scrooloose/nerdcommenter' 

Plug 'kevinhwang91/rnvimr', {'on': 'RnvimrToggle'}
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'Yggdroot/leaderF', { 'do': ':LeaderfInstallCExtension' }
"autocomplete indent
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'davidhalter/jedi-vim'
Plug 'honza/vim-snippets'
" highlight for python
Plug 'Raimondi/delimitMate'  "自动补全括号

"color theme
"Plug 'ajmwagar/vim-deus'
Plug 'sainnhe/sonokai'
"Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
" Initialize plugin system
call plug#end()


"nerdcommenter config
let g:NERDSpaceDelims=1
noremap <silent> <leader>/ :call nerdcommenter#Comment('n', 'toggle')<CR>

">>> colortheme
" color snazzy
" let g:SnazzyTransparent = 1

color everforest
" color sonokai
let g:sonokai_transparent_background = 1
"
" rainbow config
let g:rainbow_active = 1

"""

" ======================================

"" _____ __________
""|  ___|__  /  ___|
""| |_    / /| |_
""|  _|  / /_|  _|
""|_|   /____|_|

" ===
" === FZF
" ===
nnoremap <c-p> :Files<CR>
" nnoremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
nnoremap <LEADER>; :History:<CR>
nnoremap <LEADER>m :Maps<CR>
nnoremap <c-b> :Commands<CR>
nnoremap ? :Lines<CR>
nnoremap <c-f> :Ag<CR>
" nnoremap / :Lines<CR>


let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" python-provider
"let g:python3_host_prog = '/home/rossetta/miniconda3/envs/dl/bin/python'

let g:indentLine_char='|'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#2F4F4F'
"let g:indentLine_bgcolor_gui = '#2F4F4F'

