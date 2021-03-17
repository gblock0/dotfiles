call plug#begin('~/.config/nvim/plugged')

"Current Theme
Plug 'mhartington/oceanic-next'
Plug 'christianchiarulli/nvcode-color-schemes.vim'

Plug 'sbdchd/neoformat'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-lua/lsp-status.nvim'

Plug 'rafcamlet/nvim-luapad'

" nvim-lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'


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
Plug 'lewis6991/gitsigns.nvim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

Plug 'onsails/lspkind-nvim'
Plug 'b3nj5m1n/kommentary'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Utilities
Plug 'puremourning/vimspector'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'christoomey/vim-tmux-navigator'					" Allows navigation between vim and tmux
Plug 'gregsexton/MatchTag'								" Highlights the matching HTML tag
Plug 'tpope/vim-fugitive'								" Git stuff
Plug 'tpope/vim-surround'								" Change surrounding quotes, brackets, etc.
Plug 'tweekmonster/startuptime.vim'                     " Uncomment to test startup time
Plug 'gioele/vim-autoswap'								" Swap file handling
Plug 'lfv89/vim-interestingwords'						" Highlight different words in a file
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'szw/vim-maximizer'

call plug#end()
