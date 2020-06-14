call plug#begin('~/.vim/plugged')

if !exists('g:vscode') 
  " Plug 'liuchengxu/vista.vim'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-speeddating'
    Plug 'junegunn/vim-peekaboo'
    Plug 'alvan/vim-closetag'
    Plug 'unblevable/quick-scope'
    Plug 'liuchengxu/vim-which-key'
    Plug 'gryf/wombat256grf'
    Plug 'rakr/vim-one'
    Plug 'nanotech/jellybeans.vim'
    Plug 'morhetz/gruvbox'
    Plug 'tomasiser/vim-code-dark'
    Plug 'psliwka/vim-smoothie'
    Plug 'machakann/vim-highlightedyank'
    Plug 'ledger/vim-ledger', { 'tag': 'v1.2.0' }            " Ledger files plugin
    Plug 'sheerun/vim-polyglot'            " Open different formats
    Plug 'mhinz/vim-startify'
    Plug 'kassio/neoterm'
    Plug 'vim-airline/vim-airline'        " Bottom line information
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vimwiki/vimwiki'
    Plug 'ferrine/md-img-paste.vim'
    Plug '907th/vim-auto-save'   " Autosave files
    Plug 'airblade/vim-rooter'
    Plug 'scrooloose/nerdtree'  " File sidebar functionality
    Plug 'ryanoasis/vim-devicons'
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'      " Git wrapper
    Plug 'airblade/vim-gitgutter'  " Git wrapper
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'APZelos/blamer.nvim'
    Plug 'honza/vim-snippets'
endif
    " Plugs for VSCode
    Plug 'tpope/vim-surround'      " Surround with brackets, parenthesis, etc
    Plug 'tpope/vim-commentary'    " Easily add/remove comments
call plug#end()              " required
