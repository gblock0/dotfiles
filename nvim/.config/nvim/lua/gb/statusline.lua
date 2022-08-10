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
      provider = {
        name = "file_info",
        opts ={
          file_modified_icon = "",
          type = 'unique'
        }
      },
      hl = {
        fg = colors.white,
        bg = "oceanblue",
        style = "bold"
      },
      icon = "",
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
        return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
      end,
      hl = {
        fg = colors.red
      }
    },
    warn = {
      provider = "diagnostic_warnings",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
      end,
      hl = {
        fg = colors.yellow
      }
    },
    hint = {
      provider = "diagnostic_hints",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
      end,
      hl = {
        fg = colors.cyan
      }
    },
    info = {
      provider = "diagnostic_info",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
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
  },
  package_info = {
    provider = function()
      return require("package-info").get_status()
    end,
    hl = {
      style = "bold"
    },
    left_sep = "  ",
    right_sep = " "
  }
}

local components = {
  active = {},
  inactive = {}
}


-- Insert three sections (left, mid and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert one section for the inactive statusline
table.insert(components.inactive, {})

components.active[1] = {
  comps.vi_mode.left,
  comps.git.branch,
  comps.lsp.name,
  comps.diagnos.err,
  comps.diagnos.warn,
  comps.diagnos.hint,
  comps.diagnos.info,
}
components.active[2] = {
  -- comps.file.info,
}

components.active[3] = {
  comps.package_info,
  -- comps.file.encoding,
  comps.line_percentage,
  comps.line_number,
  -- comps.scroll_bar,
  comps.vi_mode.right
}

components.inactive[1] = {comps.file.info}

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
  bg = colors.bg,
  fg = colors.fg,
  components = components,
  vi_mode_colors = vi_mode_colors
}

local components_wb = {
  active = {},
  inactive = {}
}
table.insert(components_wb.active, {})
table.insert(components_wb.inactive, {})
components_wb.active[1] = {
  comps.file.info,
}
components_wb.inactive[1] = {
  comps.file.info,
}
require('feline').winbar.setup( {components = components_wb})
