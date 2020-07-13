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

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Additional remappings
nmap <leader>ar <Plug>(coc-rename)
nmap <silent> <leader>aj <Plug>(coc-diagnostic-next)
nmap <silent> <leader>aa <Plug>(coc-codeaction-line)
vmap <silent> <leader>aa <Plug>(coc-codeaction-selected)
nmap <silent> <leader>ak <Plug>(coc-diagnostic-prev)
nmap <leader>af  <Plug>(coc-fix-current)
nmap <leader>ap :call CocAction('format')<cr>
nmap <leader>ao :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <leader>ac  :<C-u>CocList commands<cr>

" WhichKey
let g:which_key_map.a = {
            \ 'name' : '+autocomplete',
            \ 'r' : 'rename',
            \ 'j' : 'next-diagnostic',
            \ 'a' : 'actions-in-line',
            \ 'k' : 'prev-diagnostic',
            \ 'f' : 'fix-current-line',
            \ 'p' : 'pretty',
            \ 'o' : 'organize-imports',
            \ 'c' : 'commands',
            \ }
" }}}

" Settings {{{
set pyxversion=3
let g:coc_snippet_next = '<tab>'
let g:UltiSnipsExpandTrigger="<cr>"
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-tslint',
            \ 'coc-pairs',
            \ 'coc-snippets',
            \ 'coc-ultisnips',
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