call plug#begin('~/.config/nvim/plugged')

"Current Theme
Plug 'mhartington/oceanic-next'

if has('nvim')
	Plug 'norcalli/nvim-colorizer.lua'

    " Telescope setup
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " nvim-lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'

    "nvim-treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
endif

" Utilities

" {{{ Fern plugins
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" }}}

Plug 'dag/vim-fish'
Plug 'christoomey/vim-tmux-navigator'					" Allows navigation between vim and tmux
Plug 'gregsexton/MatchTag'								" Highlights the matching HTML tag
Plug 'tpope/vim-fugitive'								" Git stuff
Plug 'tpope/vim-surround'								" Change surrounding quotes, brackets, etc.
Plug 'scrooloose/nerdcommenter'							" Easily comment/uncomment thing using shortcuts
Plug 'tweekmonster/startuptime.vim'                     " Uncomment to test startup time
Plug 'jiangmiao/auto-pairs'
if !has('gui_running')
	Plug 'airblade/vim-gitgutter'					    " Allows stuff in the gutter
endif
Plug 'gioele/vim-autoswap'								" Swap file handling
Plug 'cohama/agit.vim'									" Git plugin to easily go through all your commits
Plug 'itchyny/lightline.vim'						    " Status line plugin
Plug 'niklaas/lightline-gitdiff'                        " Show git status in lightline.vim
Plug 'nathanaelkane/vim-indent-guides'					" Indentation Guides
Plug 'lfv89/vim-interestingwords'						" Highlight different words in a file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" Fast file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'DanilaMihailov/beacon.nvim'



call plug#end()
