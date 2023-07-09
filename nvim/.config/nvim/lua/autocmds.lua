-- Jump to last position in file when a the file is opened
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = "*",
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) > 0 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- Text File Settings
vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = "*.txt",
  command = "set spell spelllang=en_us"
})

vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = "Dockerfile_base",
  command = "set filetype=dockerfile"
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = ".env.*",
  command = "set filetype=sh"
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = ".*rc",
  command = "set filetype=sh"
})

-- Set inlay hints
vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = "*.rs",
  command = "lua require('rust-tools').inlay_hints.set()"
})

-- Clears all matches when leaving the buffer
vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = "*",
  command = "call clearmatches()"
})

-- Disable auto-commenting
vim.api.nvim_create_autocmd('FileType', {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})
