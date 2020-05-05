call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'

" Syntax Plugins

if has('nvim')
	Plug 'norcalli/nvim-colorizer.lua'
endif
Plug 'sheerun/vim-polyglot'																" A collection of language packs for vim

" Utilities
Plug 'christoomey/vim-tmux-navigator'										" Allows navigation between vim and tmux
Plug 'sbdchd/neoformat'																	" Formats the current buffer
Plug 'gregsexton/MatchTag'															" Highlights the matching HTML tag
Plug 'Raimondi/delimitMate'															" Auto-pairing brackets, parens, and quotes
Plug 'tpope/vim-fugitive'																" Git stuff
Plug 'scrooloose/nerdtree'															" File tree explorer
Plug 'tpope/vim-surround'																" Change surrounding quotes, brackets, etc.
Plug 'scrooloose/nerdcommenter'													" Easily comment/uncomment thing using shortcuts
if !has('gui_running')
	Plug 'airblade/vim-gitgutter'														" Allows stuff in the gutter
endif
Plug 'gioele/vim-autoswap'															" Swap file handling
Plug 'Xuyuanp/nerdtree-git-plugin'											" See git indicator symbols in NERDTree
Plug 'cohama/agit.vim'																	" Git plugin to easily go through all your commits
Plug 'vim-airline/vim-airline'													" Replacement for Powerline
Plug 'ctrlpvim/ctrlp.vim'																" Fuzzy File searching
Plug 'vim-airline/vim-airline-themes'										" Airline themes
Plug 'nathanaelkane/vim-indent-guides'									" Indentation Guides
Plug 'lfv89/vim-interestingwords'												" Highlight different words in a file
Plug 'benekastah/neomake'																" Syntax checking with support for Neovim async
Plug 'junegunn/fzf'																			" Fast file searching
Plug 'junegunn/fzf.vim'

call plug#end()
