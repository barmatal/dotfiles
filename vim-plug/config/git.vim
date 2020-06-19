" Mappings {{{
" nmap <Leader>gj <Plug>(GitGutterNextHunk)
" nmap <Leader>gk <Plug>(GitGutterPrevHunk)
" nmap <Leader>gp <Plug>(GitGutterPreviewHunk)
" nmap <Leader>gu <Plug>(GitGutterUndoHunk)
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

highlight SignifySignAdd    ctermfg=green  guifg=green
highlight SignifySignDelete ctermfg=red    guifg=red 
highlight SignifySignChange ctermfg=yellow guifg=yellow 

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gp <plug>(signify-prev-hunk)
    nnoremap <leader>gp :SignifyHunkDiff<cr>
    nnoremap <leader>gu :SignifyHunkUndo<cr>

nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gl :Gpull<cr>
nmap <Leader>gh :Gpush<cr>
nmap <Leader>gb :Gbranch<cr>
nmap <Leader>gm :BlamerToggle<cr>
cmap g<space> Git<space>

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

" Settings {{{
set diffopt+=vertical
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_async=1
let g:gitgutter_diff_args = '-w'
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
set updatetime=100
let g:blamer_enabled = 0
let g:blamer_show_in_visual_modes = 0
" }}}

" Colors {{{
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight SignColumn guibg=bg
highlight Blamer guifg=darkgrey
" }}}