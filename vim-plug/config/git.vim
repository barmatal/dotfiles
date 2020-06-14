
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
