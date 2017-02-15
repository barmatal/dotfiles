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

" Basic plugins {{{
Plugin 'VundleVim/Vundle.vim'           " Vundle plugin (to keep it updated)
" }}}

" Text files plugins {{{
Plugin 'davidoc/taskpaper.vim'          " Taskpaper files plugin
Plugin 'barmatal/vim-ledger'            " Ledger files plugin
Plugin 'gabrielelana/vim-markdown'      " Markdown files plugin
Plugin 'godlygeek/tabular'              " Required for markdown tabulation
" }}}

" Visual improvements {{{
Plugin 'vim-airline/vim-airline'        " Bottom line information
Plugin 'nanotech/jellybeans.vim'        " Theme
" }}}

" File and projects management {{{
Plugin 'xolox/vim-misc'                 " Required for vim-session
Plugin 'xolox/vim-session'              " Session management
Plugin 'ctrlpvim/ctrlp.vim'             " Fast file switching
Plugin 'kshenoy/vim-signature'          " Better marks management in files
Plugin 'vim-scripts/vim-auto-save'      " Autosave files
Plugin 'djoshea/vim-autoread'           " Autoread files
" }}}

" Programming plugins {{{
Plugin 'tpope/vim-surround'             " Surround with brackets, parenthesis, etc
Plugin 'tpope/vim-commentary'           " Easily add/remove comments
Plugin 'ervandew/supertab'              " Better tab autocompletion
Plugin 'tpope/vim-fugitive'             " Git wrapper
Plugin 'pangloss/vim-javascript'        " Javascript syntax improvements
"Plugin 'scrooloose/syntastic'           " Linter
" }}}

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Remappings {{{

" General {{{

" Space is leader
let mapleader=" "

" jj switches mode
inoremap jj <Esc>

" Browse tabs
nmap <leader>j :bn<cr>
nmap <leader>x :bd<cr>
nmap <leader>X :bd!<cr>

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

" Smart wrap line navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"
" Easy copy paste to clipboard
noremap <Leader>p "*p
noremap <Leader>y "*y

" Move lines using alt
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
nnoremap <A-l> >>
nnoremap <A-h> <<
vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>

" }}}

" Additional functionality {{{

" Quickly edit/reload the vimrc file
nmap <silent> <leader>re :e $MYVIMRC<CR>
nmap <silent> <leader>rr :w<CR>:so $MYVIMRC<CR>

" Format Json files quickly
com! JSONFormat %!python -m json.tool

" }}}

" Compatibility {{{

" Fix wrong accented words in terminal
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

"Control-S Save
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>a

" CTRL-X Cut
vnoremap <C-X> "+x

" CTRL-C Copy
vnoremap <C-C> "+y

" CTRL-V Paste
imap <C-V>       <ESC>"+gPa
map <C-V>       "+gP
" }}}

" }}}

" Vim options {{{

" User Interface {{{
set shortmess=aoOtI
syntax enable
au GUIEnter * simalt ~x
set guifont=Consolas:h11:cANSI
set guioptions-=m              " remove gui options
set guioptions-=M
let base16colorspace=256 " Access colors present in 256 colorspace
set novisualbell    " don't beep
set noerrorbells  " don't beep
set wildmenu    " better autocomplete of commands
set wildmode=longest:list,full
" }}}

" Text edition {{{
set showmatch     " set show matching parenthesis
runtime macros\matchit.vim
                  " Use % to match tags

set backspace=2                " backspace working
set ai            " Smart indent for lists

" Change icon in different modes
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" }}}

" Line display configuration {{{

set rnu        " Display relative line number
set number        " Display line number
set wrap        " enable line wrap
set linebreak     " wrap only whole words

" }}}

" Tabulation and indenting {{{
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set expandtab

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2
set softtabstop=2
set tabstop=2
" }}}

" Folding {{{
set foldenable    " enable folding
set foldmethod=syntax " enable folding in code
set foldlevel=3   " Start with 3 level folding
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
  let sub = sub . "                                                                                                                                            "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
" }}}

" Files, windows, buffers and splits {{{
set modelines=2
set autochdir
set encoding=UTF-8
set hidden        " Improve buffer management
" set diffopt+=vertical
filetype on
filetype indent on

set nobackup    " no backup
set noswapfile    " no swap file

set splitbelow
set splitright

" Do not add end of line to documents
set noeol
" }}}

" Search {{{
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
" }}}

" }}}

" Plugin specific configuration {{{
" TODO: Find a better way to handle this
" Taskpaper {{{
autocmd filetype taskpaper nmap <buffer> <leader>d <leader>td
autocmd filetype taskpaper nmap <buffer> <leader>a <leader>tD
autocmd filetype taskpaper nmap <buffer> <leader>m <leader>tm
autocmd filetype taskpaper nmap <buffer> <leader>s <leader>ts

let g:task_paper_follow_move = 0
" }}}

" Ledger {{{
autocmd FileType ledger noremap <buffer> <Leader>la :LedgerAlign<CR>
autocmd FileType ledger noremap <buffer> <Leader>lb :Ledger bal 
autocmd FileType ledger noremap <buffer> <Leader>lr :Ledger register 
autocmd FileType ledger noremap <buffer> <Leader>lc :call ledger#transaction_state_toggle(line('.'), ' !')<CR>
autocmd FileType ledger inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
autocmd FileType ledger vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>

let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_decimal_sep = ","
let g:ledger_winpos = 'B'
" }}}

" Markdown {{{
let g:markdown_enable_spell_checking = 0     " markdown disable spellchecking
" }}}

" Autosave {{{
let g:auto_save = 1                         " Enable autosave
let g:auto_save_in_insert_mode = 0          " Do not autosave in insert mode
" }}}

" Syntastic {{{
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

" Jellybeans {{{
colorscheme jellybeans
" }}}

" Ctrlp {{{
let g:ctrlp_map = '<c-p>'
" }}}

" Airline {{{
set laststatus=2  " To make airline work
let g:airline#extensions#tabline#enabled=1
" }}}

" Session {{{
map <leader>ss :SaveSession 
map <leader>so :OpenSession 
map <leader>sd :DeleteSession 
let g:session_autoload='no'
let g:session_autosave='no'
" }}}
" }}}

" Format vimrc file with folds
" vim:foldmethod=marker:foldlevel=0
