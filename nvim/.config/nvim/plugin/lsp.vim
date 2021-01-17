if has('nvim')
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
    set completeopt=menuone,noinsert,noselect

    lua require'lsp'
endif
