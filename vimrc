" Detect system {{{
set nocompatible        " be iMproved, required
filetype off            " required

" TODO: Detect when SSH
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "windows"
    elseif has("gui_running")
        let g:os = "mac"
    else
        let g:os = "terminal"
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
Plugin 'barmatal/vim-ledger'            " Ledger files plugin
Plugin 'gabrielelana/vim-markdown'      " Markdown files plugin
Plugin 'godlygeek/tabular'              " Required for markdown tabulation
Plugin 'jremmen/vim-ripgrep'            " ripgrep text search
" }}}

" Visual improvements {{{
Plugin 'vim-airline/vim-airline'        " Bottom line information
Plugin 'nanotech/jellybeans.vim'        " Theme
" }}}

" File and projects management {{{
Plugin 'xolox/vim-misc'        " Required for vim-session
Plugin 'xolox/vim-session'     " Session management
Plugin 'ctrlpvim/ctrlp.vim'    " Fast file switching
Plugin 'kshenoy/vim-signature' " Better marks management in files
Plugin '907th/vim-auto-save'   " Autosave files
Plugin 'djoshea/vim-autoread'  " Autoread files
Plugin 'mtth/scratch.vim'      " Scratch file easy creation
Plugin 'yssl/QFEnter'          " Quick Fix window better management
Plugin 'qpkorr/vim-bufkill'    " Better buffer/split management
Plugin 'airblade/vim-rooter'   " Better pwd management
Plugin 'itchyny/calendar.vim'  " Calendar functionality

" }}}

" Programming plugins {{{
Plugin 'tpope/vim-surround'      " Surround with brackets, parenthesis, etc
Plugin 'tpope/vim-commentary'    " Easily add/remove comments
Plugin 'ervandew/supertab'       " Better tab autocompletion
Plugin 'tpope/vim-fugitive'      " Git wrapper
Plugin 'airblade/vim-gitgutter'  " Git wrapper
Plugin 'pangloss/vim-javascript' " Javascript syntax improvements
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

" Fast save mode (Save and close from insert mode)
inoremap ZZ <Esc>ZZ

" Browse tabs
nmap <leader>k :bn<cr>
nmap <leader>j :bp<cr>
nmap <leader>x :bd<cr>
nmap <leader>X :bd!<cr>

