return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false
      },
      ensure_installed = {
        "bash",
        "css",
        "hcl",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "regex",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml"
      },
      highlight = {
        enable = true,
        use_languagetree = true
      },
      indent = {
        enable = false
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" }
      },
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = true,
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          -- This shows stuff like literal strings, commas, etc.
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?"
        }
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  "nvim-treesitter/playground",
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
      throttle = true, -- Throttles plugin updates (may improve performance)
      max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
      show_all_context = false,
      patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
          "function",
          "method",
          "for",
          "while",
          "if",
          "switch",
          "case",
        },

        rust = {
          "loop_expression",
          "impl_item",
        },

        typescript = {
          "class_declaration",
          "abstract_class_declaration",
          "else_clause",
        },
      },
    }
  }
}
