" Helper functions {{{
call SetupCommandAlias("lb", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos -U")
call SetupCommandAlias("lc", "let g:ledger_winpos = 'R'<CR>:Ledger bal Activos Pasivos")
call SetupCommandAlias("lr", "let g:ledger_winpos = 'B'<CR>:Ledger register -U")
" }}}

" Autocommand {{{
augroup LedgerGroup
    autocmd!
    autocmd FileType ledger 
                \ setlocal foldmethod=marker|
                \ setlocal foldlevel=0|
                \ noremap <buffer> <Leader>ls :call ledger#transaction_state_toggle(line('.'), ' *')<CR>|
                \ inoremap <buffer> ñ ñ|
                \ inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>|
                \ vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>|
                \ inoremap <buffer> <CR> <Esc>:LedgerAlign<CR>A<CR>
augroup END

" }}}

" Settings {{{
let g:ledger_default_commodity="€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_decimal_sep = ","
let g:ledger_winpos = 'r'
let g:ledger_date_format = '%Y-%m-%d'
let g:ledger_extra_options = '--date-format=%Y-%m-%d'
let g:ledger_fillstring = '    -'
" }}}

" Colors {{{
hi LedgerNumber guifg=#569CD6
hi LedgerNegativeNumber guifg=#eF5F70
" }}}
