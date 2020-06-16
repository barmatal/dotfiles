" Helper functions {{{
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

" Mappings {{{
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
" }}}

" Settings {{{
let g:vimwiki_list = [{'path': '~/Nextcloud/Wiki',
            \ 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Diario', 'diary_index': 'index', 'auto_toc': 1}]
let g:vimwiki_diary_months = {
            \ 1: 'Enero', 2: 'Febrero', 3: 'Marzo',
            \ 4: 'Abril', 5: 'Mayo', 6: 'Junio',
            \ 7: 'Julio', 8: 'Agosto', 9: 'Septiembre',
            \ 10: 'Octubre', 11: 'Noviembre', 12: 'Diciembre'
            \ }
let g:vimwiki_listsyms = ' .oOx'
let g:vimwiki_folding = 'expr'
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_table_mappings = 0

" }}}

" Autocommands {{{
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
" }}}

" Colors {{{
hi VimwikiHeader1 gui=bold cterm=bold term=bold ctermfg=71 guifg=#6EBB49
hi VimwikiHeader2 gui=bold cterm=bold term=bold ctermfg=167 guifg=#f4a261
hi VimwikiHeader3 gui=bold cterm=bold term=bold ctermfg=33 guifg=#d75f5f
hi VimwikiHeader4 gui=bold cterm=bold term=bold ctermfg=91 guifg=#8700af
hi VimwikiHeader5 gui=bold cterm=bold term=bold ctermfg=91 guifg=#5f0f40
hi VimwikiLink gui=underline guifg=#569CD6
" }}}

