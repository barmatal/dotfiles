" Detect system {{{
set nocompatible        " be iMproved, required
filetype off            " required

" TODO: Detect when SSH
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "windows"
    else 
        let g:os = "unix"
    endif
endif

" }}}

" Vundle configuration {{{
if(g:os == "windows")
    set rtp+=$HOME\vimfiles\bundle\Vundle.vim
    call vundle#begin('$HOME\vimfiles\bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" Basic plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidoc/taskpaper.vim'

" Visual plugins
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'godlygeek/tabular'

" Functionality plugins
Plugin 'kshenoy/vim-signature'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'gabrielelana/vim-markdown'
Plugin 'vim-scripts/vim-auto-save' 
Plugin 'djoshea/vim-autoread' 
Plugin 'barmatal/vim-ledger'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'tpope/vim-speeddating'

" Programming plugins
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Lazy Redraw (performance)
set lazyredraw

" Editor options {{{

" Space is leader
let mapleader=" "

" Ledger mappings
autocmd FileType ledger noremap <buffer> <Leader>la :LedgerAlign<CR>
autocmd FileType ledger noremap <buffer> <Leader>lb :Ledger bal 
autocmd FileType ledger noremap <buffer> <Leader>lr :Ledger register 
autocmd FileType ledger noremap <buffer> <Leader>lc :call ledger#transaction_state_toggle(line('.'), ' !')<CR>

autocmd FileType ledger inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
autocmd FileType ledger vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>

" Taskpaper mappings
autocmd filetype taskpaper nmap <buffer> <leader>d <leader>td
autocmd filetype taskpaper nmap <buffer> <leader>a <leader>tD
autocmd filetype taskpaper nmap <buffer> <leader>m <leader>tm
autocmd filetype taskpaper nmap <buffer> <leader>s <leader>ts

let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_decimal_sep = ","
let g:ledger_winpos = 'B'

let g:auto_save_in_insert_mode = 0
let g:auto_save = 1
let g:auto_save = 1

set shortmess=aoOtI
set autochdir
set rnu        " Display relative line number
set number        " Display line number
set ai            " Smart indent for lists
set encoding=UTF-8
set hidden        " Improve buffer management
set wrap        " enable line wrap
set linebreak     " wrap only whole words
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set expandtab
" set smarttab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Smart split
set splitbelow
set splitright

nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>a

set autoindent    " always set autoindenting on
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set novisualbell    " don't beep
set noerrorbells  " don't beep
set nobackup    " no backup
set noswapfile    " no swap file
set wildmenu    " better autocomplete of commands
set wildmode=longest:list,full
set lazyredraw    " redraw only when we need to.
set foldenable    " enable folding
set foldmethod=syntax " enable folding in code
set foldlevel=3   " Start with 3 level folding
set laststatus=2  " To make airline work
set ttimeoutlen=50
runtime macros\matchit.vim
                  " Use % to match tags
set diffopt+=vertical
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype on
filetype indent on
" Change icon in different modes
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
" Do not add end of line to documents
set noeol
" }}}

" Hotkey Remapping {{{

" jj switches mode
inoremap jj <Esc>
" browse tabs
nmap <leader>j :bn<cr>
nmap <leader>x :bd<cr>
nmap <leader>X :bd!<cr>

" Fix wrong accented words
inoremap 'á á
inoremap 'é é
inoremap 'í í
inoremap 'ó ó
inoremap 'ú ú
inoremap 'Á Á
inoremap 'É É
inoremap 'Í Í
inoremap 'Ó Ó
inoremap 'Ú Ú
inoremap "ü ü
inoremap "Ü Ü

" Smart wrap line navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" , starts command mode
" nnoremap , :
" Mark management
nnoremap mn ]'
nnoremap mN ['
" Easy window navigation
map <leader>w <C-w>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-n> <C-w>v


" Easy copy paste to clipboard
noremap <Leader>p "*p
noremap <Leader>y "*y

" CTRL-X Cut
vnoremap <C-X> "+x

" CTRL-C Copy
vnoremap <C-C> "+y

" CTRL-V Paste
imap <C-V>       <ESC>"+gPa
map <C-V>       "+gP

" backspace working
set backspace=2

" remove gui options
set guioptions-=m
set guioptions-=M

" markdown disable spellchecking
let g:markdown_enable_spell_checking = 0

" Move lines using alt
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
nnoremap <A-l> >>
nnoremap <A-h> <<

vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>
" ctrlp Remapping
let g:ctrlp_map = '<c-p>'
" Quickly edit/reload the vimrc file
nmap <silent> <leader>re :e $MYVIMRC<CR>
nmap <silent> <leader>rr :w<CR>:so $MYVIMRC<CR>
 
" Remap session saver
map <leader>ss :SaveSession 
map <leader>so :OpenSession 
map <leader>sd :DeleteSession 
let g:session_autoload='no'
let g:session_autosave='no'

" airline config
let g:airline#extensions#tabline#enabled=1

" Nerdtree remap
nnoremap <Leader>n :NERDTreeToggle<CR>
" }}}

" Syntax and colors {{{
let base16colorspace=256 " Access colors present in 256 colorspace
syntax enable
colorscheme jellybeans
" }}}

" taskpaper config
let g:task_paper_follow_move = 0

" Windows specific options {{{

if(g:os == "windows")
    " Start gvim maximized
    au GUIEnter * simalt ~x

    " Change gvim font
    if has("gui_running")
        if has("gui_gtk2")
            set guifont=Inconsolata\ 12
        elseif has("gui_macvim")
            set guifont=Menlo\ Regular:h14
        elseif has("gui_win32")
            set guifont=Consolas:h11:cANSI
        endif
    endif
endif

" Syntax highlighting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" } 
let g:syntastic_js_checkers = ['syntastic-javascript-jshint']

" }}}

" Json formatter
com! FormatJSON %!python -m json.tool

set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction

set modelines=2
" vim:foldmethod=marker:foldlevel=0
