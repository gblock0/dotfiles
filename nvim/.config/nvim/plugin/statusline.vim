let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste'],
            \              [ 'gitdiff', 'gitbranch', 'filename','cocstatus', 'currentfunction' ] ],
            \ 'right':
            \   [ ['lineinfo'], ['percent'], ['fileencoding', 'filetype']  ]
            \ },
            \ 'component' : {
            \   'lineinfo' : "%{printf('%03d/%03d', line('.'),  line('$'))}"
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead',
            \ },
            \ 'component_expand': {
            \   'gitdiff': 'lightline#gitdiff#get',
            \ },
            \ 'component_type': {
            \   'gitdiff': 'middle',
            \ },
            \ }

let g:lightline#gitdiff#indicator_added = '+'
let g:lightline#gitdiff#indicator_deleted = '-'
let g:lightline#gitdiff#indicator_modified = '~'
let g:lightline#gitdiff#separator = ' '
let g:lightline#gitdiff#show_empty_indicators = 1
