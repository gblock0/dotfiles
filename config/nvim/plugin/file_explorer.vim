"""""""""""""""""""""""""""
" nvim-tree Settings
"""""""""""""""""""""""""""

let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window

noremap <silent> <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
