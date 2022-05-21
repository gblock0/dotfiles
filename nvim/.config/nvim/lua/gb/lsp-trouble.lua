vim.keymap.set("n", "<leader>lt", "<cmd>LspTroubleToggle<cr>", {silent = true})
vim.keymap.set("n", "<leader>ld", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true})
vim.keymap.set("n", "<leader>ldt", "<cmd>LspTroubleDocumentToggle<cr>", {silent = true})
vim.keymap.set("n", "<leader>lwt", "<cmd>LspTroubleWorkspaceToggle<cr>", {silent = true})
