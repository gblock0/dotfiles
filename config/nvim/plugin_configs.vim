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
" NerdTree
"""""""""""""""""""""""""""
nnoremap <Bslash>n :NERDTreeToggle<CR>

"Show hidden files in NERDTree (files that start with period)
let NERDTreeShowHidden=1

let g:NERDTreeGitStatusWithFlags=1

" Hide files by extension and folder
let NERDTreeIgnore=['config\configstore', '\.gitignore$', '\.git$[[dir]]', '\.DS_Store$', '\.js.map$', 'node_modules$[[dir]]', 'bower_components$[[dir]]' ]

" Close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0

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
let g:coc_global_extensions = [
            \ 'coc-bookmark',
            \ 'coc-css',
            \ 'coc-eslint',
            \ 'coc-floaterm',
            \ 'coc-git',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-markdownlint',
            \ 'coc-omnisharp',
            \ 'coc-pairs',
            \ 'coc-powershell',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-svg',
            \ 'coc-tsserver',
            \ ]

nmap <F2> <Plug>(coc-rename)
nmap <F3> <Plug>(coc-definition)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" **** THE FOLLOWING IS FROM THE COC.NVIM README ****
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
