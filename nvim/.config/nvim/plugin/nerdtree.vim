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
