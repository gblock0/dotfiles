
local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')
local hl_list = {
    Black = { 'white', 'black' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

basic.divider = { b_components.divider, '' }
basic.bg = { ' ', 'StatusLine' }

local colors_mode = {
    Normal = { 'green', 'black' },
    Insert = { 'blue', 'black' },
    Visual = { 'magenta', 'black' },
    Replace = { 'violet', 'black' },
    Command = { 'green', 'black' },
}

basic.square_mode = {
    hl_colors = colors_mode,
    text = function()
        return { { '▊', state.mode[2] } }
    end,
}
basic.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = {
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
        blue = { 'blue', 'black' },
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_error({ format = '  %s', show_zero = true }), 'red' },
                { lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'yellow' },
                { lsp_comps.lsp_hint({ format = '  %s', show_zero = true }), 'blue' },
            }
        end
        return ''
    end,
}
basic.file = {
    name = 'file',
    text = function(_, _, width)
    return {
      { helper.separators.slant_left_2, { 'blue', 'black' } },
      { ' ', {'white', 'blue'} },
      { b_components.cache_file_name('[No Name]', 'unique'),  {'white', 'blue', 'bold'} },
      { b_components.file_modified('● '), {'white', 'blue'} },
      { helper.separators.slant_right_2, { 'blue' , 'black'} },
      { ' ', '' },
    }
    end,
}
basic.file_right = {
    hl_colors = {
    },
    text = function(_, _, width)
      return {
            { b_components.file_encoding(), {'violet', 'black', 'bold'}},
      { ' ', '' },
      { b_components.progress_lua, {'white', 'black'} },
      { ' ', '' },
      {vim.api.nvim_eval("printf('%03d/%03d', line('.'),  line('$'))"), {'white', 'black'}}
    }
    end,
}
basic.git = {
    name = 'git',
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
    },
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { git_comps.diff_added({ format = '  %s', show_zero = true }), 'green' },
                { git_comps.diff_removed({ format = '  %s', show_zero = true }), 'red' },
                { git_comps.diff_changed({ format = ' 柳%s', show_zero = true }), 'blue' },
            }
        end
        return ''
    end,
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { '🚦 Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'black_light' },
        },
        { ' Total : %L ', { 'cyan', 'black_light' } },
        { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ', { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { helper.separators.slant_right, { 'InactiveBg', 'black' } },
        { '🧛 ', { 'white', 'black' } },
    },

    always_active = true,
    show_last_status = true,
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { '  ', { 'black', 'red' } },
        { helper.separators.slant_right, { 'red', 'NormalBg' } },
        { b_components.divider, '' },
        { b_components.file_name(''), { 'white', 'NormalBg' } },
    },
    always_active = true,
    show_last_status = true,
}

basic.lsp_name = {
    name = 'lsp_name',
    hl_colors = {
        magenta = { 'magenta', 'black' },
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_name(), 'magenta' },
            }
        end
    end,
}

local default = {
    filetypes = { 'default' },
    active = {
        basic.square_mode,
        { git_comps.git_branch(), { 'violet', 'black' }},
        { ' ', hl_list.Black },
        basic.file,
        { ' ', hl_list.Black },
        basic.lsp_name,
        { ' ', hl_list.Black },
        basic.lsp_diagnos,
        basic.divider,
        basic.git,
        { ' ', hl_list.Black },
        basic.file_right,
        { ' ', hl_list.Black },
        basic.square_mode,
    },
    inactive = {
        { b_components.full_file_name, hl_list.Inactive },
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        { b_components.line_col, hl_list.Inactive },
        { b_components.progress, hl_list.Inactive },
    },
}

