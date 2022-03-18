local opt = require("gb.utils").opt

vim.g.mapleader = " "
vim.opt.laststatus = 3

-- Global options
opt("o", "termguicolors", true)
opt("o", "mouse", "a")
opt("o", "shiftround", true) -- round indent to a multiple of 'shiftwidth'
opt("o", "undolevels", 5000)
opt("o", "undodir", vim.fn.expand("~/.VIM_UNDO_FILES"))
opt("o", "undofile", true)
opt("o", "clipboard", "unnamedplus")
opt("o", "scrolloff", 10) -- lines of text around cursor
opt("o", "wildoptions", "pum")
opt("o", "pumblend", 17) -- floating window popup menu for command line completion
opt("o", "ignorecase", true) -- case insensitive searching
opt("o", "smartcase", true) -- case-sensitive if expression contains a capital letter
opt("o", "listchars", "eol:¬,tab:>·,trail:~,space:␣") -- set what whitespace characters look like
opt("o", "updatetime", 100) -- keep buffers around
opt("o", "splitright", true) -- split windows to the right

-- Buffer options
--  Tab control
opt("b", "tabstop", 2) -- the visible width of tabs
opt("b", "softtabstop", 2) -- edit as if the tabs are 2 characters wide
opt("b", "shiftwidth", 2) -- number of spaces to use for indent and unindent
opt("b", "expandtab", true) -- insert tabs rather than spaces for <Tab>

-- Window options
opt("w", "cursorline", true) -- highlight current line
opt("w", "number", true)
opt("w", "relativenumber", true)
opt("w", "foldlevel", 99)
opt("w", "signcolumn", "yes")
opt("w", "wrap", false)

local parsers = require'nvim-treesitter.parsers'
local configs = parsers.get_parser_configs()
local ft_str = table.concat(vim.tbl_map(function(ft) return configs[ft].filetype or ft end, parsers.available_parsers()), ',')
vim.cmd('autocmd Filetype ' .. ft_str .. ' setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldtext=v:lua.foldText()')

