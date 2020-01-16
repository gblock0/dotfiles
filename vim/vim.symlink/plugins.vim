call plug#begin('~/.vim/plugged')

"Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'

" Syntax Plugins
Plug 'othree/html5.vim', { 'for' : 'html' }
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'ap/vim-css-color', { 'for' : ['css', 'scss']}
Plug 'tpope/vim-markdown', { 'for' : 'markdown' }

" Utilities
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'cohama/agit.vim'																	" Git plugin to easily go through all your commits
Plug 'vim-airline/vim-airline'													" Replacement for Powerline
Plug 'vim-airline/vim-airline-themes'										" Airline themes
Plug 'nathanaelkane/vim-indent-guides'									" Indentation Guides
Plug 'xolox/vim-misc', { 'for': 'lua'}									" Misc Dependencies for xolox's plugins
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua'}					" Lua Plugin
Plug 'lfv89/vim-interestingwords'												" Highlight different words in a file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'maksimr/vim-jsbeautify'

" Js plugins...
Plug 'othree/yajs.vim'																" More JavaScript syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim'

" Markdown
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
call plug#end()
