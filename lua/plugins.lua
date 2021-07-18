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
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"
    use {"neovim/nvim-lspconfig"}
    use {"glepnir/lspsaga.nvim"}

    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("lv-compe").config()
        end
    }


    -- Menu
    use {
        "kyazdani42/nvim-tree.lua",
        -- cmd = "NvimTreeToggle",
        config = function()
            require("lv-nvimtree").config()
        end
    }

    -- whichkey
    use {"folke/which-key.nvim"}


    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim"}

    -- buffer
    use {
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("lv-bufferline").config()
        end,
        event = "BufRead"

    }

    -- Color
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

    -- competitive programming
    use{
      'searleser97/cpbooster.vim'
    }

end)
