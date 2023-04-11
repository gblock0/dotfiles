require('lazy').setup({
  {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup({
        fade_nc = true
      })
    end
  },

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        cmdline = {
          format = {
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          },
        },
        presets = {
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  "andythigpen/nvim-coverage",

  "lukas-reineke/indent-blankline.nvim",

  -- Statusline
  "freddiehaddad/feline.nvim",
  "nvim-lualine/lualine.nvim",

  -- File tree
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",

  -- Highlight hex colors
  "norcalli/nvim-colorizer.lua",

  -- Autoformater
  "lukas-reineke/lsp-format.nvim",
  "averms/black-nvim",

  -- Highlight other uses of the current word under the cursor
  "RRethy/vim-illuminate",

  -- Lua scratchpad
  "rafcamlet/nvim-luapad",

  -- Toggle floating terminal inside nvim
  "voldikss/vim-floaterm",

  -- Treesitter Plugins
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-context",


  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('neogen').setup()
    end
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*",
  },

  -- LSP Plugins
  "nvim-lua/lsp-status.nvim",
  "neovim/nvim-lspconfig",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    }
  },
  "nvim-lua/lsp_extensions.nvim",
  "onsails/lspkind-nvim",

  -- Tmux Plugins
  "tmux-plugins/vim-tmux-focus-events",

  -- Allows navigation between vim and tmux
  "christoomey/vim-tmux-navigator",

  -- Comment helper
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    }
  },

  {
    "kevinhwang91/nvim-bqf",
    dependencies = {
      {
        "junegunn/fzf",
        build = function()
          vim.fn["fzf#install"]()
        end
      }
    }
  },

  'smithbm2316/centerpad.nvim',

  -- Run tests inside nvim
  "David-Kunz/jester",
  -- "vim-test/vim-test",

  -- Live Markdown previews
  { "iamcco/markdown-preview.nvim",    build = "cd app && yarn install" },

  -- Additional search highlighting
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require('hlslens').setup()
    end
  },


  -- Telescope Plugins
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-writer.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  'nvim-telescope/telescope-ui-select.nvim',

  -- Git status integration
  { "lewis6991/gitsigns.nvim",                  dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    }
  },

  -- Git UI
  { "tpope/vim-fugitive",   dependencies = { "tpope/vim-rhubarb" } },

  -- Adds commands to easliy change surrounding quotes, brackets, etc.
  "tpope/vim-surround",

  -- Swap file handling
  "gioele/vim-autoswap",

  -- Maximize buffers
  "szw/vim-maximizer",

  -- Adds debugger to nvim
  -- "puremourning/vimspector",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "nvim-telescope/telescope-dap.nvim",
  "theHamsta/nvim-dap-virtual-text",

  {
    "folke/lsp-trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {}
    end
  },

  -- -- Uncomment when I want to explain regex, no way to override default mappings
  -- { 'bennypowers/nvim-regexplainer',
  -- config = function() require'regexplainer'.setup()  end,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'MunifTanjim/nui.nvim',
  --   }
  -- },

  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("package-info").setup({
        hide_up_to_date = true
      })
    end
  },

  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },

  "simrat39/rust-tools.nvim",
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  "williamboman/mason-lspconfig.nvim"
})
