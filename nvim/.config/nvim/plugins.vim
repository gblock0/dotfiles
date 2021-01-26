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

  "nvim-treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Debugging
  Plug 'janko/vim-test'

endif

" Utilities

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
Plug 'scrooloose/nerdcommenter'							" Easily comment/uncomment thing using shortcuts
"Plug 'tweekmonster/startuptime.vim'                     " Uncomment to test startup time
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'					    " Allows stuff in the gutter
Plug 'gioele/vim-autoswap'								" Swap file handling
Plug 'cohama/agit.vim'									" Git plugin to easily go through all your commits
Plug 'itchyny/lightline.vim'						    " Status line plugin
Plug 'niklaas/lightline-gitdiff'                        " Show git status in lightline.vim
Plug 'lfv89/vim-interestingwords'						" Highlight different words in a file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" Fast file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'szw/vim-maximizer'

call plug#end()
