" Detect system {{{
set nocompatible        " be iMproved, required
filetype off            " required

" TODO: Detect when SSH
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "windows"
    elseif has("osx")
        let g:os = "osx"
    elseif has("python") || has("python3")
        let g:os = "linux"
    else
        let g:os = "ios"
    endif
endif

" }}}

" Vundle configuration {{{
if(g:os == "windows")
    set rtp+=$HOME\.vim\bundle\Vundle.vim
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
Plugin 'ledger/vim-ledger'            " Ledger files plugin
Plugin 'sheerun/vim-polyglot'            " ripgrep text search
" }}}

" Visual improvements {{{
Plugin 'vim-airline/vim-airline'        " Bottom line information
Plugin 'nanotech/jellybeans.vim'        " Theme
Plugin 'tomasiser/vim-code-dark'
" }}}

" File and projects management {{{
Plugin 'ctrlpvim/ctrlp.vim'    " Fast file switching
Plugin '907th/vim-auto-save'   " Autosave files
Plugin 'djoshea/vim-autoread'  " Autoread files
Plugin 'airblade/vim-rooter'   " Better pwd management
Plugin 'scrooloose/nerdtree'  " File sidebar functionality
" Install dev branch for vimwiki manually until extension for links are supported
" Manual installation on Mac: git clone --branch=dev https://github.com/vimwiki/vimwiki.git ~/.vim/pack/plugins/start/vimwiki
" Manual installation on Windows: git clone --branch=dev https://github.com/vimwiki/vimwiki.git $HOME/vimfiles/pack/plugins/start/vimwiki
" Plugin 'vimwiki/vimwiki'  " Wiki

" }}}

