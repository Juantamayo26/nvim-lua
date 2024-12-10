return {
  "voldikss/vim-floaterm",
  keys = {
    { "<leader>tt", ":FloatermToggle<CR>", desc = "[t]oggle [t]erminal" },
    { "<Esc>", "<C-\\><C-N>", mode = "t" },
    { "<leader>x", "<C-\\><C-N>:close<CR>", mode = "t"},
    { "<leader>x", ":close<CR>", ft = "floaterm" },
  },
}
