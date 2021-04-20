local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
  white = "#e6e6e6"
}

local vi_mode_colors = {
  NORMAL = colors.green,
  INSERT = colors.blue,
  VISUAL = colors.magenta,
  OP = colors.green,
  BLOCK = colors.red,
  REPLACE = colors.violet,
  ["V-REPLACE"] = colors.violet,
  ENTER = colors.cyan,
  MORE = colors.cyan,
  SELECT = colors.orange,
  COMMAND = colors.green,
  SHELL = colors.green,
  TERM = colors.green,
  NONE = colors.yellow
}

local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"

local comps = {
  vi_mode = {
    left = {
      provider = "▊",
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color()
        }
        return val
      end,
      right_sep = " "
    },
    right = {
      provider = "▊",
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color()
        }
        return val
      end,
      left_sep = " "
    }
  },
  line_number = {
    provider = function()
      return vim.api.nvim_eval("printf('%03d/%03d', line('.'),  line('$'))")
    end,
    left_sep = {
      " ",
      "left_rounded_thin",
      hl = {bg = colors.white, fg = colors.white}
    },
    right_sep = {
      "right_rounded_thin",
      " ",
      {
        hl = {fg = colors.white}
      }
    }
  },
  file = {
    info = {
      provider = "file_info",
      hl = {
        fg = colors.white,
        bg = "oceanblue",
        style = "bold"
      },
      icon = "",
      file_modified_icon = "",
      left_sep = {
        " ",
        "slant_left_2",
        {hl = {bg = "oceanblue", fg = "NONE"}}
      },
      right_sep = {"slant_right_2", " "}
    },
    encoding = {
      provider = "file_encoding",
      left_sep = " ",
      hl = {
        fg = colors.violet,
        style = "bold"
      }
    },
    type = {
      provider = "file_type"
    }
  },
  line_percentage = {
    provider = "line_percentage",
    left_sep = " "
  },
  scroll_bar = {
    provider = "scroll_bar",
    left_sep = " ",
    hl = {
      fg = colors.blue,
      style = "bold"
    }
  },
  diagnos = {
    err = {
      provider = "diagnostic_errors",
      enabled = function()
        return lsp.diagnostics_exist("Error")
      end,
      hl = {
        fg = colors.red
      }
    },
    warn = {
      provider = "diagnostic_warnings",
      enabled = function()
        return lsp.diagnostics_exist("Warning")
      end,
      hl = {
        fg = colors.yellow
      }
    },
    hint = {
      provider = "diagnostic_hints",
      enabled = function()
        return lsp.diagnostics_exist("Hint")
      end,
      hl = {
        fg = colors.cyan
      }
    },
    info = {
      provider = "diagnostic_info",
      enabled = function()
        return lsp.diagnostics_exist("Information")
      end,
      hl = {
        fg = colors.blue
      }
    }
  },
  lsp = {
    name = {
      provider = "lsp_client_names",
      left_sep = " ",
      icon = " ",
      hl = {
        fg = colors.yellow,
        style = "bold"
      }
    }
  },
  git = {
    branch = {
      provider = "git_branch",
      icon = " ",
      left_sep = " ",
      hl = {
        fg = colors.violet,
        style = "bold"
      },
      right_sep = " "
    }
  }
}

local properties = {
  force_inactive = {
    filetypes = {
      "NvimTree",
      "dbui",
      "vim-plug",
      "startify",
      "fugitive",
      "fugitiveblame"
    },
    buftypes = {"terminal"},
    bufnames = {}
  }
}

local components = {
  left = {
    active = {
      comps.vi_mode.left,
      comps.git.branch,
      comps.file.info,
      comps.lsp.name,
      comps.diagnos.err,
      comps.diagnos.warn,
      comps.diagnos.hint,
      comps.diagnos.info
    },
    inactive = {
      comps.vi_mode.left,
      comps.file.info
    }
  },
  mid = {
    active = {},
    inactive = {}
  },
  right = {
    active = {
      comps.file.encoding,
      comps.line_percentage,
      comps.line_number,
      comps.scroll_bar,
      comps.vi_mode.right
    },
    inactive = {}
  }
}

-- Built in separators {{{
-- vertical_bar	'┃'
-- vertical_bar_thin	'│'
-- left	''
-- right	''
-- block	'█'
-- left_filled	''
-- right_filled	''
-- slant_left	''
-- slant_left_thin	''
-- slant_right	''
-- slant_right_thin	''
-- slant_left_2	''
-- slant_left_2_thin	''
-- slant_right_2	''
-- slant_right_2_thin	''
-- left_rounded	''
-- left_rounded_thin	''
-- right_rounded	''
-- right_rounded_thin	''
-- circle	'●'
-- }}}
-- modified ''

require "feline".setup {
  default_bg = colors.bg,
  default_fg = colors.fg,
  components = components,
  properties = properties,
  vi_mode_colors = vi_mode_colors
}
