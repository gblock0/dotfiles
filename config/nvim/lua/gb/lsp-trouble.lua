local keymap = require("gb.utils").map

keymap("n", "<leader>lt", "LspTroubleToggle", {silent = true})
keymap("n", "<leader>ldt", "LspTroubleDocumentToggle", {silent = true})
keymap("n", "<leader>lwt", "LspTroubleWorkspaceToggle", {silent = true})
