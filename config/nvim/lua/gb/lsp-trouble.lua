local keymap = require("gb.utils").map

keymap("n", "<leader>lt", "LspTroubleToggle", {silent = true, cmd_cr = true})
keymap("n", "<leader>ld", "Trouble lsp_document_diagnostics", {silent = true, cmd_cr = true})
keymap("n", "<leader>ldt", "LspTroubleDocumentToggle", {silent = true, cmd_cr = true})
keymap("n", "<leader>lwt", "LspTroubleWorkspaceToggle", {silent = true, cmd_cr = true})
