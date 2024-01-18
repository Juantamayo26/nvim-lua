local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return require("packer").startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "bluz71/vim-nightfly-guicolors"
  use {
	  "VonHeikemen/lsp-zero.nvim",
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
    config = function() require('lsp.init') end,
  }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require('config.nvimtree') end,
  }

  ---- better text highlighting
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
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-fzy-native.nvim' } },
    config = function()
      require('config.telescope')
    end,
    cmd = "Telescope"
  }

  -- BufferLine
  use {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("config.bufferline")
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

  use {
    "ThePrimeagen/harpoon",
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.harpoon")
    end
  }

  use {
    'Exafunction/codeium.vim',
    config = function ()
      vim.keymap.set('i', '<C-l>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)