" Mark management
nnoremap mn ]'
nnoremap mN ['

" Easy window navigation
map <leader>w <C-w>

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

" Move lines using alt
nnoremap <M-j> :m .+1<CR>
nnoremap <M-k> :m .-2<CR>
nnoremap <M-l> >>
nnoremap <M-h> <<
vnoremap <M-j> :m '>+1<CR>gv
vnoremap <M-k> :m '<-2<CR>gv

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>Ñ :nohlsearch<CR>

" Quick macro execute
nnoremap Q @q

" Helper function to remap command mode aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("vi", "VundleInstall")
call SetupCommandAlias("vc", "VundleClean")
call SetupCommandAlias("vu", "VundleUpdate")
" }}}

" Additional functionality {{{

" Quickly edit/reload the vimrc file
nmap <silent> <leader>re :e $MYVIMRC<CR>
nmap <silent> <leader>rr :w<CR>:source $MYVIMRC<CR>

" Format Json files quickly
com! JSONFormat %!python -m json.tool

" }}}

" Compatibility {{{

"Control-S Save
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>a

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
nnoremap Ñ /\v
vnoremap Ñ /\v
inoremap ñ {
inoremap Ñ [
inoremap ç }
inoremap Ç ]

nnoremap viñ vi{
nnoremap ciñ ci{
nnoremap yiñ yi{
nnoremap diñ di{

nnoremap viÑ vi[
nnoremap ciÑ ci[
nnoremap yiÑ yi[
nnoremap diÑ di[
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
elseif(g:os == "mac")
    " Full screen
    set fu
    " Font settings
    set guifont=Menlo\ Regular:h18
elseif (g:os == "terminal")
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
endif
" }}}

" User Interface {{{
set shortmess=aoOtI
set lazyredraw
syntax enable
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

set rnu         " Display relative line number
set number      " Display line number
set nowrap      " disable line wrap
set linebreak   " wrap only whole words
set scrolloff=3 " Sets the scroll a little before so you have context

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
" set autochdir
set encoding=UTF-8
set hidden        " Improve buffer management
" set diffopt+=vertical
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

nnoremap / /\v
vnoremap / /\v
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
        \ inoremap <buffer> ñ ñ|
        \ setlocal shiftwidth=2 |
        \ setlocal softtabstop=2 |
        \ setlocal tabstop=2
augroup END
let g:task_paper_follow_move = 0

" Go to special file (marked with T)
nnoremap gt :vsplit<CR>'T
" }}}

" Ledger {{{
call SetupCommandAlias("lb", "let g:ledger_winpos = 'R'<CR>:Ledger bal -U")
call SetupCommandAlias("lr", "let g:ledger_winpos = 'B'<CR>:Ledger register -U")
call SetupCommandAlias("lx", "r !ledger -f % xact")
augroup LedgerGroup
    autocmd!
    autocmd FileType ledger 
                \ noremap <buffer> <Leader>lc :call ledger#transaction_state_toggle(line('.'), ' *')<CR>|
                \ inoremap <buffer> ñ ñ|
                \ inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>|
                \ vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>|
                \ setlocal shiftwidth=2 |
                \ setlocal softtabstop=2 |
                \ setlocal tabstop=2 |
augroup END

let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_decimal_sep = ","
let g:ledger_winpos = 'r'
" }}}

" Markdown {{{
augroup MarkdownGroup
    autocmd!
    autocmd FileType markdown 
                \ inoremap <buffer> ñ ñ|
                \ noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "%:p"<CR>
augroup END

let g:markdown_enable_spell_checking = 0     " markdown disable spellchecking
" }}}

" Autosave {{{

function! AutoSaveByFiletype()
    if &filetype != "ledger" && &filetype != "markdown" && &filetype != "taskpaper"
        let g:auto_save_abort = 1
    endif
endfunction

let g:auto_save_in_insert_mode = 0          " Do not autosave in insert mode
let g:auto_save = 1
let g:auto_save_presave_hook = 'call AutoSaveByFiletype()'
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
let g:ctrlp_root_markers = ['web.config','*.sln']
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" }}}

" Airline {{{
set laststatus=2  " To make airline work
let g:airline#extensions#tabline#enabled=1
" }}}

" Session {{{
call SetupCommandAlias("ss", "SaveSession")
call SetupCommandAlias("so", "OpenSession")
call SetupCommandAlias("sd", "DeleteSession")
let g:session_autoload='no'
let g:session_autosave='no'
" }}}

" Fugitive and gitgutter {{{
call SetupCommandAlias("git", "Git")
call SetupCommandAlias("gs", "Gstatus")
call SetupCommandAlias("gpl", "Gpull")
call SetupCommandAlias("gps", "Gpush")
call SetupCommandAlias("gl", "Git! log")
call SetupCommandAlias("gi", "Git! show")
call SetupCommandAlias("gc", "Git! checkout")
call SetupCommandAlias("gd", "Gdiff")
call SetupCommandAlias("gb", "Gblame")
call SetupCommandAlias("gr", "Gread")
nnoremap <Leader>gn :GitGutterNextHunk<CR>zO
nnoremap <Leader>gN :GitGutterPrevHunk<CR>zO
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>gdl :diffget //2<CR>
nnoremap <Leader>gdr :diffget //3<CR>
nnoremap <Leader>gdu :diffupdate<CR>
set diffopt+=vertical
" }}}

" Scratch {{{
let g:scratch_height = 50
let g:scratch_horizontal = 0
let g:scratch_top = 0
let g:scratch_insert_autohide = 0
nnoremap gs :Scratch<CR>
nnoremap gp :ScratchPreview<CR>

" }}}

" Ripgrep {{{
call SetupCommandAlias("rg", "Rg")
nnoremap <Leader>vv :Rg <cword><CR>
vnoremap <Leader>vv y:Rg <c-r>0<CR>

" }}}

" Vim Rooter {{{
let g:rooter_patterns = ['Rakefile', 'Web.config', '*.sln', '.git/']
" }}}

" Calendar {{{
let g:calendar_google_calendar = 1
let g:calendar_views = ['year', 'month', 'week', 'day_4', 'day', 'weekday', 'event', 'agenda']
let g:calendar_view = "agenda"
let g:calendar_time_zone = "+0200"
nnoremap <Leader>c :Calendar<CR>
" }}}
" }}}

" Format vimrc file with folds
" vim:foldmethod=marker:foldlevel=0