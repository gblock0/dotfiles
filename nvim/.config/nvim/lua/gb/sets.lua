vim.g.mapleader = " "
vim.opt.laststatus = 3

-- Global vim.opt.ions
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.shiftround = true -- round indent to a multiple of 'shiftwidth'
vim.opt.undolevels = 5000
vim.opt.undodir = vim.fn.expand("~/.VIM_UNDO_FILES")
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10 -- lines of text around cursor
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 17 -- floating window popup menu for command line completion
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.smartcase = true -- case-sensitive if expression contains a capital letter
vim.opt.listchars = "eol:¬,tab:>·,trail:~,space:␣" -- set what whitespace characters look like
vim.opt.updatetime = 100 -- keep buffers around
vim.opt.splitright = true -- split windows to the right

-- Buffer vim.opt.ions
--  Tab control
vim.opt.tabstop = 2 -- the visible width of tabs
vim.opt.softtabstop = 2 -- edit as if the tabs are 2 characters wide
vim.opt.shiftwidth = 2 -- number of spaces to use for indent and unindent
vim.opt.expandtab = true -- insert tabs rather than spaces for <Tab>

-- Window vim.opt.ions
vim.opt.cursorline = true -- highlight current line
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldlevel = 99
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- Turn on new diff
vim.opt.diffopt:append("linematch:60")

local parsers = require'nvim-treesitter.parsers'
local configs = parsers.get_parser_configs()
local ft_str = table.concat(vim.tbl_map(function(ft) return configs[ft].filetype or ft end, parsers.available_parsers()), ',')
vim.cmd('autocmd Filetype ' .. ft_str .. ' setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldtext=v:lua.foldText()')

