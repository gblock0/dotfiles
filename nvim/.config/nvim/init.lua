-- Bootstrap lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
require('gb.plugins')
require("gb.folds")
require('gb.sets')

-- load plugin configs
require("gb.icons")
require("gb.autoswap")
require("gb.colorizer")
require("gb.commenter")
require("gb.debugger")
require("gb.file-explorer")
require("gb.finder")
require("gb.format")
require("gb.git")
require("gb.harpoon")
require("gb.hlslens")
require("gb.lsp")
require("gb.lsp-trouble")
require("gb.maximizer")
require("gb.remaps")
require("gb.statusline")
require("gb.term")
require("gb.test")
require("gb.tmux-navigator")
require("gb.treesitter")
require("gb.centerpad")
require("gb.autocmds")
