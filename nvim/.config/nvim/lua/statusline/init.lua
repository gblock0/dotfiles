local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui'}

local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67',
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local get_relative_file_path = function ()
    local file = vim.fn.expand('%f')
    if vim.fn.empty(file) == 1 then return '' end
    if vim.bo.modifiable then
      if vim.bo.modified then
        return file .. '   '
      end
    end
    return file .. ' '
end

local get_line_number = function ()
  return vim.api.nvim_eval("printf('%03d/%03d', line('.'),  line('$'))")
end

local get_git_status = function()
  return vim.fn['sy#repo#get_stats']()
end

table.insert(gls.left, {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.bg}
  },
})

table.insert(gls.left, {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.magenta, i = colors.green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = colors.red,no = colors.magenta,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      local mode_map = {
             n= 'NORMAL', i= 'INSERT', R= 'REPLACE', v= 'VISUAL', V= 'V-LINE',
            c= 'COMMAND', s= 'SELECT', S= 'S-LINE', t= 'TERMINAL'}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return ' ' .. mode_map[vim.fn.mode()] .. ' '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
})

table.insert(gls.left, {
  DiffAdd = {
    provider = function()
      local diffAdd = get_git_status()[1]
      if diffAdd < 0 then
        return 0
      end
      return diffAdd
    end,
    icon = '  ',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg},
  }
})

table.insert(gls.left, {
  DiffModified = {
    provider = function()
      local diffMod = get_git_status()[2]
      if diffMod < 0 then
        return 0
      end
      return diffMod
    end,
    icon = '柳',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.orange,colors.bg},
  }
})

table.insert(gls.left, {
  DiffRemove = {
    provider = function()
      local diffRem = get_git_status()[3]
      if diffRem < 0 then
        return 0
      end
      return diffRem
    end,
    icon = ' ',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.red,colors.bg},
  }
})

table.insert(gls.left, {
  GitBranch = {
    provider = 'GitBranch',
    separator_highlight = {'NONE',colors.bg},
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.white,colors.bg},
  }
})

table.insert(gls.left, {
  FilePath = {
    provider = get_relative_file_path,
    icon = '| ',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.white,colors.bg}
  }
})

table.insert(gls.left, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
})

table.insert(gls.left, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
})

table.insert(gls.left, {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
})

table.insert(gls.left, {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
})

table.insert(gls.right, {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.cyan,colors.bg,'bold'}
  }
})

table.insert(gls.right, {
  FileType = {
    provider = 'FileTypeName',
    icon = '| ',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.cyan,colors.bg,'bold'}
  }
})

table.insert(gls.right, {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
})

table.insert(gls.right, {
  LineInfo = {
    provider = get_line_number,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
})

table.insert(gls.right, {
  RainbowBlue = {
    provider = function() return '  ▊' end,
    highlight = {colors.blue,colors.bg}
  },
})

table.insert(gls.short_line_left, {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {colors.white,colors.bg,'bold'}
  }
})

table.insert(gls.short_line_right, {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
})
