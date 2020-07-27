" Helper functions
function! AutoSaveByFiletype()
    if &filetype != "ledger" && &filetype != "dotoo" && &filetype != "vimwiki"
        let g:auto_save_abort = 1
    endif
endfunction

" Settings
let g:auto_save_in_insert_mode = 0          " Do not autosave in insert mode
let g:auto_save = 1
let g:auto_save_presave_hook = 'call AutoSaveByFiletype()'
