return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-J>",
            next = "<C-L>",
            prev = "<C-K>",
            dismiss = "<C-E>",
          },
        },
        panel = { enabled = false },
        filetypes = {
          ["*"] = true,
          cpp = false,
        },
      })
    end,
  },
}
