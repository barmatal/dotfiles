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
