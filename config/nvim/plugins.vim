call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'kaicataldo/material.vim'

" Syntax Plugins

if has('nvim')
	Plug 'norcalli/nvim-colorizer.lua'
endif

Plug 'sheerun/vim-polyglot'								" A collection of language packs for vim

" Utilities
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'					" Allows navigation between vim and tmux
Plug 'gregsexton/MatchTag'								" Highlights the matching HTML tag
Plug 'tpope/vim-fugitive'								" Git stuff
Plug 'tpope/vim-surround'								" Change surrounding quotes, brackets, etc.
Plug 'scrooloose/nerdcommenter'							" Easily comment/uncomment thing using shortcuts
Plug 'tweekmonster/startuptime.vim'                   " Uncomment to test startup time
if !has('gui_running')
	Plug 'airblade/vim-gitgutter'					    " Allows stuff in the gutter
endif
Plug 'gioele/vim-autoswap'								" Swap file handling
Plug 'cohama/agit.vim'									" Git plugin to easily go through all your commits
Plug 'itchyny/lightline.vim'						    " Status line plugin
Plug 'gblock0/lightline-gitdiff'                        " Show git status in lightline.vim
Plug 'nathanaelkane/vim-indent-guides'					" Indentation Guides
Plug 'lfv89/vim-interestingwords'						" Highlight different words in a file
Plug 'junegunn/fzf'									    " Fast file searching
Plug 'junegunn/fzf.vim'

call plug#end()
