
    let $FZF_DEFAULT_OPTS = '--multi --reverse'
    let $FZF_DEFAULT_OPTS= $FZF_DEFAULT_OPTS . ' --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104'
    let $FZF_DEFAULT_OPTS= $FZF_DEFAULT_OPTS . ' --color info:183,prompt:110,spinner:107,pointer:167,marker:215'
    let $FZF_DEFAULT_OPTS= $FZF_DEFAULT_OPTS . " --bind 'change:top,F2:toggle-preview'"
    " let $BAT_THEME = 'base16'
    " command! -bang -nargs=* Find call fzf#vim#grep('rg  --color always '.shellescape(<q-args>), 1, {'options': ['--color', 'hl:9,hl+:14']}, <bang>0)
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \   fzf#vim#with_preview({'options': ['--color', 'fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104,info:183,prompt:110,spinner:107,pointer:167,marker:215']}), <bang>0)
    " Remap ctrl-p to Files or GFiles
    nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
    nnoremap <C-f> :Rg<cr>
    vnoremap <C-f> y:Rg <C-R>=escape(@",'/\')<CR><CR>
    "Floating Window
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        call setbufvar(buf, '&signcolumn', 'no')

        let width = float2nr(&columns * 0.9)
        let height = float2nr(&lines * 0.8)
        let opts = { 'relative': 'editor',
                    \ 'row': (&lines - height) / 2,
                    \ 'col': (&columns - width) / 2,
                    \ 'width': width,
                    \ 'height': height,
                    \ 'style': 'minimal'
                    \}

        call nvim_open_win(buf, v:true, opts)
    endfunction

    " Git branch mgmt
    " fun! s:change_branch(e)
    "     let res = system("git checkout --track " . a:e)
    "     :e!
    "     :AirlineRefresh
    "     :echom "Changed branch to" . a:e
    " endfun

    " command! Gbranch call fzf#run(
    "             \ {
    "             \ 'source': 'git branch -a',
    "             \ 'sink': function('<sid>change_branch'),
    "             \ 'options': '-m',
    "             \ 'down': '20%',
    "             \ })

    " au FileType fzf silent! map <Esc> <c-q>

  au FileType fzf silent! tunmap <buffer> <Esc>
  au FileType fzf tmap <buffer> <c-j> <down>
  au FileType fzf tmap <buffer> <c-k> <up>
function! s:open_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0]
  if l:branch ==? '*'
    let l:branch = l:parser[1]
  endif
  execute '!git checkout ' . l:branch
endfunction

command! -bang -nargs=0 Gbranch
  \ call fzf#vim#grep(
  \   'git branch -a', 0,
  \   {
  \     'sink': function('s:open_branch_fzf')
  \   },
  \   <bang>0
  \ )