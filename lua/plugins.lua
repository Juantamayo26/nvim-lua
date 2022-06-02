local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "williamboman/nvim-lsp-installer"

  --lsp
  use {
    'neovim/nvim-lspconfig',
    config =  function()
      require("lsp")
    end
  }

  -- better text highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() 
      require('config.treesitter')
    end,
    run = ':TSUpdate',
  }

  -- completion engine
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip', },
    },
    config = function() require('config.compe') end,
  }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
  }
 -- lua lsp defaults
  use {
    'folke/lua-dev.nvim',
  }


  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}, 
    config = function()
      require('config.telescope')
    end,
    cmd = "Telescope"
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
  use {
    "kyazdani42/nvim-tree.lua",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 
      require("config.nvimtree").config()
    end
  }

  -- Nice theme
  use "morhetz/gruvbox"

  -- whichkey
  use {
    "folke/which-key.nvim",
    config = function()
        require("config.which-key")
    end
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('config.statusline')
    end,
  }


  use {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require("config.terminal")
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)
