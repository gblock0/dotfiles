function _G.set_nmap(keys, func, desc, bufnr)
  vim.keymap.set("n", keys, func, { desc = desc, buffer = bufnr })
end