" Programming plugins {{{
Plugin 'tpope/vim-surround'      " Surround with brackets, parenthesis, etc
Plugin 'tpope/vim-commentary'    " Easily add/remove comments
Plugin 'ervandew/supertab'       " Better tab autocompletion
Plugin 'tpope/vim-fugitive'      " Git wrapper
Plugin 'airblade/vim-gitgutter'  " Git wrapper
" }}}

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Remappings {{{

" General {{{

" Space is leader
let mapleader=' '

" jj switches mode
inoremap jj <Esc>

" Browse tabs
nmap <leader>k :bn<cr>
nmap <leader>j :bp<cr>
nmap <leader>x :bd<cr>
nmap <leader>X :bd!<cr>

" Helper function to remap command mode aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" Easy window navigation
map <leader>ww <C-w>w

" Smart wrap line navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Smart line join
nnoremap J gJ

" Better g; logic
nnoremap g, g;

" Easy copy paste to clipboard
noremap <Leader>p "*p
noremap <Leader>y "*y

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>Ñ :nohlsearch<CR>

" Quick macro execute
nnoremap Q @q

" Easy undo
nnoremap U <C-r>


" }}}

" Additional functionality {{{

" Quickly edit/reload the vimrc file
nmap <silent> <leader>re :e $MYVIMRC<CR>
nmap <silent> <leader>rr :w<CR>:source $MYVIMRC<CR>

" Folds as text objects (viz selects a fold)
xnoremap iz :<C-U>silent!normal![zV]z<CR>
onoremap iz :normal viz<CR>

" json formatting
command! FormatJSON %!python -m json.tool

" }}}

" Compatibility {{{

" CTRL-C Copy
vnoremap <C-C> "+y

" CTRL-V Paste
inoremap <C-V>       <ESC>"+gpa
nnoremap <C-V>       "+gp
cnoremap <C-V> <C-r>"
" }}}

" Additional functionality {{{
nnoremap ñ :
vnoremap ñ :
nnoremap Ñ /
vnoremap Ñ /

" }}}
" }}}

" Vim options {{{

" OS Specific configuration {{{
if(g:os == "windows")
    " Full screen
    au GUIEnter * simalt ~x
    " Font settings
    set guifont=Consolas:h11:cANSI
    " remove gui options
    set guioptions-=m
    set guioptions-=M
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
elseif(g:os == "osx")
    " Full screen
    " set fu
    " Font settings
    set guifont=Menlo\ Regular:h18
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
elseif (g:os == "ios")
    " Nothing yet
endif
" }}}

" User Interface {{{
set shortmess=aoOtI
set lazyredraw
syntax enable
set novisualbell    " don't beep
set noerrorbells  " don't beep
set wildmenu    " better autocomplete of commands
set wildmode=longest:list,full
" Autocompletion
inoremap <s-Tab> <c-n>
set complete+=k
" }}}

" Text edition {{{
set showmatch     " set show matching parenthesis
runtime macros\matchit.vim
                  " Use % to match tags

set backspace=2                " backspace working

" Change icon in different modes
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Secure encryption
set cryptmethod=blowfish2

" }}}

" Line display configuration {{{

set rnu         " Display relative line number
set number      " Display line number
set nowrap      " disable line wrap
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
set softtabstop=4
set tabstop=4
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
set encoding=UTF-8
set hidden        " Improve buffer management
filetype on
filetype indent on

set nobackup    " no backup
set noswapfile    " no swap file

set splitbelow
set splitright

" Autoread file
set autoread
au CursorHold * checktime

" Do not add end of line to documents
set noeol
set nofixeol

" Find in subfolders (when you know the name of the file)
set path+=**

" netrw options
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize = 25    " 25% of the screen
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
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

" }}}

" Plugin specific configuration {{{

" Taskpaper {{{
augroup TaskPaperGroup
    autocmd!
    autocmd filetype taskpaper
        \ nmap <buffer> <leader>d <leader>td|
        \ nmap <buffer> <leader>a <leader>tD|
        \ nmap <buffer> <leader>m <leader>tm|
        \ nmap <buffer> <leader>s <leader>ts|
        \ nmap <buffer> <leader>z <leader>tp|
        \ call taskpaper#fold_projects()|
        \ inoremap <buffer> ñ ñ|
        \ inoremap <buffer> <CR> <CR>|
        \ setlocal shiftwidth=2 |
        \ setlocal softtabstop=2 |
        \ setlocal tabstop=2
augroup END
let g:task_paper_follow_move = 0

" }}}

" Ledger {{{
call SetupCommandAlias("lb", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos -U")
call SetupCommandAlias("lc", "let g:ledger_winpos = 'B'<CR>:Ledger bal -X 'kc' Comida Ejercicio Metabolismo")
call SetupCommandAlias("lr", "let g:ledger_winpos = 'B'<CR>:Ledger register -U")
call SetupCommandAlias("lo", "let g:ledger_winpos = 'R'<CR>:Ledger bal")

" Special commodity for calorie counting file
function! SetCommodity()
    if expand('%:t') == 'cal.txt'
        let g:ledger_default_commodity="kc"
    else
        let g:ledger_default_commodity="€"
    endif
endfunction

augroup LedgerGroup
    autocmd!
    autocmd FileType ledger 
                \ noremap <buffer> <Leader>ls :call ledger#transaction_state_toggle(line('.'), ' *!')<CR>|
                \ inoremap <buffer> ñ ñ|
                \ inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>|
                \ vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>|
                \ setlocal shiftwidth=2 |
                \ setlocal softtabstop=2 |
                \ setlocal tabstop=2 |
                \ inoremap <buffer> <CR> <Esc>:LedgerAlign<CR>A<CR>|
                \ call SetCommodity()
augroup END

" Copy latest transaction 
" nmap <Leader>lc mt_W"cy$?<C-r>"$<CR>zcyiz'tpzadd:nohlsearch<CR>
" Reformat line
" nmap K 03W50i<Space><Esc>050ldw
" vmap K 03W50i<Space><Esc>050ldw
let g:ledger_default_commodity="€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_decimal_sep = ","
let g:ledger_winpos = 'r'
let g:ledger_date_format = '%Y-%m-%d'
let g:ledger_extra_options = '--date-format=%Y-%m-%d'
let g:ledger_fillstring = '    -'
" }}}

" Markdown {{{
noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "%:p"<CR>
" }}}

" Autosave {{{
function! AutoSaveByFiletype()
    if &filetype != "ledger" && &filetype != "markdown" && &filetype != "taskpaper" && &filetype != "vimwiki"
        let g:auto_save_abort = 1
    endif
endfunction

let g:auto_save_in_insert_mode = 0          " Do not autosave in insert mode
let g:auto_save = 1
let g:auto_save_presave_hook = 'call AutoSaveByFiletype()'
" }}}

" Color scheme {{{
colorscheme jellybeans
" }}}

" Ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_root_markers = ['web.config','*.sln', '.git']
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
" }}}

" Airline {{{
set laststatus=2  " To make airline work
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
if(g:os == "ios")
    let g:airline_extensions = ['tabline']
endif
" }}}

" Nerdtree {{{	
map <leader>n :NERDTreeToggle<CR>	
let NERDTreeMinimalUI=1

let NERDTreeMapUpdir = 'h'
let NERDTreeMapChangeRoot = 'l'
let NERDTreeShowLineNumbers=1
" }}}

" Fugitive and gitgutter {{{
call SetupCommandAlias("git", "Git")
nnoremap <Leader>gn :GitGutterNextHunk<CR>zO
nnoremap <Leader>gN :GitGutterPrevHunk<CR>zO
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
set diffopt+=vertical
" }}}

" Vim Rooter {{{
let g:rooter_patterns = ['index.md', '.git/']
let g:rooter_silent_chdir = 0
let g:rooter_use_lcd = 1

let g:rooter_resolve_links = 0
let g:rooter_manual_only = 0
" }}}

" VimWiki {{{
nmap <Leader>ii <Plug>VimwikiIndex
nmap <Leader>oo 2<Plug>VimwikiIndex
nmap <Leader>id <Plug>VimwikiDiaryIndex
nmap <Leader>od 2<Plug>VimwikiDiaryIndex
nmap <Leader>it <Plug>VimwikiMakeDiaryNote
nmap <Leader>ot 2<Plug>VimwikiMakeDiaryNote
nmap <Leader>iy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>oy 2<Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>if :VWS 
nmap <Leader>in :lopen<CR>

let g:vimwiki_list = [{'path': '~/Nextcloud/Tareas',
                        \ 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Diario privado'},
                        \ {'path': '~/wiki',
                        \ 'syntax': 'markdown', 'ext': '.md', 'index': 'Home', 'diary_header': 'Diario público'}]

let g:vimwiki_diary_months = {
      \ 1: 'Enero', 2: 'Febrero', 3: 'Marzo',
      \ 4: 'Abril', 5: 'Mayo', 6: 'Junio',
      \ 7: 'Julio', 8: 'Agosto', 9: 'Septiembre',
      \ 10: 'Octubre', 11: 'Noviembre', 12: 'Diciembre'
      \ }

augroup VimWikiGroup
    autocmd!
    autocmd filetype vimwiki
        \ nmap <buffer> <leader>d <C-Space>
augroup END

hi VimwikiHeader1 gui=bold cterm=bold term=bold ctermfg=71 guifg=#70b950
hi VimwikiHeader2 gui=bold cterm=bold term=bold ctermfg=167 guifg=#d75f5f
hi VimwikiHeader3 gui=bold cterm=bold term=bold ctermfg=91 guifg=#8700af
hi VimwikiHeader4 gui=bold cterm=bold term=bold ctermfg=33 guifg=#0087ff

function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
        let link = link[1:]
    else
        return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        exe 'edit ' . fnameescape(link_infos.filename)
        lcd %:p:h
        return 1
    endif
endfunction

let g:vimwiki_listsyms = ' .oOx'
let g:vimwiki_folding = 'list'
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

" }}}

" }}}

" Format vimrc file with folds
" vim:foldmethod=marker:foldlevel=0