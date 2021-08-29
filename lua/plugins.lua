local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

packer.init {
    -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
    compile_path = require("packer.util").join_paths(vim.fn.stdpath('config'),
                                                     'plugin',
                                                     'packer_compiled.vim'),
    git = {clone_timeout = 300},
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    }
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --lsp
  use {
    'neovim/nvim-lspconfig',
    config =  function()
      require("lsp")
    end
  }
  use { 'kabouzeid/nvim-lspinstall' }

  -- Autocomplete
  use {
      "hrsh7th/nvim-compe",
      config = function()
          require("config.compe").config()
      end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}, 
    config = function()
      require('config.telescope')
    end,
    cmd = "Telescope"
  }

  -- Status Line and Bufferline
  use {
    "glepnir/galaxyline.nvim",
    config = function()
      require("config.galaxyline")
    end
  }

  -- BufferLine
  use {
      "akinsho/nvim-bufferline.lua",
      config = function()
          require("config.bufferline").config()
      end,
      event = "BufWinEnter",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.gitsigns").config()
    end,
    event = "BufRead",
  }

  -- Tree
  use 'kyazdani42/nvim-web-devicons' --icons
  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    config = function()
        require("config.nvimtree").config()
    end
  }

  -- competitive programming
  use 'searleser97/cpbooster.vim'

  -- use {  -- It doesn't work idn why
  --   "ray-x/lsp_signature.nvim"
  -- }

  use "jose-elias-alvarez/null-ls.nvim" 

  use "morhetz/gruvbox"

  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  -- whichkey
  use {
    "folke/which-key.nvim",
    config = function()
        require("config.which-key")
    end
  }

  use { 
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require("config.treesitter")
    end
  }


end)
