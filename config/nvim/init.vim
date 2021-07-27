"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins from vim-plug,
" plugin configs in ~/.config/nvim/plugin are loaded automatically
"
let g:python_host_skip_check=1

lua require('gb.sets')
lua require('gb.plugins')

let g:oceanic_next_terminal_bold = 1
let g:tokyonight_italic_keywords = v:false
colorscheme OceanicNext

" Moves the visually selected lines up/down one line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

augroup GB_SETTINGS
    autocmd!
    source ~/.config/nvim/filetype_configs.vim
    let autocommands_loaded = 1

    " Highlight trailing whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red

    autocmd BufWinLeave * call clearmatches()

    " Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Enable type inlay hints
    autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
    \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }


    " Python niceties
    autocmd FileType python inoremap - _
    autocmd FileType python inoremap _ -
augroup END

" Remap colon commands to ignore shift
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> w ((getcmdtype() is# ':' && getcmdline() is# 'w')?('w'):('w'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?('qa'):('Qa'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" janko/vim-test and puremourning/vimspector
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction
let g:test#custom_strategies = {'jest': function('JestStrategy')}

autocmd BufEnter,BufWritePost <buffer> :lua require("lsp_extensions.inlay_hints").request {aligned = true, prefix = " » "}

function! OpenURLUnderCursor()
  let s:uri = expand('<cWORD>')
  let s:uri = substitute(s:uri, '?', '\\?', '')
  let s:uri = shellescape(s:uri, 1)
  if s:uri != ''
    silent exec "!open '".s:uri."'"
    :redraw!
  endif
endfunction
nnoremap gx :call OpenURLUnderCursor()<CR>

" Jump to last position in file when a new file is opened
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
