"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins from vim-plug,
" plugin configs in ~/.config/nvim/plugin are loaded automatically

source ~/.config/nvim/plugins.vim
lua require('sets')


let g:maximizer_set_default_mapping = 0

" Turn off weird red highlight errors in init.vim
hi ERROR NONE

au BufRead,BufNewFile *.md setlocal textwidth=80

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

augroup GB_SETTINGS
    autocmd!
    source ~/.config/nvim/filetype_configs.vim
    let autocommands_loaded = 1

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='

    " Highlight trailing whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red

    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    " Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


augroup END

" Remap colon commands to ignore shift
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> w ((getcmdtype() is# ':' && getcmdline() is# 'w')?('w'):('w'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?('qa'):('Qa'))

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

inoremap jj <ESC>

" shortcut to save
nmap <leader><leader> :wa<cr>

nnoremap " '
nnoremap ' "

" disable Ex mode
noremap Q <NOP>

" Reselect the text that was just pasted
nnoremap <leader>v V`]

" Create a new vsplit, switch to it and open CtrlP
nnoremap <leader>w <C-w>v<C-w>l :GFiles<cr>

" Create a new split, switch to it and open CtrlP
nnoremap <leader>s <C-w>s<C-w>j :GFiles<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <leader>= <C-W>=

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

" Reload init.vim
nnoremap <leader>re :so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<CR>

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

" Copy current file's path to clipboard
nnoremap cp :let @+ = expand("%")<cr>

nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>f :Neoformat<CR>

" Testing helpers
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>

let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')
let g:vimspector_sidebar_width = 120
let g:vimspector_bottombar_height = 10
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
let g:vimspector_sign_priority = {
      \    'vimspectorBP':         998,
      \    'vimspectorBPCond':     997,
      \    'vimspectorBPDisabled': 996,
      \    'vimspectorPC':         999,
      \ }

" janko/vim-test and puremourning/vimspector
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction
let g:test#custom_strategies = {'jest': function('JestStrategy')}

" Disable help F1 key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
xnoremap <F1> <ESC>

