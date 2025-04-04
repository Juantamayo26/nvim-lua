return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      fidget = true, -- required
      gitsigns = true, -- required
      harpoon = true, -- required
      mason = true, -- required
      which_key = true, -- required
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
