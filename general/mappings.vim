" General {{{

" jj switches mode
inoremap jj <Esc>

" ñ as command mode
nnoremap ñ :
vnoremap ñ :
nnoremap Ñ /
vnoremap Ñ /

" CTRL-V Paste
inoremap <C-V> <ESC>p
nnoremap <C-V> p
cnoremap <C-V> <C-r>+
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>

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

" Better navigation on command autocomplete
cmap <c-j> <c-n>
cmap <c-k> <c-p>
" }}}