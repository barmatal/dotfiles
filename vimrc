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
Plugin 'let-modeline.vim' " Extend modeline
Plugin 'plasticboy/vim-markdown'      " Markdown files plugin
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
Plugin '907th/vim-auto-save'   " Autosave files
Plugin 'djoshea/vim-autoread'  " Autoread files
" Plugin 'mtth/scratch.vim'      " Scratch file easy creation
Plugin 'airblade/vim-rooter'   " Better pwd management
" Plugin 'itchyny/calendar.vim'  " Calendar functionality
Plugin 'scrooloose/nerdtree'  " File sidebar functionality
Plugin 'barmatal/vimwiki'  " Wiki

" }}}

" Programming plugins {{{
Plugin 'tpope/vim-surround'      " Surround with brackets, parenthesis, etc
Plugin 'tpope/vim-commentary'    " Easily add/remove comments
Plugin 'ervandew/supertab'       " Better tab autocompletion
Plugin 'tpope/vim-fugitive'      " Git wrapper
Plugin 'airblade/vim-gitgutter'  " Git wrapper
" Plugin 'pangloss/vim-javascript' " Javascript syntax improvements
" Plugin 'leafgarland/typescript-vim' " Typeascript syntax improvements
" Plugin 'Quramy/vim-js-pretty-template' " templates syntax improvements
" Plugin 'Quramy/tsuquyomi' " TS syntax improvements
" Plugin 'vim-syntastic/syntastic' " TS syntax improvements
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

" Easy undo
nnoremap U <C-r>

" Helper function to remap command mode aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" }}}

" Additional functionality {{{

" Quickly edit/reload the vimrc file
nmap <silent> <leader>re :e $MYVIMRC<CR>
nmap <silent> <leader>rr :w<CR>:source $MYVIMRC<CR>

" Format Json files quickly
com! JSONFormat %!python -m json.tool

" Browse links
" nmap <silent> <Enter> ge
" nmap <silent> <BS> <leader>x

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
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
elseif (g:os == "terminal")
    " Fix wrong accented words in terminal
    " inoremap 'á á
    " inoremap 'é é
    " inoremap 'í í
    " inoremap 'ó ó
    " inoremap 'ú ú
    " inoremap 'Á Á
    " inoremap 'É É
    " inoremap 'Í Í
    " inoremap 'Ó Ó
    " inoremap 'Ú Ú
    " inoremap "ü ü
    " inoremap "Ü Ü
endif
" }}}

" User Interface {{{
set shortmess=aoOtI
set lazyredraw
syntax enable
" let base16colorspace=256 " Access colors present in 256 colorspace
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

" Change icon in different modes
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Secure encryption
set cryptmethod=blowfish2

" }}}

" Line display configuration {{{

set rnu         " Display relative line number
set number      " Display line number
set wrap      " disable line wrap
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
        \ nmap <buffer> <leader>z <leader>tp|
        \ call taskpaper#fold_projects()|
        \ inoremap <buffer> ñ ñ|
        \ setlocal shiftwidth=2 |
        \ setlocal softtabstop=2 |
        \ setlocal tabstop=2
augroup END
let g:task_paper_follow_move = 0

" }}}

" Ledger {{{
call SetupCommandAlias("lb", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos -U")
call SetupCommandAlias("lc", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos")
call SetupCommandAlias("lr", "let g:ledger_winpos = 'B'<CR>:Ledger register -U")
call SetupCommandAlias("lo", "let g:ledger_winpos = 'R'<CR>:Ledger bal")
call SetupCommandAlias("lx", "r !ledger -f % xact")
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
let g:markdown_enable_folding = 0
set conceallevel=2

" Markdown easy remapping
vnoremap ` c```<CR>```<Esc>P

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

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
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
let g:airline#extensions#tabline#formatter = 'unique_tail'
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
call SetupCommandAlias("rg", "Rg -S")
nnoremap <C-S-f> :Rg -S 
nnoremap <Leader>vv :Rg <cword><CR>
vnoremap <Leader>vv y:Rg <c-r>0<CR>

" }}}

" Vim Rooter {{{
let g:rooter_patterns = ['index.md', '.git/']
" }}}

" Calendar {{{
let g:calendar_google_calendar = 1
let g:calendar_views = ['year', 'month', 'week', 'day_4', 'day', 'weekday', 'event', 'agenda']
let g:calendar_view = "agenda"
let g:calendar_time_zone = "+0200"
nnoremap <Leader>c :Calendar<CR>
" }}}

" Typescript {{{
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
" }}}

" Nerdtree {{{
map <leader>n :NERDTreeToggle<CR>
" }}}

" VimWiki {{{
nmap <Leader>i <Plug>VimwikiIndex

if(g:os == "windows")
    let g:vimwiki_list = [{'path': 'C:\Users\alfredo.barroso\Dropbox\Documentos\Tareas',
                            \ 'syntax': 'markdown', 'ext': '.md'}]
else
    let g:vimwiki_list = [{'path': '~/Dropbox/Documentos/Tareas',
                            \ 'syntax': 'markdown', 'ext': '.md'}]
endif

hi VimwikiHeader1 guifg=#70b950 gui=bold
hi VimwikiHeader2 guifg=#D7BA7D gui=bold
hi VimwikiHeader3 guifg=#C586C0 gui=bold
hi VimwikiHeader4 guifg=#9CDCFE gui=bold

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
    return 1
endif
endfunction

let g:vimwiki_folding = 'expr'

" }}}

" }}}

" Format vimrc file with folds
" vim:foldmethod=marker:foldlevel=0