call plug#begin('~/.config/nvim/plugged')

"Current Theme
Plug 'gblock0/oceanic-next'

Plug 'lukas-reineke/format.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-lua/lsp-status.nvim'

Plug 'rafcamlet/nvim-luapad'

" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'} 

" nvim-lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'onsails/lspkind-nvim'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'voldikss/vim-floaterm'

" Debugging
Plug 'janko/vim-test'
Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Telescope/Fuzzy finding
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'kevinhwang91/nvim-bqf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'kevinhwang91/nvim-hlslens'

Plug 'b3nj5m1n/kommentary' " Comment helper

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
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'szw/vim-maximizer'

call plug#end()
