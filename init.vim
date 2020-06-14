" Optimized based on https://github.com/ChristianChiarulli/nvim

" Space is leader
let mapleader=' '
set nocompatible        " be iMproved, required
syntax enable
filetype plugin indent on
let g:which_key_map =  {}

" Helper function to remap command mode aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" }}}

" Remappings {{{

" General {{{

" jj switches mode
inoremap jj <Esc>

" ñ as command mode
nnoremap ñ :
vnoremap ñ :
nnoremap Ñ /
vnoremap Ñ /

" CTRL-V Paste
" inoremap <C-V> <ESC>p
" nnoremap <C-V> p
cnoremap <C-V> <C-r>+
tnoremap <C-V> <C-\><C-n>pa

" ABM test function for string

fun! SmartPaste()
    if len(@+) == 0
        :call mdip#MarkdownClipboardImage()<CR>
    elseif match(@+, "^http") == 0
        :echom "link"
        normal "+pviWS)i[
    else
        :echom "text"
        normal! "+p
    endif
endfun

nnoremap <c-v> :call SmartPaste()<cr>
inoremap <c-v> <esc>:call SmartPaste()<cr>

" Paste from non-volatile register
nnoremap <leader>p "0p
vnoremap <leader>p "0p
let g:which_key_map.p = 'paste-unmodified'

if !exists('g:vscode') 
    " Browse tabs
    nmap <leader>k :bn<cr>
    nmap <leader>j :bp<cr>
    nmap <leader>x :bp\|bd #<cr>
    nmap <leader>X :bd!<cr>
    nmap <leader>c :close<cr>
    nmap <leader>b :e #<cr>

    let g:which_key_map.k = 'next-buffer'
    let g:which_key_map.j = 'previous-buffer'
    let g:which_key_map.x = 'close-buffer'
    let g:which_key_map.X = 'force-close-buffer'
    let g:which_key_map.c = 'close-window'
    let g:which_key_map.b = 'reopen-buffer'
    " Smart wrap line navigation
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
else 
    " Browse tabs
    nmap <leader>x :call VSCodeCall('workbench.action.closeActiveEditor')<CR>
    nmap <leader>k :call VSCodeCall('workbench.action.nextEditor')<CR>
    nmap <leader>j :call VSCodeCall('workbench.action.previousEditor')<CR>
    nmap <leader>h :call VSCodeCall('editor.action.showHover')<CR>
    " Smart wrap line navigation
    nmap j gj
    nmap k gk
    " keep ctrl-p funcntionality
    nmap <c-p> :call VSCodeNotify('workbench.action.quickOpen')<CR>
    imap <c-p> :call VSCodeNotify('workbench.action.quickOpen')<CR>
    vmap <c-p> :call VSCodeNotify('workbench.action.quickOpen')<CR>
    " Toggle sidebar
    nmap <leader>n :call VSCodeNotify('workbench.action.toggleSidebar')<CR>
    vmap <leader>n :call VSCodeNotify('workbench.action.toggleSidebar')<CR>
endif


" Easy window navigation
nnoremap <leader>ww <C-w>w
nnoremap <leader>wo :only<cr>
nnoremap <leader>wv :vs<cr>
nnoremap <leader>ws :split<cr>
nnoremap <leader>wl 5<c-w><
nnoremap <leader>wh 5<c-w>>
nnoremap <leader>wj 5<c-w>+
nnoremap <leader>wk 5<c-w>-
nnoremap <leader>wu <c-w>=
let g:which_key_map.w = {
    \ 'name' : '+window',
    \ 't' : 'which_key_ignore',
    \ 'w' : 'toggle-window',
    \ 'o' : 'close-others',
    \ 'v' : 'vertical-split',
    \ 's' : 'horizontal-split',
    \ 'l' : 'smaller-vertical',
    \ 'h' : 'bigger-vertical',
    \ 'j' : 'bigger-horizontal',
    \ 'k' : 'smaller-horizontal',
    \ 'u' : 'undo-resize',
    \ }

" Easy tab navigation
nnoremap <leader>tn :tabnew<cr>:Startify<cr>
nnoremap <leader>tx :tabclose<cr>
nnoremap <leader>tk :tabnext<cr>
nnoremap <leader>tj :tabnext<cr>

