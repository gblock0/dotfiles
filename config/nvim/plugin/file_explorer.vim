"""""""""""""""""""""""""""
" nvim-tree Settings
"""""""""""""""""""""""""""

let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.DS_Store' ] "empty by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_group_empty = 1

noremap <silent> <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["w"]          = tree_cb("vsplit"),
      ["s"]          = tree_cb("split"),
    }
EOF
