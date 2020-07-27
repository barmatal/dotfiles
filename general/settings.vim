" Prerequisites {{{
" Space is leader
let mapleader=' '
set nocompatible        " be iMproved, required
syntax enable
filetype plugin indent on
let g:which_key_map =  {}

" Python versions
let g:python_host_prog='C:/Python27/python.exe'
let g:python3_host_prog='C:/Python38/python.exe'

" Helper function to remap command mode aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

augroup vimrc
  autocmd!
  autocmd FileType vim 
        \ setlocal foldmethod=marker|
        \ setlocal foldlevel=0
augroup END

" }}}

" User Interface {{{
set signcolumn=yes
set shortmess=aoOtI
set lazyredraw
set novisualbell    " don't beep
set noerrorbells  " don't beep
set wildmenu    " better autocomplete of commands
" set wildmode=longest:list,full
set wildmode=full
set wildoptions+=pum
set complete+=k
set mouse=a
" }}}

" Text edition {{{
set showmatch     " set show matching parenthesis
set backspace=2                " backspace working
set clipboard+=unnamedplus

" Change icon in different modes
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" }}}

" Line display configuration {{{

set rnu         " Display relative line number
set number      " Display line number
set nowrap        " Enable line wrap
set linebreak   " wrap only whole words
set scrolloff=3 " Sets the scroll a little before so you have context
set formatoptions=tcqown

" }}}

" Tabulation and indenting {{{
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set expandtab

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Exception for typescript and javascript
" autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType ledger setlocal shiftwidth=2 softtabstop=2 tabstop=2
" set et
" }}}

" Folding {{{
set foldenable    " enable folding
set foldmethod=syntax " enable folding in code
set foldlevel=5   " Start with 3 level folding

setlocal foldmethod=marker
setlocal foldlevel=0
" }}}

" Files, windows, buffers and splits {{{
let loaded_matchit = 1
set modelines=2
set encoding=UTF-8
set hidden        " Improve buffer management

set nobackup nowritebackup    " no backup
set noswapfile    " no swap file

set splitbelow splitright

" Autoread file
set autoread
" au CursorHold * checktime

" Do not add end of line to documents
set noeol
set nofixeol

" Find in subfolders (when you know the name of the file)
set path+=**

" Avoid letting netrw window opened by default
let g:netrw_fastbrowse = 0

" }}}

" Search {{{
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set gdefault   " Default global in searches
"Automatically unfold when searching inside fold
set foldopen=search

" }}}