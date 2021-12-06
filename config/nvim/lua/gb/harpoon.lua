local keymap = require("gb.utils").map
require("harpoon").setup()

keymap("n", "<leader>h", "lua require('harpoon.mark').add_file()", {silent = true, cmd_cr = true})
keymap("n", "<C-t>", "lua require('harpoon.ui').toggle_quick_menu()", {silent = true, cmd_cr = true})
keymap("n", "<leader>tc", "lua require('harpoon.cmd-ui').toggle_quick_menu()", {silent = true, cmd_cr = true})

keymap("n", "<C-f>", "lua require('harpoon.ui').nav_file(1)", {silent = true, cmd_cr = true})
keymap("n", "<C-d>", "lua require('harpoon.ui').nav_file(2)", {silent = true, cmd_cr = true})
keymap("n", "<C-s>", "lua require('harpoon.ui').nav_file(3)", {silent = true, cmd_cr = true})
keymap("n", "<C-a>", "lua require('harpoon.ui').nav_file(4)", {silent = true, cmd_cr = true})

-- nnoremap <silent><leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
-- nnoremap <silent><leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
-- nnoremap <silent><leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
-- nnoremap <silent><leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
