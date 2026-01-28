" Leader key mappings
let g:mapleader = " "
let g:maplocalleader = ","

" Global options
set mouse=a
set shiftround " round indent to a multiple of 'shiftwidth'
set undolevels=5000
let &undodir = expand("~/.VIM_UNDO_FILES")
set undofile
set clipboard=unnamedplus
set scrolloff=10 " lines of text around cursor
set wildoptions=pum
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set listchars=eol:¬,tab:>·,trail:~,space:␣ " set what whitespace characters look like
set updatetime=100 " keep buffers around

" Tab control
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 2 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set expandtab " insert tabs rather than spaces for <Tab>

" Window options
set cursorline " highlight current line
set number
set relativenumber
set foldlevel=99
set signcolumn=yes
set nowrap

" ============================================================================
" Key Mappings
" ============================================================================

" Alt + j/k moves selected lines down/up in insert mode
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" Normal mode remaps
nnoremap <F5> :set list!<cr>
nnoremap gp `[v`] " Reselect pasted text
nnoremap n nzzzv " Keep cursor in the middle of the screen when searching down
nnoremap N Nzzzv " Keep cursor in the middle of the screen when searching up


nnoremap Y y$ " Make 'Y' behave like other capital letters
nnoremap * *N " When highlighting a word, keep the cursor on the current word
nnoremap <BS> :noh<CR> :match none<CR>h " Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right
nnoremap <C-e> 3<C-e> " scroll the viewport faster
nnoremap <C-y> 3<C-y> " scroll the viewport faster

nnoremap <leader>rn :set relativenumber!<cr>
nnoremap <leader>q :ccl <Bar> lcl<cr> " Close location list or quickfix window
nnoremap <leader><leader> :wa<cr> " shortcut to save
nnoremap <leader>= <C-W>= " Equalize splits
nnoremap <leader>re :so ~/.vimrc<CR>:noh<CR>:echo "vimrc Reload!"<cr> " Reload vimrc
nnoremap <leader>; maA;<esc>`a:wa<CR> " Add semi colon to the end of current line and return cursor to position
nnoremap cp :let @+ = expand("%")<cr> " Copy current file's path to clipboard
nnoremap H ^ " Use H to go to beginning of line
nnoremap L $ " Use L to go to end of line

" Visual select mode remaps
" Alt + j/k moves selected lines down/up in visual-block mode
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
xnoremap p pgvy " Remap 'p' so that paste doesn't overwrite the 0 register

" ============================================================================
" Autocmds
" ============================================================================

" Jump to last position in file when the file is opened
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype !=# 'commit' | execute "normal! g`\"" | endif

" Text File Settings
autocmd BufReadPre *.txt set spell spelllang=en_us

" Set filetype for .env.* files
autocmd BufRead .env.* set filetype=sh

" Set filetype for .*rc files
autocmd BufRead .*rc set filetype=sh

" Clears all matches when leaving the buffer
autocmd BufWinLeave * call clearmatches()

" Disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
