local lsp_status = require("lsp-status")
local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = {"NvimTree", "vista", "dbui"}

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
  red = "#ec5f67"
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local show_in_small_window = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if vim.fn.winwidth(0) < 130 then
    return false
  end
  return true
end

local get_relative_file_path = function()
  local file = vim.fn.expand("%f")
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. "   "
    end
  end
  return file .. " "
end

local get_line_number = function()
  return vim.api.nvim_eval("printf('%03d/%03d', line('.'),  line('$'))")
end

table.insert(
  gls.left,
  {
    GitBranch = {
      provider = "GitBranch",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      condition = function()
        return show_in_small_window() and require("galaxyline.condition").check_git_workspace()
      end,
      highlight = {colors.white, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    FilePath = {
      provider = get_relative_file_path,
      icon = "| ",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      condition = buffer_not_empty,
      highlight = {colors.white, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = {colors.red, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors.yellow, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      icon = "  ",
      highlight = {colors.cyan, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    DiagnosticInfo = {
      provider = "DiagnosticInfo",
      icon = "  ",
      highlight = {colors.blue, colors.bg}
    }
  }
)

table.insert(
  gls.right,
  {
    FileEncode = {
      provider = "FileEncode",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.cyan, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.right,
  {
    PerCent = {
      provider = "LinePercent",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.fg, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.right,
  {
    LineInfo = {
      provider = get_line_number,
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.fg, colors.bg}
    }
  }
)

table.insert(
  gls.right,
  {
    Spacer = {
      provider = function()
        return " "
      end,
      highlight = {"NONE", colors.bg}
    }
  }
)

table.insert(
  gls.short_line_left,
  {
    SFileName = {
      provider = function()
        local fileinfo = require("galaxyline.provider_fileinfo")
        local fname = fileinfo.get_current_file_name()
        for _, v in ipairs(gl.short_line_list) do
          if v == vim.bo.filetype then
            return ""
          end
        end
        return fname
      end,
      condition = buffer_not_empty,
      highlight = {colors.white, colors.bg, "bold"}
    }
  }
)
