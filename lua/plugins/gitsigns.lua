return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      vim.keymap.set("n", "[g", function()
        gitsigns.nav_hunk("prev")
      end, { buffer = bufnr, desc = "prev hunk" })
      vim.keymap.set("n", "]g", function()
        gitsigns.nav_hunk("next")
      end, { buffer = bufnr, desc = "next hunk" })
      vim.keymap.set("n", "<leader>gb", function()
        gitsigns.blame()
      end, { buffer = bufnr, desc = "[g]it [b]lame" })
      vim.keymap.set("n", "<leader>gl", function()
        gitsigns.blame_line()
      end, { buffer = bufnr, desc = "[g]it blame [l]ine" })
      vim.keymap.set("n", "<leader>gr", function()
        gitsigns.reset_hunk()
      end, { buffer = bufnr, desc = "[g]it [r]eset hunk" })
      vim.keymap.set("n", "<leader>gd", function()
        gitsigns.diffthis()
      end, { buffer = bufnr, desc = "[g]it [d]iff" })
    end,
  },
}
