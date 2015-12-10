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

let g:airline_section_c = '%t %m'
let g:airline#extensions#default#layout = [
		\ [ 'a', 'b', 'c' ],
		\ [ 'x', 'z', 'warning' ]
		\ ]

" vim-powerline symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

"""""""""""""""""""""""""""
" Ctags
"""""""""""""""""""""""""""
nnoremap <leader>c :TagbarToggle<CR>
let g:tagbar_type_javascript = {
			\ 'ctagsbin' : '/usr/local/share/npm/bin/jsctags'
			\ }

"""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""
nnoremap <C-p> :GitFiles<CR>
let g:fzf_layout = { 'down': '~15%' }

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
let NERDTreeIgnore=['^components/', '\.DS_Store$', '\.js.map$']

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
" Javascript plugins
"""""""""""""""""""""""""""
let g:used_javascript_libs = 'angularjs,jquery,jasmine'

""""""""""""""""""""
"  Fugitive
""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

"""""""""""""""""""""""""""
" delimitMate
"""""""""""""""""""""""""""
let delimitMate_expand_cr = 1

"""""""""""""""""""""""""""
" Neomake
"""""""""""""""""""""""""""
if has('autocmd') && !exists('autocommands_loaded')
	autocmd! BufWritePost * Neomake
endif
let g:neomake_javascript_jshint_maker = {
			\ 'args': ['--verbose'],
			\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
			\ }
let g:neomake_javascript_enabled_markers = ['jshint', 'jscs']
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
" deoplete
"""""""""""""""""""""""""""
" let g:deoplete#enable_at_startup = 1

" inoremap <silent><expr><Tab>
		" \ pumvisible() ? "\<C-n>" :
		" \ deoplete#mappings#manual_complete()

"""""""""""""""""""""""""""
" vim-autoswap
"""""""""""""""""""""""""""
" tmux autoswap support
let g:autoswap_detect_tmux = 1

"""""""""""""""""""""""""""
" hybrid_material
"""""""""""""""""""""""""""
let g:enable_bold_font = 1

"""""""""""""""""""""""""""
" test.vim
"""""""""""""""""""""""""""
let test#strategy = 'neovim'
nmap <leader>t :TestNearest<CR>
let test#javascript#runner = 'mocha'
let test#javascript#mocha#executable = 'NODE_ENV=test mocha test/sails.test.js'
