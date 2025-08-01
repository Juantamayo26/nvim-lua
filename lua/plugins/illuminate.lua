return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local illuminate = require("illuminate")

    pcall(vim.api.nvim_del_keymap, "n", "a-n")
    pcall(vim.api.nvim_del_keymap, "n", "a-p")

    vim.keymap.set("n", "[a", illuminate.goto_prev_reference, { desc = "Go to previous reference" })
    vim.keymap.set("n", "]a", illuminate.goto_next_reference, { desc = "Go to next reference" })
  end,
}
