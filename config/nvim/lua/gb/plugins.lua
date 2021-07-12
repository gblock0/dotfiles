vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"

    -- Theme
    use "gblock0/oceanic-next"

    -- Statusline
    use "famiu/feline.nvim"

    -- File tree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    -- Highlight hex colors
    use "norcalli/nvim-colorizer.lua"

    -- Autoformater
    use "lukas-reineke/format.nvim"

    -- Highlight other uses of the current word under the cursor
    use "RRethy/vim-illuminate"

    -- Lua scratchpad
    use "rafcamlet/nvim-luapad"

    -- Toggle floating terminal inside nvim
    use "voldikss/vim-floaterm"

    -- Treesitter Plugins {{{
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/playground"
    -- }}}

    -- LSP Plugins {{{
    use "nvim-lua/lsp-status.nvim"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "glepnir/lspsaga.nvim"
    use "nvim-lua/lsp_extensions.nvim"
    use "onsails/lspkind-nvim"
    -- }}}

    -- Tmux Plugins {{{
    use "tmux-plugins/vim-tmux-focus-events"

    -- Allows navigation between vim and tmux
    use "christoomey/vim-tmux-navigator"
    -- }}}

    -- Comment helper
    use "b3nj5m1n/kommentary"
    use "JoosepAlviste/nvim-ts-context-commentstring"

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
    use "janko/vim-test"

    -- Live Markdown previews
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview"}

    -- Additional search highlighting
    use "kevinhwang91/nvim-hlslens"

    -- Telescope Plugins {{{
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzf-writer.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    -- }}}

    -- Git status integration
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- Documentation generator
    use {
      "kkoomen/vim-doge",
      run = function()
        vim.fn["doge#install"]()
      end
    }

    -- Git UI
    use "tpope/vim-fugitive"

    -- Adds commands to easliy change surrounding quotes, brackets, etc.
    use "tpope/vim-surround"

    -- Test startup time
    use "tweekmonster/startuptime.vim"

    -- Swap file handling
    use "gioele/vim-autoswap"

    -- Maximize buffers
    use "szw/vim-maximizer"

    -- Adds debugger to nvim
    use "puremourning/vimspector"

    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    use "ray-x/lsp_signature.nvim"
  end
)

-- load plugin configs
require("gb.autoswap")
require("gb.colorizer")
require("gb.commenter")
require("gb.file-explorer")
require("gb.finder")
require("gb.format")
require("gb.git")
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
require("gb.vimspector")
