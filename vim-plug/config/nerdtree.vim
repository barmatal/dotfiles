" Helper functions {{{
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
" }}}

" Mappings {{{
map <leader>n :call NERDTreeToggleAndFind()<CR>
let g:which_key_map.n = 'nerdtree-toggle'
" }}}

" Settings {{{
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
