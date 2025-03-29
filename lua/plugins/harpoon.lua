return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = function()
    return {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "[h]arpoon [a]dd",
      },
      {
        "<C-e>",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
      },
      -- {
      --   "<C-s>",
      --   function()
      --     harpoon:list():select(1)
      --   end,
      -- },
      -- {
      --   "<C-f>",
      --   function()
      --     harpoon:list():select(2)
      --   end,
      -- },
      -- {
      --   "<C-k>",
      --   function()
      --     harpoon:list():select(3)
      --   end,
      -- },
      -- {
      --   "<C-l>",
      --   function()
      --     harpoon:list():select(4)
      --   end,
      -- },
    }
  end,
  opts = {
    settings = {
      save_on_toggle = true,
      save_on_ui_close = true,
    },
  },
  config = function(_, opts)
    require("harpoon"):setup(opts)
  end,
}