let g:which_key_map.t = {
    \ 'name' : '+tabs',
    \ 'n' : 'tab-new',
    \ 'x' : 'tab-close',
    \ 'j' : 'tab-previous',
    \ 'k' : 'tab-next',
    \ }

" Smart line join
nnoremap J gJ

" Better g; logic
nnoremap g, g;

" Clear search
nmap <silent> <leader>/ :nohlsearch<CR>
let g:which_key_map['/'] = 'clear-search'

" Quick macro execute
nnoremap Q @q

" Easy undo
nnoremap U <C-r>

" }}}

" Additional functionality {{{
set omnifunc=syntaxcomplete#Complete

" Go to last edited line
nmap ge '.

inoremap <A-ñ> ~
nmap <silent> <leader>rr :w<CR>:source $MYVIMRC<CR>
nnoremap <C-s> :%s//gIc<Left><Left><Left><Left>

" }}}

" }}}

" Vim options {{{
" User Interface {{{
set signcolumn=yes
set shortmess=aoOtI
set lazyredraw
set novisualbell    " don't beep
set noerrorbells  " don't beep
set wildmenu    " better autocomplete of commands
set wildmode=longest:list,full
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
" set shiftwidth=4
" set tabstop=4
" set softtabstop=4
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

" }}}

" Files, windows, buffers and splits {{{
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

" Plug configuration {{{

call plug#begin('~/.vim/plugged')

if !exists('g:vscode') 
  " Plug 'liuchengxu/vista.vim'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-speeddating'
    Plug 'junegunn/vim-peekaboo'
    Plug 'alvan/vim-closetag'
    Plug 'unblevable/quick-scope'
    Plug 'liuchengxu/vim-which-key'
    Plug 'gryf/wombat256grf'
    Plug 'rakr/vim-one'
    Plug 'nanotech/jellybeans.vim'
    Plug 'morhetz/gruvbox'
    Plug 'tomasiser/vim-code-dark'
    Plug 'psliwka/vim-smoothie'
    Plug 'machakann/vim-highlightedyank'
    Plug 'ledger/vim-ledger', { 'tag': 'v1.2.0' }            " Ledger files plugin
    Plug 'sheerun/vim-polyglot'            " Open different formats
    Plug 'mhinz/vim-startify'
    Plug 'kassio/neoterm'
    Plug 'vim-airline/vim-airline'        " Bottom line information
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vimwiki/vimwiki'
    Plug 'ferrine/md-img-paste.vim'
    Plug '907th/vim-auto-save'   " Autosave files
    Plug 'airblade/vim-rooter'
    Plug 'scrooloose/nerdtree'  " File sidebar functionality
    Plug 'ryanoasis/vim-devicons'
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'      " Git wrapper
    Plug 'airblade/vim-gitgutter'  " Git wrapper
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'APZelos/blamer.nvim'
    Plug 'honza/vim-snippets'
endif
    " Plugs for VSCode {{{
    Plug 'tpope/vim-surround'      " Surround with brackets, parenthesis, etc
    Plug 'tpope/vim-commentary'    " Easily add/remove comments
    " }}}
call plug#end()              " required

