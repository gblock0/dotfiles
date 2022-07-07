vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

require("packer").startup(
function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
      "rmehri01/onenord.nvim",
      config = function()
          require("onenord").setup({
            fade_nc = true
          })
      end
    }

    use "lukas-reineke/indent-blankline.nvim"

    -- Statusline
    use { "feline-nvim/feline.nvim" }
    use "windwp/windline.nvim"

    -- File tree
    use {"kyazdani42/nvim-web-devicons", config = function() require "gb.icons" end}
    use "kyazdani42/nvim-tree.lua"

    -- Highlight hex colors
    use "norcalli/nvim-colorizer.lua"

    -- Autoformater
    use "lukas-reineke/lsp-format.nvim"
    use "averms/black-nvim"

    -- Highlight other uses of the current word under the cursor
    use "RRethy/vim-illuminate"

    -- Lua scratchpad
    use "rafcamlet/nvim-luapad"

    -- Toggle floating terminal inside nvim
    use "voldikss/vim-floaterm"

    -- Treesitter Plugins {{{
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/playground"
    -- }}}

    -- LSP Plugins {{{
    use "nvim-lua/lsp-status.nvim"
    use "neovim/nvim-lspconfig"
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lsp-signature-help"
      }
    }
    use "nvim-lua/lsp_extensions.nvim"
    use "onsails/lspkind-nvim"
    -- }}}

    -- Tmux Plugins {{{
    use "tmux-plugins/vim-tmux-focus-events"

    -- Allows navigation between vim and tmux
    use "christoomey/vim-tmux-navigator"
    -- }}}

    -- Comment helper
    use {
      "numToStr/Comment.nvim",
      requires = {
        "JoosepAlviste/nvim-ts-context-commentstring"
      }
    }

    use {
      "kevinhwang91/nvim-bqf",
      requires = {
        {
          "junegunn/fzf",
          run = function()
              vim.fn["fzf#install"]()
          end
        }
      }
    }

    -- Run tests inside nvim
    use "David-Kunz/jester"
    use "vim-test/vim-test"

    -- Live Markdown previews
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

    -- Additional search highlighting
    use "kevinhwang91/nvim-hlslens"

    -- Telescope Plugins {{{
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzf-writer.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use 'nvim-telescope/telescope-ui-select.nvim'
    -- }}}

    -- Git status integration
    use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use {
      "TimUntersberger/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim"
      }
    }

    -- Documentation generator
    use {
      "kkoomen/vim-doge",
      run = function()
          vim.fn["doge#install"]()
      end
    }

    -- Git UI
    use { "tpope/vim-fugitive", requires = { "tpope/vim-rhubarb" } }

    -- Adds commands to easliy change surrounding quotes, brackets, etc.
    use "tpope/vim-surround"

    -- Test startup time
    use "tweekmonster/startuptime.vim"

    -- Swap file handling
    use "gioele/vim-autoswap"

    -- Maximize buffers
    use "szw/vim-maximizer"

    -- Adds debugger to nvim
    -- use "puremourning/vimspector"
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "nvim-telescope/telescope-dap.nvim"
    use "theHamsta/nvim-dap-virtual-text"

    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
          require("trouble").setup {}
      end
    }


    -- Snippets
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "rafamadriz/friendly-snippets"

    -- -- Uncomment when I want to explain regex, no way to override default mappings
    -- use { 'bennypowers/nvim-regexplainer',
    -- config = function() require'regexplainer'.setup()  end,
    --   requires = {
    --     'nvim-treesitter/nvim-treesitter',
    --     'MunifTanjim/nui.nvim',
    --   }
    -- }

    use {
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
      config = function()
          require("package-info").setup()
      end
    }

    use "ggandor/lightspeed.nvim"

    use { "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" }

end
)

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_trailing_blankline_indent = false
}

-- load plugin configs
require("gb.autoswap")
require("gb.colorizer")
require("gb.commenter")
require("gb.debugger")
require("gb.file-explorer")
require("gb.finder")
require("gb.format")
require("gb.git")
require("gb.harpoon")
require("gb.hlslens")
require("gb.lsp")
require("gb.lsp-trouble")
require("gb.maximizer")
require("gb.remaps")
require("gb.statusline")
require("gb.term")
require("gb.test")
require("gb.tmux-navigator")
require("gb.treesitter")
