" Helper functions {{{
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

" Mappings {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> ga <Plug>(coc-codeaction-line)
vmap <silent> ga <Plug>(coc-codeaction-selected)
" Symbol renaming.
nmap <f2> <Plug>(coc-rename)
" Find symbol of current document.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<C-j>u\<CR>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<C-k>u\<c-CR>"

inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
" }}}

" Settings {{{
set pyxversion=3
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
            \ 'coc-java',
            \ 'coc-marketplace',
            \ ]

let g:coc_sources_disable_map = {
            \ 'ledger': ['snippets', 'snippets-source']
            \ }

" }}}
