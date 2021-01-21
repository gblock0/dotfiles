--must have run: npm install -g typescript
require"lspconfig".tsserver.setup{
    on_attach = function(client)
        require"completion".on_attach(client)
        require"illuminate".on_attach(client)
    end
}

--must run: npm install -g pyright
require"lspconfig".pyright.setup{on_attach=require"completion".on_attach}
