let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect

nnoremap <leader>ld :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <F3> :lua vim.lsp.buf.references()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>lh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>lca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

lua require'lsp'
