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
vim.opt.rtp:prepend(lazypath)
require("folds")
require('sets')
require('remaps')
require('utils')
require('autocmds')
require('lazy').setup('plugins', {
  change_detection = {
    enabled = false,
  },
})
