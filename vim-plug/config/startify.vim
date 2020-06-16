" Mappings
nmap <leader>s :Startify<cr>
let g:which_key_map.s = 'startify'

" Settings
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [
                        \ {'d': '~\Nextcloud\Config\DevScripts'},
                        \ {'i': '~\Nextcloud\Wiki\index.md'},
                        \ {'t': '~\Nextcloud\Wiki\Temp.md'},
                        \ {'r': '~\AppData\Local\nvim\init.vim'},
                        \ {'l': '~\Nextcloud\Wiki\ledger.txt'},
                        \ {'c': '~\Nextcloud\Wiki\ledger-credit.txt'},
                        \ ]
let g:startify_lists = [
                        \ { 'type': 'sessions',  'header': ['   Sessions']       },
                        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                        \ { 'type': 'commands',  'header': ['   Bookmarks']       },
                        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                        \ { 'type': 'files',     'header': ['   MRU']            },
                        \ ]
let g:startify_commands = []
let g:startify_change_to_dir = 0
let g:startify_session_persistence = 1
let g:startify_skiplist = [
                        \ '\vimrc',
                        \ 'eval.txt',
                        \ '.git\',
                        \ '.vim\',
                        \ '\nvim\runtime',
                        \ '\Local\Temp',
                        \ ]
let g:startify_custom_indices = ['a', 'b', 'e', 'g']
let g:ascii = [
                        \ '       _  __     _      ',
                        \ '      / |/ /  __(_)_ _  ',
                        \ '     /    / |/ / /  ` \ ',
                        \ '    /_/|_/|___/_/_/_/_/ ',
                        \]
let g:startify_custom_header =
                        \ 'startify#pad(g:ascii + startify#fortune#boxed())'
let g:startify_relative_path = 1

" Colors
hi StartifyFile gui=bold cterm=bold term=bold ctermfg=167 guifg=#f4a261