windline.setup({
    colors_name = function(colors)
        -- print(vim.inspect(colors))
        -- ADD MORE COLOR HERE ----
    colors.blue = "#0070D7"
    colors.white = "#e6e6e6"
    colors.violet = "#a9a1e1"

        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
require('wlfloatline').setup()

-- Shows the current function in the file
-- require("nvim-gps").setup()
--
-- local colors = {
--   bg = "#202328",
--   fg = "#bbc2cf",
--   yellow = "#fabd2f",
--   cyan = "#008080",
--   darkblue = "#081633",
--   green = "#98be65",
--   orange = "#FF8800",
--   violet = "#a9a1e1",
--   magenta = "#c678dd",
--   blue = "#51afef",
--   red = "#ec5f67",
--   white = "#e6e6e6"
-- }

-- local vi_mode_colors = {
--   NORMAL = colors.green,
--   INSERT = colors.blue,
--   VISUAL = colors.magenta,
--   OP = colors.green,
--   BLOCK = colors.red,
--   REPLACE = colors.violet,
--   ["V-REPLACE"] = colors.violet,
--   ENTER = colors.cyan,
--   MORE = colors.cyan,
--   SELECT = colors.orange,
--   COMMAND = colors.green,
--   SHELL = colors.green,
--   TERM = colors.green,
--   NONE = colors.yellow
-- }

-- local lsp = require "feline.providers.lsp"
-- local vi_mode_utils = require "feline.providers.vi_mode"

-- local comps = {
--   vi_mode = {
--     left = {
--       provider = "▊",
--       hl = function()
--         local val = {
--           name = vi_mode_utils.get_mode_highlight_name(),
--           fg = vi_mode_utils.get_mode_color()
--         }
--         return val
--       end,
--       right_sep = " "
--     },
--     right = {
--       provider = "▊",
--       hl = function()
--         local val = {
--           name = vi_mode_utils.get_mode_highlight_name(),
--           fg = vi_mode_utils.get_mode_color()
--         }
--         return val
--       end,
--       left_sep = " "
--     }
--   },
--   line_number = {
--     provider = function()
--       return vim.api.nvim_eval("printf('%03d/%03d', line('.'),  line('$'))")
--     end,
--     left_sep = {
--       " ",
--       "left_rounded_thin",
--       hl = {bg = colors.white, fg = colors.white}
--     },
--     right_sep = {
--       "right_rounded_thin",
--       " ",
--       {
--         hl = {fg = colors.white}
--       }
--     }
--   },
--   file = {
--     info = {
--       provider = "file_info",
--       hl = {
--         fg = colors.white,
--         bg = "oceanblue",
--         style = "bold"
--       },
--       icon = "",
--       file_modified_icon = "",
--       left_sep = {
--         " ",
--         "slant_left_2",
--         {hl = {bg = "oceanblue", fg = "NONE"}}
--       },
--       right_sep = {"slant_right_2", " "}
--     },
--     encoding = {
--       provider = "file_encoding",
--       left_sep = " ",
--       hl = {
--         fg = colors.violet,
--         style = "bold"
--       }
--     },
--     type = {
--       provider = "file_type"
--     }
--   },
--   line_percentage = {
--     provider = "line_percentage",
--     left_sep = " "
--   },
--   scroll_bar = {
--     provider = "scroll_bar",
--     left_sep = " ",
--     hl = {
--       fg = colors.blue,
--       style = "bold"
--     }
--   },
--   diagnos = {
--     err = {
--       provider = "diagnostic_errors",
--       enabled = function()
--         return lsp.diagnostics_exist("Error")
--       end,
--       hl = {
--         fg = colors.red
--       }
--     },
--     warn = {
--       provider = "diagnostic_warnings",
--       enabled = function()
--         return lsp.diagnostics_exist("Warning")
--       end,
--       hl = {
--         fg = colors.yellow
--       }
--     },
--     hint = {
--       provider = "diagnostic_hints",
--       enabled = function()
--         return lsp.diagnostics_exist("Hint")
--       end,
--       hl = {
--         fg = colors.cyan
--       }
--     },
--     info = {
--       provider = "diagnostic_info",
--       enabled = function()
--         return lsp.diagnostics_exist("Information")
--       end,
--       hl = {
--         fg = colors.blue
--       }
--     }
--   },
--   lsp = {
--     name = {
--       provider = "lsp_client_names",
--       left_sep = " ",
--       icon = " ",
--       hl = {
--         fg = colors.yellow,
--         style = "bold"
--       }
--     }
--   },
--   git = {
--     branch = {
--       provider = "git_branch",
--       icon = " ",
--       left_sep = " ",
--       hl = {
--         fg = colors.violet,
--         style = "bold"
--       },
--       right_sep = " "
--     }
--   }
--   -- nvim_gps = {
--   --   left_sep = " ",
--   --   provider = function()
--   --     return require("nvim-gps").get_location()
--   --   end,
--   --   enabled = function()
--   --     return require("nvim-gps").is_available()
--   --   end
--   -- }
-- }

-- local components = {
--   active = {},
--   inactive = {}
-- }

-- table.insert(components.active, {})
-- table.insert(components.active, {})

-- table.insert(components.inactive, {})

-- components.active[1] = {
--   comps.vi_mode.left,
--   comps.git.branch,
--   comps.file.info,
--   comps.lsp.name,
--   comps.diagnos.err,
--   comps.diagnos.warn,
--   comps.diagnos.hint,
--   comps.diagnos.info,
--   comps.nvim_gps
-- }

-- components.active[2] = {
--   comps.file.encoding,
--   comps.line_percentage,
--   comps.line_number,
--   comps.scroll_bar,
--   comps.vi_mode.right
-- }

-- components.inactive[1] = {comps.file.info}

-- -- Built in separators {{{
-- -- vertical_bar	'┃'
-- -- vertical_bar_thin	'│'
-- -- left	''
-- -- right	''
-- -- block	'█'
-- -- left_filled	''
-- -- right_filled	''
-- -- slant_left	''
-- -- slant_left_thin	''
-- -- slant_right	''
-- -- slant_right_thin	''
-- -- slant_left_2	''
-- -- slant_left_2_thin	''
-- -- slant_right_2	''
-- -- slant_right_2_thin	''
-- -- left_rounded	''
-- -- left_rounded_thin	''
-- -- right_rounded	''
-- -- right_rounded_thin	''
-- -- circle	'●'
-- -- }}}
-- -- modified ''

-- require "feline".setup {
--   bg = colors.bg,
--   fg = colors.fg,
--   components = components,
--   force_inactive = {
--     filetypes = {
--       "NvimTree",
--       "dbui",
--       "vim-plug",
--       "startify",
--       "fugitive",
--       "fugitiveblame"
--     },
--     buftypes = {"terminal"},
--     bufnames = {}
--   },
--   vi_mode_colors = vi_mode_colors
-- }
