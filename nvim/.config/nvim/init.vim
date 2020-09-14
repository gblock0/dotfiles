"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set a map leader for more key combos
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Set true colors
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
	set termguicolors
endif

" switch syntax highlighting on
syntax enable

" load plugins from vim-plug,
" plugin configs in ~/.config/nvim/plugin are loaded automatically
source ~/.config/nvim/plugins.vim

set background=dark

" the configuration options should be placed before `colorscheme miramare`
let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1

colorscheme material

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template

set nocompatible " not compatible with vi
set autoread " detect when a file is changed

" Turn off weird red highlight errors in init.vim
hi ERROR NONE

" make backspace behave in a sane manner
set backspace=indent,eol,start

" No Escape Keys in Insert Mode
" set noesckeys

set history=1000 " change history to 1000
set textwidth=0

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set expandtab " insert tabs rather than spaces for <Tab>
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

if has('mouse')
	set mouse=a
endif

if has('persistent_undo')
	set undolevels=5000
	set undodir=$HOME/.VIM_UNDO_FILES
	set undofile
endif

set clipboard=unnamed

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" file type specific settings
if has('autocmd') && !exists('autocommands_loaded')

	source ~/.config/nvim/filetype_configs.vim
	let autocommands_loaded = 1

	" automatically resize panes on resize
	autocmd VimResized * exe 'normal! \<c-w>='
endif

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldlevel=99
set nofoldenable

" Remap colon commands to ignore shift
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> w ((getcmdtype() is# ':' && getcmdline() is# 'w')?('w'):('w'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?('qa'):('Qa'))

" Remap :s to :sus
cnoreabbrev <expr> s ((getcmdtype() is# ':' && getcmdline() is# 's')?('sus'):('s'))


" Remap Space-g to :sus
nnoremap <leader>g :sus<CR>

" Toggle relative line numbers
nnoremap <leader>rn :set rnu!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h12

set scrolloff=3 " lines of text around cursor
set wildmenu " enhanced command line completion
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set shell=$SHELL
set cmdheight=1 " command bar height


set title " set terminal title

" Searching
set incsearch " set incremental search, like modern browsers
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set lazyredraw " don't redraw while executing macros
set ttyfast			" fast redraw

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set tm=500

set number
set relativenumber

" Highlight current line
set cursorline

" Hide Scrollbar
set guioptions-=r

" do not Wrap long lines
set nowrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.nvim-tmp
set directory=~/.nvim-tmp


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => StatusLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " show the satus line all the time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings/shortcuts for functionality
" Additional, plugin-specific mappings are located under
" the plugins section

nnoremap # "fyiw :/<c-r>f<cr>"

" Close location list or quickfix window
nnoremap <leader>q :ccl<Space><Bar><Space>lcl<CR>

" Remap p so that paste doesn't overwrite the 0 register
xnoremap p pgvy

nnoremap <leader>U viwU
nnoremap <leader>u viwu
nnoremap mm $%

" Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right
nnoremap <BS> :noh<CR> :match none<CR>h

" Disable help F1 key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

inoremap jj <ESC>

" Disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" shortcut to save
nmap <leader><leader> :wa<cr>

nnoremap " '
nnoremap ' "

" disable Ex mode
noremap Q <NOP>

" Reselect the text that was just pasted
nnoremap <leader>v V`]

nmap <leader>l :IndentGuidesToggle<cr>

" Create a new vsplit, switch to it and open CtrlP
nnoremap <leader>w <C-w>v<C-w>l :FzfPreviewProjectFiles<cr>

" Create a new split, switch to it and open CtrlP
nnoremap <leader>s <C-w>s<C-w>j :FzfPreviewProjectFiles<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <leader>= <C-W>=

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

" Reload vimrc
nnoremap <leader>re :so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<CR>

" Add semi colon to the end of current line and return cursor to position
nnoremap <leader>; maA;<esc>`a:wa<CR>

nnoremap p p`[v`]=

" Map F1 to the Esc key
map <F1> <Esc>
imap <F1> <Esc>


let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! MovePane(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" recursively search up from dirname, sourcing all .vimrc.local files along the way
function! ApplyLocalSettings(dirname)
	" convert windows paths to unix style
	let l:curDir = substitute(a:dirname, '\\', '/', 'g')

	" walk to the top of the dir tree
	let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, '/'))
	if isdirectory(l:parentDir)
		call ApplyLocalSettings(l:parentDir)
	endif

	" now walk back down the path and source .vimsettings as you find them.
	" child directories can inherit from their parents
	let l:settingsFile = a:dirname . '/.vimrc.local'
	if filereadable(l:settingsFile)
		exec ':source' . l:settingsFile
	endif
endfunction

set nospell

call ApplyLocalSettings(expand('.'))
