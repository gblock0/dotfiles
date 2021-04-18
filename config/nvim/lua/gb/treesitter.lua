require "nvim-treesitter.configs".setup {
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
  highlight = {enable = true}
}
