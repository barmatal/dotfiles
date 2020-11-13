call plug#begin('~/.vim/plugged')

" Common plugins (neovim + VSCode) {{{
Plug 'tpope/vim-surround'                       " Surround with brackets, parenthesis, etc
Plug 'tpope/vim-commentary'                     " Easily add/remove comments
" }}}

" Plugins excluded from VSCode
if !exists('g:vscode') 

  " Colorschemes {{{
  " Plug 'gryf/wombat256grf'
  " Plug 'rakr/vim-one'
  " Plug 'nanotech/jellybeans.vim'
  " Plug 'morhetz/gruvbox'
  Plug 'tomasiser/vim-code-dark'
  " }}}

  " Filetypes {{{
  Plug 'tpope/vim-sleuth'                       " Automatically set tab config per filetype
  Plug 'ledger/vim-ledger', { 'tag': 'v1.2.0' }                         " Ledger files plugin
  Plug 'sheerun/vim-polyglot'                   " Open different formats
  Plug 'vimwiki/vimwiki'                        " Vimwiki and markdown filetype
  Plug 'ferrine/md-img-paste.vim'
  Plug 'dhruvasagar/vim-dotoo'
  " }}}

  " Additional functionality {{{
  Plug 'junegunn/vim-peekaboo'                  " Check register content automatically
  Plug 'unblevable/quick-scope'                 " Visual help for horizontal moving
  Plug 'liuchengxu/vim-which-key'               " Visual mappings helper
  Plug 'psliwka/vim-smoothie'                   " Smooth scrolling
  Plug 'machakann/vim-highlightedyank'          " Highlight yanked text
  Plug 'kassio/neoterm'                         " Better terminal handling
  Plug 'mhinz/vim-startify'                     " Better start buffer
  Plug 'vim-airline/vim-airline'                " Visual airline
  Plug 'vim-airline/vim-airline-themes'
  Plug '907th/vim-auto-save'                    " Auto-save some filetypes
  " }}}
  
  " Programming {{{
  Plug 'alvan/vim-closetag'                     " Close HTML tags automatically
  Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeFind' }                   " File sidebar functionality
  Plug 'ryanoasis/vim-devicons'
  Plug 'vwxyutarooo/nerdtree-devicons-syntax', { 'on':  'NERDTreeFind' }
  Plug 'airblade/vim-rooter'                    " Automatically set up root directory
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'                       " Fuzzy Search
  Plug 'tpope/vim-fugitive'                     " Git wrapper
  Plug 'mhinz/vim-signify'
  Plug 'APZelos/blamer.nvim', { 'on':  'BlamerToggle' }                    " Inline blame
  Plug 'barmatal/vim-snippets'
  Plug 'SirVer/ultisnips'
  Plug 'neoclide/coc.nvim',{'branch': 'release'} " Autocompletion and snippets
  " }}}

endif

call plug#end()
