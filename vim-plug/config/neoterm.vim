" Mappings
nmap <c-ñ> :Ttoggle<cr>
tnoremap <c-ñ> <C-\><C-n>:Ttoggle<cr>
tnoremap <c-j> <C-\><C-n>:Tprevious<cr>i
tnoremap <c-k> <C-\><C-n>:Tnext<cr>i
tnoremap <c-n> <C-\><C-n>:Ttoggle<cr>:Tnew<cr>
tnoremap <c-x> <C-\><C-n>:Tclose!<cr>
tnoremap jj <C-\><C-n>
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au TermOpen * setlocal nobuflisted

" Settings
let g:neoterm_default_mod='botright'
let g:neoterm_autoinsert=1
