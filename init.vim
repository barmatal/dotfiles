"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" Optimized based on https://github.com/ChristianChiarulli/nvim

source $LOCALAPPDATA\nvim\vim-plug\plugins.vim
source $LOCALAPPDATA\nvim\general\settings.vim
source $LOCALAPPDATA\nvim\general\mappings.vim
source $LOCALAPPDATA\nvim\general\colorschemes.vim

if !exists('g:vscode') 
    source $LOCALAPPDATA\nvim\vim-plug\config\which-key.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\quickscope.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\airline.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\highlightedyank.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\ledger.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\polyglot.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\startify.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\neoterm.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\vimwiki.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\md-img-paste.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\autosave.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\rooter.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\nerdtree.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\git.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\fzf.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\coc.vim
    source $LOCALAPPDATA\nvim\vim-plug\config\dotoo.vim
endif