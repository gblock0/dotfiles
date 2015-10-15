call plug#begin('~/.vim/plugged')

"Themes
Plug 'w0ng/vim-hybrid'

" Syntax Plugins
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown'

" Utilities
Plug 'christoomey/vim-tmux-navigator'
Plug 'gregsexton/MatchTag'
Plug 'Raimondi/delimitMate'															" Auto closes quotes, parens, brackets, etc.
Plug 'tpope/vim-fugitive'																" Git stuff
Plug 'scrooloose/syntastic'															" Syntax checking stuff
Plug 'rking/ag.vim'																			" Fast grep replacement
Plug 'scrooloose/nerdtree'															" File tree explorer
Plug 'tpope/vim-surround'																" Change surrounding quotes, brackets, etc.
Plug 'ctrlpvim/ctrlp.vim'																"	File searcher
Plug 'scrooloose/nerdcommenter'													" Easily comment/uncomment thing using shortcuts
Plug 'moll/vim-node'																		" Makes Vim better for Node developement
Plug 'lfilho/cosco.vim'																	" Comma and semi-colon insertion bliss
Plug 'airblade/vim-gitgutter'														" Allows stuff in the gutter
Plug 'vitorgalvao/autoswap_mac'													" Swap file handling
Plug 'pangloss/vim-javascript'													" Javascript syntax highlighting
Plug 'Xuyuanp/nerdtree-git-plugin'											" See git indicator symbols in NERDTree
Plug 'vim-scripts/mru.vim'															" See most recently used files
Plug 'Chiel92/vim-autoformat'														" Autoformatting
Plug 'bling/vim-airline'																" Replacement for Powerline
" Plug 'Shougo/neocomplete.vim'														" Autocomplete
" Plug 'ludovicchabant/vim-gutentags'											" Updates Tags on Save of files
Plug 'junegunn/limelight.vim'														" Highlights section of code
Plug 'sickill/vim-pasta'																" Smart indenting on paste
Plug 'vim-scripts/ZoomWin'															" Zoom in on current pane
Plug 'vim-scripts/matchit.zip'													" Expanding the % operator for HTML
Plug 'unblevable/quick-scope'														" Highlight characters to target when using T/t F/f
Plug 'jiangmiao/auto-pairs'															" Auto-pairing brackets, parens, and quotes
Plug 'xolox/vim-lua-ftplugin'														" Lua Plugin
Plug 'xolox/vim-misc'																		" Misc Dependencies for xolox's plugins
Plug 'suan/vim-instant-markdown'												" Markdown Preview in the browser
Plug 'vasconcelloslf/vim-interestingwords'							" Highlight different words in a file
Plug 'mattn/emmet-vim'																	" Adding Emmet

" Js plugins...
Plug 'othree/yajs.vim'																	" More JavaScript syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'rschmukler/pangloss-vim-indent'
Plug 'vim-scripts/SyntaxComplete'												" More syntax highlighting
Plug 'marijnh/tern_for_vim', { 'do' : 'npm install' }		" Autocompletion engine

call plug#end()
