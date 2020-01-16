call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
Plug 'tyrannicaltoucan/vim-deep-space'

" Syntax Plugins
Plug 'othree/html5.vim', { 'for' : 'html' }
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown', { 'for' : 'markdown' }

" Utilities
Plug 'christoomey/vim-tmux-navigator'
Plug 'sbdchd/neoformat'
Plug 'gregsexton/MatchTag'
Plug 'Raimondi/delimitMate'															" Auto-pairing brackets, parens, and quotes
Plug 'tpope/vim-fugitive'																" Git stuff
Plug 'scrooloose/nerdtree'															" File tree explorer
Plug 'tpope/vim-surround'																" Change surrounding quotes, brackets, etc.
Plug 'ctrlpvim/ctrlp.vim'																" Fuzzy File searching
Plug 'scrooloose/nerdcommenter'													" Easily comment/uncomment thing using shortcuts
Plug 'moll/vim-node'																		" Makes Vim better for Node developement
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'														" Allows stuff in the gutter
Plug 'gioele/vim-autoswap'															" Swap file handling
Plug 'Xuyuanp/nerdtree-git-plugin'											" See git indicator symbols in NERDTree
Plug 'Chiel92/vim-autoformat'														" Autoformatting
Plug 'neovim/node-host', {'do': 'npm install' }					" Need this to run node plugins
" Plug '~/neovim-autoformat'														" Async autoformatting
Plug 'cohama/agit.vim'																	" Git plugin to easily go through all your commits
" Plug 'gblock0/neovim-autoformat'											" Async autoformatting
Plug 'vim-airline/vim-airline'													" Replacement for Powerline
Plug 'vim-airline/vim-airline-themes'										" Airline themes
Plug 'nathanaelkane/vim-indent-guides'									" Indentation Guides
Plug 'xolox/vim-misc'																		" Misc Dependencies for xolox's plugins
Plug 'xolox/vim-lua-ftplugin'														" Lua Plugin
Plug 'lfv89/vim-interestingwords'												" Highlight different words in a file
Plug 'benekastah/neomake'																" Syntax checking with support for Neovim async
" Plug 'Shougo/deoplete.nvim'															" Autocompletion for neovim
Plug 'janko-m/vim-test'																	" Test single files or tests
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'

" Js plugins...
Plug 'othree/yajs.vim'																" More JavaScript syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'

Plug 'othree/es.next.syntax.vim'

" Markdown
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
call plug#end()
