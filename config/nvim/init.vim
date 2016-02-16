"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set a map leader for more key combos
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" load plugins from vim-plug

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plugin_configs.vim

" switch syntax highlighting on
syntax enable

" Color Scheme Settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme hybrid_material
set background=dark

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
set noesckeys

set history=1000 " change history to 1000
set textwidth=0

" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
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

	source ~/.config/nvim/filetype_settings.vim
	let autocommands_loaded = 1
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
	autocmd FileType *.md.js :call SyntasticReset<cr>
	autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell
	autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"


	" automatically resize panes on resize
	autocmd VimResized * exe 'normal! \<c-w>='

	" Set cursor line if in file and unset when leaving file
	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline

	" save all files on focus lost, ignoring warnings about untitled buffers
	autocmd FocusLost * silent! wa

	" Delete trailing spaces before saving
	autocmd BufWritePre * :%s/\s\+$//e

	let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

	filetype plugin indent on

endif

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
	set guifont=Source\ Code\ Pro:h12
endif

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

augroup linenumbers
	autocmd!
	autocmd BufEnter *    :set relativenumber
	autocmd BufLeave *    :set number norelativenumber
	autocmd WinEnter *    :set relativenumber
	autocmd WinLeave *    :set number norelativenumber
	autocmd InsertEnter * :set number norelativenumber
	autocmd InsertLeave * :set relativenumber
	autocmd FocusLost *   :set number norelativenumber
	autocmd FocusGained * :set relativenumber
augroup END


set autoindent " automatically set indent of new line

" Highlight current line
set cursorline

" Hide Scrollbar
set guioptions-=r

" Wrap long lines
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

" Remappings to make macros easier to do
nnoremap <bs> @q
vnoremap <silent> <bs> :norm @q<cr>

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

" Disable arrow keys in all modes
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Disable help F1 key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Want a space after this
nnoremap <leader>a :Ag<Space>

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

" toggle invisible characters
" set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>

" Create a new vsplit, switch to it and open CtrlP
nnoremap <leader>w <C-w>v<C-w>l :GitFiles<CR>

" Create a new split, switch to it and open CtrlP
nnoremap <leader>s <C-w>s<C-w>j :GitFiles<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

" Format current file and return cursor to current position (shouldn't need this anymore if Autoformat is working)
nnoremap <leader>f :Autoformat<CR>:w<CR>

" Reload vimrc
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<CR>

" Add semi colon to the end of current line and return cursor to position
nnoremap <leader>; maA;<esc>`a:wa<CR>

nnoremap p p`[v`]=

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
