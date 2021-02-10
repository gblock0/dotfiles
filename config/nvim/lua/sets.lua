local utils = require'nutils'
opt = utils.opt

vim.g.mapleader = ' '

-- Tab control
opt('b', 'tabstop', 2) -- the visible width of tabs
opt('b', 'softtabstop', 2) -- edit as if the tabs are 4 characters wide
opt('b', 'shiftwidth', 2) -- number of spaces to use for indent and unindent
opt('b', 'expandtab', true) -- insert tabs rather than spaces for <Tab>

opt('o', 'termguicolors', true)
opt('o', 'mouse', 'a')
opt('o', 'shiftround', true) -- round indent to a multiple of 'shiftwidth'
opt('o', 'undolevels', 5000)
opt('o', 'undodir', vim.fn.expand('~/.VIM_UNDO_FILES'))
opt('o', 'undofile', true)
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'scrolloff', 10) -- lines of text around cursor
opt('o', 'wildoptions', 'pum')
opt('o', 'pumblend', 17) -- floating window popup menu for command line completion
opt('o', 'ignorecase', true) -- case insensitive searching
opt('o', 'smartcase', true) -- case-sensitive if expression contains a capital letter
opt('o', 'updatetime', 100) -- update the swap file quicker (also helps with updating git status)

opt('w', 'cursorline', true) -- highlight current line
opt('w', 'number', true);
opt('w', 'relativenumber', true)
opt('w', 'foldmethod', 'syntax')
opt('w', 'foldlevel', 99)

