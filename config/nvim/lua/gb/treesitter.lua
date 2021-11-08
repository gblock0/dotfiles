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
    "typescript",
    "vim"
  },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = false
  },
  context_commentstring = {enable = true},
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"}
  }
}
