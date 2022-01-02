"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_skip_check=1

lua require("gb.folds")
lua require('gb.sets')
lua require('gb.plugins')

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

augroup GB_SETTINGS
    autocmd!
    source ~/.config/nvim/filetype_configs.vim
    let autocommands_loaded = 1

    " Format the buffer after writing the buffer
    autocmd BufWritePost *.lua :FormatWrite
    autocmd BufWritePost *.ts,*.tsx,*.js :EslintFixAll
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

    " Clears all matches when leaving the buffer
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
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to last position in file when a the file is opened
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
