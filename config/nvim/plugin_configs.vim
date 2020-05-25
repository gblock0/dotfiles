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
" FZF
"""""""""""""""""""""""""""
nnoremap ? :BLine<CR>
" Intentional space left after `:Ag` to allow for faster searching
nnoremap <leader>a :Ag!<Space>
nnoremap <C-p> :Files<Cr>
let g:fzf_layout = { 'down': '~20%' }

"""""""""""""""""""""""""""
" NerdCommenter
"""""""""""""""""""""""""""
nnoremap <D-/> :NERDComToggleComment<CR>
let NERDSpaceDelims=1

"""""""""""""""""""""""""""
" vim-tmux-navigator
"""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

"""""""""""""""""""""""""""
" vim-autoswap
"""""""""""""""""""""""""""
let g:autoswap_detect_tmux = 1

"""""""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 3

"""""""""""""""""""""""""""
" coc.nvim
"""""""""""""""""""""""""""
source ~/.config/nvim/coc/coc_config.vim
