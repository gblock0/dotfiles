"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins from vim-plug,
" plugin configs in ~/.config/nvim/plugin are loaded automatically

lua require('sets')
source ~/.config/nvim/plugins.vim

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" load plugin configs
lua require('autoswap')
lua require('colorizer-lua')
lua require('fzf')
lua require('lsp')
lua require('maximizer')
lua require('neoformat')
lua require('commenter')
lua require('remaps')
lua require('statusline')
lua require('test')
lua require('tmux-navigator')
lua require('treesitter')
lua require('vimspector')

" {{{ Things that cannot be converted to lua

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)


" Turn off weird red highlight errors in init.vim
hi ERROR NONE


augroup GB_SETTINGS
    autocmd!
    source ~/.config/nvim/filetype_configs.vim
    let autocommands_loaded = 1

    " automatically resize panes on resize
    " autocmd VimResized * exe 'normal! \<c-w>='

    " Highlight trailing whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red

    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    " Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
set nowrap
" Remap colon commands to ignore shift
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> w ((getcmdtype() is# ':' && getcmdline() is# 'w')?('w'):('w'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?('qa'):('Qa'))
"}}}

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
autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
