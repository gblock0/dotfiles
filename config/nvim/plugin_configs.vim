if !has('gui_running')
 source ~/.config/nvim/nvim_plugin_configs.vim
endif

""""""""""""""""""""
"  Airline
""""""""""""""""""""
let g:airline_theme = 'bubblegum'
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
	let branch_name_split = split(a:name, '-')
	let branch_split_length = len(branch_name_split)
	if branch_split_length > 0
		return branch_name_split[branch_split_length - 1]
	else
		return a:name
	endif
endfunction

" let g:airline_section_c = '%t %m'
let g:airline#extensions#default#layout = [
		\ [ 'a', 'b', 'c' ],
		\ [ 'x', 'z', 'warning' ]
		\ ]

"""""""""""""""""""""""""""
" Vim-interesting-words
"""""""""""""""""""""""""""
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']

"""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|git-crypt)$|node_modules|dist|node|bower_components|public|coverage'

"""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""
nnoremap ? :BLine<CR>
" Intentional space left after `:Ag` to allow for faster searching
nnoremap <C-F> :Ag 
let g:fzf_layout = { 'down': '~20%' }

"""""""""""""""""""""""""""
" NerdCommenter
"""""""""""""""""""""""""""
nnoremap <D-/> :NERDComToggleComment<CR>
let NERDSpaceDelims=1

"""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""
nnoremap <Bslash>n :NERDTreeToggle<CR>

"Show hidden files in NERDTree (files that start with period)
let NERDTreeShowHidden=1

" Hide files by extension and folder
let NERDTreeIgnore=[ '\.gitignore$', '\.git$[[dir]]', '\.DS_Store$', '\.js.map$', 'node_modules$[[dir]]', 'bower_components$[[dir]]' ]

" Close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

" Remap horizantal split
let NERDTreeMapOpenSplit = "s"

" Remap vertical split
let NERDTreeMapOpenVSplit = "w"

"""""""""""""""""""""""""""
" delimitMate
"""""""""""""""""""""""""""
let delimitMate_expand_cr = 1

"""""""""""""""""""""""""""
" Neomake
"""""""""""""""""""""""""""
if has('autocmd') && !exists('autocommands_loaded')
	autocmd! BufWritePost * if &ft != 'html' | Neomake | endif
endif

let g:neomake_javascript_eslint_maker = {
		\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
		\ }
let g:neomake_jsx_eslint_maker = {
			\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
			\ }
let g:neomake_javascript_enabled_markers = ['eslint']
let g:neomake_jsx_enabled_markers = ['eslint']
let g:neomake_html_enabled_markers = []
let g:neomake_open_list=2
let g:neomake_verbose=0

"""""""""""""""""""""""""""
" vim-tmux-navigator
"""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

"""""""""""""""""""""""""""
" vim-autoformat
"""""""""""""""""""""""""""
let g:formatters_javascript = [ 'jscs' ]

"""""""""""""""""""""""""""
" vim-autoswap
"""""""""""""""""""""""""""
let g:autoswap_detect_tmux = 1

"""""""""""""""""""""""""""
" hybrid_material
"""""""""""""""""""""""""""
let g:enable_bold_font = 1

"""""""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 3
