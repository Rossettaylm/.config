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
"Editor Setup
" syntax on
"

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

"分屏
map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sv <c-w>t<c-w>H
map sh <c-w>t<c-w>K

noremap <LEADER>h <c-w>h
noremap <LEADER>l <c-w>l
noremap <LEADER>k <c-w>k
noremap <LEADER>j <c-w>j
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"标签
map ti :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>


" visual mode to tail of a line
noremap <silent> \v v$h

inoremap jj <esc>
map s <NOP>
nmap S ^C
map E :e<space>
noremap q :q<CR>
noremap Q q
noremap <C-q> :q!<CR>
noremap <LEADER>q :qa!<CR>
map R :source $MYVIMRC<CR>
nnoremap <LEADER>rc :e $MYVIMRC<CR>
nmap <LEADER>r :r !
"vnoremap Y :w !xclip -i -sel c<CR>
"
"yank to clipboard in visual mode
vnoremap Y "+y
"yank to end of this line in normal mode
nnoremap Y y$

nnoremap < <<
nnoremap > >>


" Press ` to change case (instead of ~)
map ` ~

map fl :r !figlet<space>
noremap ; :
map W :w!<cr>
nmap <LEADER>o o<ESC>
map <F5> :call CompileRunGcc()<CR>
nmap <LEADER>a :CocAction<CR>

"go to the end/start of line
" noremap <silent> <C-j> 0
" noremap <silent> <C-l> $
"
"inc number and dec number
nnoremap <silent> + <c-a>
nnoremap <silent> _ <c-x>

noremap <silent> J 7j
noremap <silent> K 7k
noremap <silent> H 7h
noremap <silent> L 7l

noremap = nzz
noremap - Nzz
nnoremap <LEADER><CR> :nohlsearch<CR>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
autocmd VimEnter * :source $MYVIMRC

" find and replace
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


"open a terminal window
noremap <leader>/ :set splitright<CR>:vsplit<CR>:term<CR>



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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

">>> colortheme
" color snazzy
" let g:SnazzyTransparent = 1

color sonokai
let g:sonokai_transparent_background = 1
"
"
" rainbow config
let g:rainbow_active = 1


" vim-translator-youdao
vnoremap <silent> ts :<C-u>Ydv<CR>
nnoremap <silent> ts :<C-u>Ydc<CR>
noremap <leader>ts :<C-u>Yde<CR>


"""
"""  ===
"  ____ ___   ____   _   ___     _____ __  __
" / ___/ _ \ / ___| | \ | \ \   / /_ _|  \/  |
"| |  | | | | |     |  \| |\ \ / / | || |\/| |
"| |__| |_| | |___ _| |\  | \ V /  | || |  | |
" \____\___/ \____(_)_| \_|  \_/  |___|_|  |_|
"
"""
let g:coc_global_extensions = [
    \'coc-vimlsp',
    \'coc-sh',
    \'coc-json',
    \'coc-prettier',
    \'coc-pyright',
    \'coc-snippets',
    \'coc-marketplace']


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use shift+tab to get all completion
inoremap <silent><expr> <s-tab> coc#refresh()

" Use `<space>-` and `<space>+` to navigate diagnostics
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> gt <Plug>(coc-type-definition)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gm <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Use <c-h> to show documentation in preview window.
nnoremap <silent> <c-h> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Symbol renaming.
nmap <LEADER>rn <Plug>(coc-rename)

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


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


"=== rnvimr config
tnoremap <silent> <c-r> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> tt :RnvimrToggle<CR>

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Disable a border for floating window
let g:rnvimr_draw_border = 1
" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 0
" Change the border's color
let g:rnvimr_border_attr = {'fg': 8, 'bg': -1}
" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1
" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70
" Draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<c-o>': 'NvimEdit tabedit',
            \ 'sj': 'NvimEdit split',
            \ 'sl': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }


" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }

" Customize multiple preset layouts
" '{}' represents the initial layout
let g:rnvimr_presets = [
            \ {'width': 0.600, 'height': 0.600},
            \ {},
            \ {'width': 0.800, 'height': 0.800},
            \ {'width': 0.950, 'height': 0.950},
            \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0},
            \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0.5},
            \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0},
            \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0.5},
            \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
            \ {'width': 0.500, 'height': 1.000, 'col': 0.5, 'row': 0},
            \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0},
            \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0.5}
            \ ]



" python-provider
"let g:python3_host_prog = '/home/rossetta/miniconda3/envs/dl/bin/python'

"  coc-snippets
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
let g:snips_author = 'Rossetta'
let g:snips_email = '2441197035ylm@gmail.com'
let g:snips_github = 'https://github.com/Rossettaylm'


let g:indentLine_char='|'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#2F4F4F'
"let g:indentLine_bgcolor_gui = '#2F4F4F'

