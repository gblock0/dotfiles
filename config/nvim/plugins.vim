call plug#begin('~/.config/nvim/plugged')

"Current Theme
Plug 'gblock0/oceanic-next', { 'branch': 'AddLspColors' }

if has('nvim')
	Plug 'norcalli/nvim-colorizer.lua'
  Plug 'RRethy/vim-illuminate'
  Plug 'sbdchd/neoformat'

  " nvim-lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
  Plug 'glepnir/lspsaga.nvim'

  "nvim-treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Debugging
  Plug 'janko/vim-test'
  Plug 'glepnir/galaxyline.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  Plug 'onsails/lspkind-nvim'
  Plug 'b3nj5m1n/kommentary'

endif

" Utilities
Plug 'puremourning/vimspector'

" {{{ Fern plugins
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" }}}

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'christoomey/vim-tmux-navigator'					" Allows navigation between vim and tmux
Plug 'gregsexton/MatchTag'								" Highlights the matching HTML tag
Plug 'tpope/vim-fugitive'								" Git stuff
Plug 'tpope/vim-surround'								" Change surrounding quotes, brackets, etc.
" Plug 'scrooloose/nerdcommenter'							" Easily comment/uncomment thing using shortcuts
"Plug 'tweekmonster/startuptime.vim'                     " Uncomment to test startup time
Plug 'mhinz/vim-signify'
Plug 'gioele/vim-autoswap'								" Swap file handling
Plug 'cohama/agit.vim'									" Git plugin to easily go through all your commits
Plug 'lfv89/vim-interestingwords'						" Highlight different words in a file
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'szw/vim-maximizer'

call plug#end()
