local keymap = require("nutils").map

keymap("", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", {silent = true})
keymap("", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", {silent = true})
keymap("", "*", "*<Cmd>lua require('hlslens').start()<CR>")
keymap("", "#", "#<Cmd>lua require('hlslens').start()<CR>")
keymap("", "g*", "g*<Cmd>lua require('hlslens').start()<CR>")
keymap("", "g#", "g#<Cmd>lua require('hlslens').start()<CR>")