if !exists('g:vscode') 
    " Colorschemes {{{
    set background=dark
    " colorscheme one
    " colorscheme gruvbox
    " colorscheme wombat256grf
    " colorscheme jellybeans
    colorscheme codedark
    hi Folded guifg=#a0a8b0 guibg=#384048 gui=italic
    hi CursorLine guibg=#384048
    " hi IncSearch guibg=yellow ctermbg=green term=underline  
    " }}}

    " Which Key {{{
    call which_key#register('<Space>', "g:which_key_map")
    set timeoutlen=500
    nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
    nnoremap <leader>ri :PlugInstall<CR>
    nnoremap <leader>rc :PlugClean<CR>
    nnoremap <leader>rf :CocConfig<CR>

    let g:which_key_map.r = {
        \ 'name' : '+vimrc',
        \ 'r' : 'source-vimrc',
        \ 'i' : 'plug-install',
        \ 'c' : 'plug-clean',
        \ 'f' : 'coc-config',
        \ }
    " }}}

    " Quickscope {{{
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline
    let g:qs_max_chars=150
    " }}}

    " Airline {{{
    set laststatus=2  " To make airline work
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_tabs = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline_theme='dark'
    " }}}

    " Highlighted yank {{{
    let g:highlightedyank_highlight_duration = 300
    " }}}

    " Ledger {{{
    call SetupCommandAlias("lb", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos -U")
    call SetupCommandAlias("lc", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos")
    call SetupCommandAlias("lr", "let g:ledger_winpos = 'B'<CR>:Ledger register -U")

    augroup LedgerGroup
        autocmd!
        autocmd FileType ledger 
                    \ noremap <buffer> <Leader>ls :call ledger#transaction_state_toggle(line('.'), ' *')<CR>|
                    \ inoremap <buffer> ñ ñ|
                    \ inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>|
                    \ vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>|
                    \ inoremap <buffer> <CR> <Esc>:LedgerAlign<CR>A<CR>
    augroup END

    let g:ledger_default_commodity="€"
    let g:ledger_commodity_before = 0
    let g:ledger_commodity_sep = " "
    let g:ledger_decimal_sep = ","
    let g:ledger_winpos = 'r'
    let g:ledger_date_format = '%Y-%m-%d'
    let g:ledger_extra_options = '--date-format=%Y-%m-%d'
    let g:ledger_fillstring = '    -'
    " }}}

    " Polyglot {{{
    let g:polyglot_disabled = ['markdown']
    let g:markdown_fenced_languages = ['javascript', 'cs']
    " }}}

    " Startify {{{
    hi StartifyFile gui=bold cterm=bold term=bold ctermfg=167 guifg=#f4a261

    nmap <leader>s :Startify<cr>
    let g:which_key_map.s = 'startify'

    let g:startify_bookmarks = [
                \ {'d': '~\Nextcloud\Config\DevScripts'},
                \ {'i': '~\Nextcloud\Wiki\index.md'},
                \ {'t': '~\Nextcloud\Wiki\Temp.md'},
                \ {'r': '~\Nextcloud\Config\vimrc'},
                \ {'l': '~\Nextcloud\Wiki\ledger.txt'},
                \ {'c': '~\Nextcloud\Wiki\ledger-credit.txt'},
                \ ]

    let g:startify_lists = [
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': 'commands',  'header': ['   Bookmarks']       },
                \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                \ { 'type': 'files',     'header': ['   MRU']            },
                \ ]

    let g:startify_commands = [
                \ ]
    let g:startify_change_to_dir = 0
    let g:startify_session_persistence = 1

    let g:startify_skiplist = [
                \ '\vimrc',
                \ 'eval.txt',
                \ '.git\',
                \ '.vim\',
                \ '\nvim\runtime',
                \ ]
    let g:startify_custom_indices = ['a', 'b', 'e', 'g']

    let g:ascii = [
                \ '        __',
                \ '.--.--.|__|.--------.',
                \ '|  |  ||  ||        |',
                \ ' \___/ |__||__|__|__|',
                \ ''
                \]

    let g:startify_custom_header =
                \ 'startify#pad(g:ascii + startify#fortune#boxed())'

    let g:startify_relative_path = 1
    " }}}

    " Neoterm {{{
    let g:neoterm_default_mod='botright'
    let g:neoterm_autoinsert=1

    nmap <c-ñ> :Ttoggle<cr>
    tnoremap <c-ñ> <C-\><C-n>:Ttoggle<cr>
    tnoremap <c-j> <C-\><C-n>:Tprevious<cr>i
    tnoremap <c-k> <C-\><C-n>:Tnext<cr>i
    tnoremap <c-n> <C-\><C-n>:Ttoggle<cr>:Tnew<cr>
    tnoremap <c-x> <C-\><C-n>:Tclose!<cr>
    tnoremap jj <C-\><C-n>
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * setlocal nobuflisted
    " }}}

    " VimWiki {{{
    nmap <Leader>id <Plug>VimwikiDiaryIndex
    nmap <Leader>it <Plug>VimwikiMakeDiaryNote
    nmap <Leader>iy <Plug>VimwikiMakeYesterdayDiaryNote
    let g:which_key_map.i = {
        \ 'name' : '+vimwiki',
        \ 'd' : 'open-diary',
        \ 't' : 'open-today',
        \ 'y' : 'open-yesterday',
        \ 'i' : 'insert-image',
        \ }

    let g:vimwiki_list = [{'path': '~/Nextcloud/Wiki',
                \ 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Diario', 'diary_index': 'index', 'auto_toc': 1}]

    let g:vimwiki_diary_months = {
                \ 1: 'Enero', 2: 'Febrero', 3: 'Marzo',
                \ 4: 'Abril', 5: 'Mayo', 6: 'Junio',
                \ 7: 'Julio', 8: 'Agosto', 9: 'Septiembre',
                \ 10: 'Octubre', 11: 'Noviembre', 12: 'Diciembre'
                \ }

    augroup VimWikiGroup
        autocmd!
        autocmd filetype vimwiki
                    \ nmap <buffer> <leader>d <C-Space>|
                    \ setlocal fdm=expr|
                    \ noremap <buffer> <F5> :exec 'silent !start chrome "%:p"'<CR>|
                        \ inoremap <buffer> <silent> <expr> <TAB>
                        \ pumvisible() ? coc#_select_confirm() :
                        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                        \ <SID>check_back_space() ? "\<C-r>=vimwiki#tbl#kbd_tab()\<CR>" :
                        \ coc#refresh()|
                    \ inoremap <buffer> <expr> <s-tab> vimwiki#tbl#kbd_shift_tab()
    augroup END
    " Header colors
    hi VimwikiHeader1 gui=bold cterm=bold term=bold ctermfg=71 guifg=#6EBB49
    hi VimwikiHeader2 gui=bold cterm=bold term=bold ctermfg=167 guifg=#f4a261
    hi VimwikiHeader3 gui=bold cterm=bold term=bold ctermfg=33 guifg=#d75f5f
    hi VimwikiHeader4 gui=bold cterm=bold term=bold ctermfg=91 guifg=#8700af
    hi VimwikiHeader5 gui=bold cterm=bold term=bold ctermfg=91 guifg=#5f0f40
    hi VimwikiLink gui=underline guifg=#569CD6

    let g:vimwiki_listsyms = ' .oOx'
    let g:vimwiki_folding = 'expr'
    let g:vimwiki_ext2syntax = {'.md': 'markdown'}
    let g:vimwiki_markdown_link_ext = 1
    let g:vimwiki_hl_cb_checked = 1
    let g:vimwiki_table_mappings = 0
    " }}}

    " md-img-paste {{{
    nmap <silent> <leader>ii :call mdip#MarkdownClipboardImage()<CR>
    let g:mdip_imgdir = 'images'
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

    " Rooter {{{
    let g:rooter_change_directory_for_non_project_files = 'current'
    let g:rooter_patterns = ['*.sln', 'package.json', 'gradle/', '.git/', 'index.md']
    let g:rooter_silent_chdir = 1
    " }}}

    " Nerdtree {{{	
    " after a re-source, fix syntax matching issues (concealing brackets):
    if exists('g:loaded_webdevicons')
      call webdevicons#refresh()
    endif
    function! NERDTreeToggleAndFind()
        if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
            execute ':NERDTreeClose'
        else
            execute ':NERDTreeFind'
        endif
    endfunction
    map <leader>n :call NERDTreeToggleAndFind()<CR>
    let g:which_key_map.n = 'nerdtree-toggle'
    let NERDTreeMinimalUI=1
    let NERDTreeMapUpdir = 'h'
    let NERDTreeMapChangeRoot = 'l'
    let NERDTreeShowLineNumbers=1
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.spec.ts$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.feature$'] = ''
    " }}}

    " FZF {{{
    let $FZF_DEFAULT_OPTS = '--multi --reverse'
    let $FZF_DEFAULT_OPTS= $FZF_DEFAULT_OPTS . ' --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104'
    let $FZF_DEFAULT_OPTS= $FZF_DEFAULT_OPTS . ' --color info:183,prompt:110,spinner:107,pointer:167,marker:215'
    let $FZF_DEFAULT_OPTS= $FZF_DEFAULT_OPTS . " --bind 'change:top,F2:toggle-preview',ctrl-j:down,ctrl-k:up"
    " let $BAT_THEME = 'base16'
    " command! -bang -nargs=* Find call fzf#vim#grep('rg  --color always '.shellescape(<q-args>), 1, {'options': ['--color', 'hl:9,hl+:14']}, <bang>0)
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \   fzf#vim#with_preview({'options': ['--color', 'fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104,info:183,prompt:110,spinner:107,pointer:167,marker:215']}), <bang>0)
    " Remap ctrl-p to Files or GFiles
    nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
    nnoremap <C-f> :Rg<cr>
    vnoremap <C-f> y:Rg <C-R>=escape(@",'/\')<CR><CR>
    "Floating Window
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        call setbufvar(buf, '&signcolumn', 'no')

        let width = float2nr(&columns * 0.9)
        let height = float2nr(&lines * 0.8)
        let opts = { 'relative': 'editor',
                    \ 'row': (&lines - height) / 2,
                    \ 'col': (&columns - width) / 2,
                    \ 'width': width,
                    \ 'height': height,
                    \ 'style': 'minimal'
                    \}

        call nvim_open_win(buf, v:true, opts)
    endfunction

    " Git branch mgmt
    fun! s:change_branch(e)
        let res = system("git checkout --track " . a:e)
        :e!
        :AirlineRefresh
        :echom "Changed branch to" . a:e
    endfun

    command! Gbranch call fzf#run(
                \ {
                \ 'source': 'git branch -a',
                \ 'sink': function('<sid>change_branch'),
                \ 'options': '-m',
                \ 'down': '20%',
                \ })

    au FileType fzf silent! tunmap <Esc>

    " }}}

    " Fugitive, gitgutter and blamer {{{
    set diffopt+=vertical
    let g:gitgutter_override_sign_column_highlight = 1
    let g:gitgutter_async=1
    let g:gitgutter_diff_args = '-w'
    " Test new color config
    highlight GitGutterAdd guifg=#009900 ctermfg=Green
    highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
    highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

    let g:gitgutter_enabled = 1
    let g:gitgutter_map_keys = 0
    let g:gitgutter_highlight_linenrs = 1
    highlight SignColumn guibg=bg
    " Update sign column every quarter second
    set updatetime=1000

    " Blamer
    let g:blamer_enabled = 1
    let g:blamer_show_in_visual_modes = 0
    highlight Blamer guifg=darkgrey

    " Jump between hunks
    nmap <Leader>gj <Plug>(GitGutterNextHunk)
    nmap <Leader>gk <Plug>(GitGutterPrevHunk)
    nmap <Leader>gp <Plug>(GitGutterPreviewHunk)
    nmap <Leader>gu <Plug>(GitGutterUndoHunk)
    nmap <Leader>gs :Gstatus<cr>
    nmap <Leader>gl :Gpull<cr>
    nmap <Leader>gh :Gpush<cr>
    nmap <Leader>gb :Gbranch<cr>
    nmap <Leader>gm :BlamerToggle<cr>
    let g:which_key_map.g = {
        \ 'name' : '+git',
        \ 'k' : 'previous-hunk',
        \ 'j' : 'next-hunk',
        \ 's' : 'status',
        \ 'l' : 'pull',
        \ 'h' : 'push',
        \ 'b' : 'branch',
        \ 'u' : 'undo',
        \ 'p' : 'preview',
        \ 'm' : 'blamer',
        \ }
    " }}}

    " COC {{{
    set pyxversion=3
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> ge <Plug>(coc-diagnostic-next)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gf <Plug>(coc-codeaction-line)
    vmap <silent> gf <Plug>(coc-codeaction-selected)

    " Symbol renaming.
    nmap <f2> <Plug>(coc-rename)
    " Find symbol of current document.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
    inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<C-j>u\<CR>"
    inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<C-k>u\<c-CR>"

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? coc#_select_confirm() :
                \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " let g:coc_snippet_next = '<tab>'
    let g:coc_global_extensions = [
                \ 'coc-tsserver',
                \ 'coc-tslint',
                \ 'coc-snippets',
                \ 'coc-pairs',
                \ 'coc-html',
                \ 'coc-css',
                \ 'coc-prettier',
                \ 'coc-json',
                \ 'coc-angular',
                \ 'coc-java'
                \ ]

    let g:coc_sources_disable_map = {
                \ 'ledger': ['snippets', 'snippets-source']
                \ }
    " }}}
endif
" }}}