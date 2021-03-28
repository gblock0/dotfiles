local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
-- require("packer").init({display = {auto_clean = false}})

return require("packer").startup(
  function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- Current Theme
    use "gblock0/oceanic-next"

    use "lukas-reineke/format.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "RRethy/vim-illuminate"
    use "nvim-lua/lsp-status.nvim"

    use "rafcamlet/nvim-luapad"

    -- nvim-lsp
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "glepnir/lspsaga.nvim"
    use "nvim-lua/lsp_extensions.nvim"

    -- nvim-treesitter
    -- TSInstall toml lua tsx css javascript jsonc yaml json regex bash python jsdoc html rust typescript
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/playground"

    -- Debugging
    use "janko/vim-test"
    use "glepnir/galaxyline.nvim"
    use "kyazdani42/nvim-web-devicons"
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}

    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/gitsigns.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-fzf-writer.nvim"

    use "onsails/lspkind-nvim"
    use "b3nj5m1n/kommentary"

    use {
      "kkoomen/vim-doge",
      run = function()
        vim.fn["doge#install"]()
      end
    }
    -- Utilities
    use "puremourning/vimspector"

    use "kyazdani42/nvim-tree.lua"

    use "tmux-plugins/vim-tmux-focus-events"

    use "christoomey/vim-tmux-navigator" -- Allows navigation between vim and tmux
    use "gregsexton/MatchTag" -- Highlights the matching HTML tag
    use "tpope/vim-fugitive" -- Git stuff
    use "tpope/vim-surround" -- Change surrounding quotes, brackets, etc.
    use "tweekmonster/startuptime.vim" -- Uncomment to test startup time
    use "gioele/vim-autoswap" -- Swap file handling
    use "lfv89/vim-interestingwords" -- Highlight different words in a file
    use {"junegunn/vader.vim", ft = {"vader"}}
    use "szw/vim-maximizer"
  end
)
