vim.g.mapleader = ' '

local opt = vim.api.nvim_set_option

opt('termguicolors', true)

opt('mouse', 'a')

-- Tab control
opt('tabstop', 2) -- the visible width of tabs
opt('softtabstop', 2) -- edit as if the tabs are 4 characters wide
opt('shiftwidth', 2) -- number of spaces to use for indent and unindent
opt('expandtab', true) -- insert tabs rather than spaces for <Tab>
opt('shiftround', true) -- round indent to a multiple of 'shiftwidth'

opt('undolevels', 5000)
opt('undodir', vim.fn.expand('~/.VIM_UNDO_FILES'))
opt('undofile', true)

opt('clipboard', 'unnamedplus')

opt('scrolloff', 10) -- lines of text around cursor

opt('wildoptions', 'pum')

opt('pumblend', 17) -- floating window popup menu for command line completion

opt('ignorecase', true) -- case insensitive searching
opt('smartcase', true) -- case-sensitive if expression contains a capital letter

vim.wo.number = true
vim.wo.relativenumber = true

opt('cursorline', true) -- highlight current line

opt('updatetime', 100) -- update the swap file quicker (also helps with updating git status)
