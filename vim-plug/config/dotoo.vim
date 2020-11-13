" Autocommands {{{
autocmd BufNewFile,BufRead,BufEnter *.org setf dotoo
augroup DoTooGroup
                autocmd!
                autocmd filetype dotoo
                                \ setlocal isk+=-|
                                \ setlocal noautoindent nocindent nosmartindent indentexpr=|
                                \ nmap <buffer> <silent> <leader>d cit
augroup END
" }}}

" Settings {{{
let g:dotoo#agenda#warning_days = '3d'
let g:dotoo#agenda#files = ['~/Nextcloud/Org/*.org']
let g:dotoo#time#time_ago_short = 0
let g:dotoo#capture#refile = expand("~/Nextcloud/Org/_Inbox.org")
let g:dotoo#parser#todo_keywords = [
                                \ 'TODO',
                                \ 'NEXT',
                                \ 'WAITING',
                                \ '|',
                                \ 'CANCELLED',
                                \ 'DONE']
" let g:dotoo_todo_keyword_faces = [
"   \ ['TODO', [':foreground 160', ':weight bold']],
"   \ ['NEXT', [':foreground 27', ':weight bold']],
"   \ ['DONE', [':foreground 22', ':weight bold']],
"   \ ['WAITING', [':foreground 202', ':weight bold']],
"   \ ['CANCELLED', [':foreground 22', ':weight bold']],
"   \ ['MEETING', [':foreground 22', ':weight bold']],
"   \ ['PHONE', [':foreground 22', ':weight bold']]
"   \ ]
let g:dotoo#capture#templates = {
                                \ 't': {
                                \   'description': 'Todo',
                                \   'lines': [
                                \     '* TODO %?',
                                \   ],
                                \  'target': '~/Nextcloud/Org/_Inbox.org'
                                \ },
                                \ 'n': {
                                \   'description': 'Note',
                                \   'lines': ['* %? :NOTE:'],
                                \   'target': '~/Nextcloud/Org/_Inbox.org'
                                \ },
                                \ 'h': {
                                \   'description': 'Habit',
                                \   'lines': [
                                \     '* TODO %?',
                                \     'SCHEDULED: <%(strftime(g:dotoo#time#date_day_format)) +1d>',
                                \   ],
                                \   'target': '~/Nextcloud/Org/Rutinas.org'
                                \ }
                                \}

let g:dotoo#capture#clock = 0
let g:dotoo_headline_shade_leading_stars = 1
" }}}

" Mappings {{{1 "

" Quick capture todo
nmap <leader><leader> gCt

" }}}