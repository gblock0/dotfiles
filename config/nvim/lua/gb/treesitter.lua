require "nvim-treesitter.configs".setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
  ensure_installed = {
    "toml",
    "lua",
    "tsx",
    "css",
    "javascript",
    "jsonc",
    "yaml",
    "json",
    "regex",
    "bash",
    "python",
    "jsdoc",
    "html",
    "rust",
    "typescript"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
