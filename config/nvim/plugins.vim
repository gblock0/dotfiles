call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'

" Syntax Plugins
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown'

" Utilities
Plug 'christoomey/vim-tmux-navigator'
Plug 'gregsexton/MatchTag'
Plug 'Raimondi/delimitMate'															" Auto-pairing brackets, parens, and quotes
Plug 'tpope/vim-fugitive'																" Git stuff
Plug 'scrooloose/nerdtree'															" File tree explorer
Plug 'tpope/vim-surround'																" Change surrounding quotes, brackets, etc.
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'													" Easily comment/uncomment thing using shortcuts
Plug 'moll/vim-node'																		" Makes Vim better for Node developement
Plug 'lfilho/cosco.vim'																	" Comma and semi-colon insertion bliss
Plug 'airblade/vim-gitgutter'														" Allows stuff in the gutter
Plug 'gioele/vim-autoswap'															" Swap file handling
Plug 'Xuyuanp/nerdtree-git-plugin'											" See git indicator symbols in NERDTree
Plug 'Chiel92/vim-autoformat'														" Autoformatting
Plug 'neovim/node-host', {'do': 'npm install' }					" Need this to run node plugins
" Plug '~/neovim-autoformat'														" Async autoformatting
" Plug 'gblock0/neovim-autoformat'											" Async autoformatting
Plug 'bling/vim-airline'																" Replacement for Powerline
Plug 'junegunn/limelight.vim'														" Highlights section of code
Plug 'vim-scripts/ZoomWin'															" Zoom in on current pane
Plug 'vim-scripts/matchit.zip'													" Expanding the % operator for HTML
Plug 'xolox/vim-lua-ftplugin'														" Lua Plugin
Plug 'xolox/vim-misc'																		" Misc Dependencies for xolox's plugins
Plug 'vasconcelloslf/vim-interestingwords'							" Highlight different words in a file
Plug 'mattn/emmet-vim'																	" Adding Emmet
Plug 'benekastah/neomake'																" Syntax checking with support for Neovim async
Plug 'Shougo/deoplete.nvim'														" Autocompletion for neovim
Plug 'janko-m/vim-test'

" Js plugins...
Plug 'othree/yajs.vim', { 'for': 'javascript' }																	" More JavaScript syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
call plug#end()
