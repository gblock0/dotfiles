"""""""""""""""""""""""""""
" Fern Settings
"""""""""""""""""""""""""""

noremap <silent> <Bslash>n :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=
let g:fern#disable_default_mappings = 1
let g:fern#renderer = "nerdfont"
function! FernInit() abort
    nmap <buffer><expr>
            \ <Plug>(fern-my-open-expand-collapse)
            \ fern#smart#leaf(
            \   "\<Plug>(fern-action-open:select)",
            \   "\<Plug>(fern-action-expand:stay)",
            \   "\<Plug>(fern-action-collapse)",
            \ )
    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> l <Plug>(fern-action-expand:stay)
    nmap <buffer> h <Plug>(fern-action-collapse)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> n <Plug>(fern-action-new-path)
    nmap <buffer> d <Plug>(fern-action-remove)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> r <Plug>(fern-action-rename)
    nmap <buffer> H <Plug>(fern-action-hidden-toggle)
    nmap <buffer> R <Plug>(fern-action-reload)
    "nmap <buffer> k <Plug>(fern-action-mark-toggle)
    nmap <buffer> s <Plug>(fern-action-open:split)
    nmap <buffer> w <Plug>(fern-action-open:vsplit)
endfunction

augroup FernGroup
    autocmd!
    autocmd FileType fern call FernInit()
augroup END

