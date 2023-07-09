return {
  {
    "David-Kunz/jester",

    opts = {

      path_to_jest_run = 'node_modules/.bin/jest',
      terminal_cmd = ':below split | terminal'
    },
    config = function(_, opts)
      local jester = require('jester')
      jester.setup(opts)
      set_nmap("<leader>tt", function() jester.run() end)
      set_nmap("<leader>tf", function() jester.run_file() end)
      set_nmap("<leader>td", function() jester.debug() end)

      local function go_to_test_file()
        local current_path = vim.fn.expand("%")
        if string.find(current_path, ".ts$") == nil then
          print "Only TS files are supported"
          return
        end
        local is_test_file = string.find(current_path, ".test.ts$") ~= nil
        local test_file_path = string.gsub(current_path, ".ts$", ".test.ts")
        local vsplit_command = ":vsplit "
        if is_test_file then
          test_file_path = string.gsub(current_path, ".test.ts$", ".ts")
          vsplit_command = ":lefta " .. vsplit_command
        end

        return vim.api.nvim_command(vsplit_command .. test_file_path)
      end

      set_nmap("<leader>tw", go_to_test_file, "Open TS/JS Test File")
    end
  },

  {
    "andythigpen/nvim-coverage",
    opts = {}
  }
}
