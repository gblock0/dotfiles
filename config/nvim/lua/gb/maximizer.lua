local keymap = require("gb-utils").map
vim.g.maximizer_set_default_mapping = 0
keymap("n", "<leader>m", ":MaximizerToggle!<CR>")
