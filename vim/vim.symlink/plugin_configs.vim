"""""""""""""""""""""""""""
" Ctags
"""""""""""""""""""""""""""
nnoremap <leader>c :TagbarToggle<CR>
let g:tagbar_type_javascript = {
			\ 'ctagsbin' : '/usr/local/share/npm/bin/jsctags'
			\ }

"""""""""""""""""""""""""""
" Ctrl-P
"""""""""""""""""""""""""""
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules,lib-cov,public

let g:ctrlp_working_path_mode = 2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <D-t> :CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

"""""""""""""""""""""""""""
" NerdCommenter
"""""""""""""""""""""""""""
nnoremap <D-/> :NERDComToggleComment<CR>
let NERDSpaceDelims=1

"""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<CR>

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

"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""

let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_html_checkers = []

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
nnoremap <Leader>{ :lprev<CR>
nnoremap <Leader>} :lnext<CR>



""""""""""""""""""""
"  SyntaxComplete
""""""""""""""""""""
" set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""
"  Fugitive
""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

""""""""""""""""""""
"  Ag Silver Searcher
""""""""""""""""""""
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	let g:grep_cmd_opts = '--line-numbers --noheading'

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
	ca Ag Ag!

endif

""""""""""""""""""""
"  Airline
""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled  = 1

" vim-powerline symbols
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.branch     = '⭠'
let g:airline_symbols.readonly   = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline_section_x = ''
let g:airline_section_y = ''

"""""""""""""""""""""""""""
" Neocomplete
"""""""""""""""""""""""""""

" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#auto_completion_start_length = 1
" let g:neocomplete#sources#buffer#cache_limit_size = 50000
" let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecomplete'
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 2
" if !exists('g:neocomplete#force_omni_input_patterns')
	" let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" set completeopt-=preview
" augroup omnicomplete
	" autocmd!
	" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	" autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
	" autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
	" autocmd FileType javascript setlocal omnifunc=tern#Complete
" augroup END

"""""""""""""""""""""""""""
" Gutentags
"""""""""""""""""""""""""""
" let g:gutentags_cache_dir = "~/.vim/cache/tags"

"""""""""""""""""""""""""""
" Quick-Scope
"""""""""""""""""""""""""""
" Function that will only show quick-scope when hitting f/F/t/T
function! Quick_scope_selective(movement)
	let needs_disabling = 0
	if !g:qs_enable
		QuickScopeToggle
		redraw
		let needs_disabling = 1
	endif

	let letter = nr2char(getchar())

	if needs_disabling
		QuickScopeToggle
	endif

	return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

"""""""""""""""""""""""""""
" Auto-Pairs
"""""""""""""""""""""""""""
let g:AutoPairsShortcutFastWrap = '<M-e>'
