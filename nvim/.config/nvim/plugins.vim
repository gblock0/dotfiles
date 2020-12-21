call plug#begin('~/.config/nvim/plugged')

"Current Theme
Plug 'mhartington/oceanic-next'

" Testing themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'cocopon/iceberg.vim'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

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
Plug 'preservim/nerdtree'
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
Plug 'junegunn/fzf'									    " Fast file searching
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release' }
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'DanilaMihailov/beacon.nvim'



call plug#end()
