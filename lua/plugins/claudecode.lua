return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  keys = {
    { "<leader>c", nil, desc = "AI/Claude Code" },
    { "<leader>ct", "<cmd>ClaudeCode<cr>", desc = "[c]laude Code <t>oggle" },
    { "<leader>caf", "<cmd>ClaudeCodeAdd %<cr>", desc = "[c]laude [a]dd current [b]uffer" },
    { "<leader>cal", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "[c]laude [a]dd current [l]innes" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "[c]laude Code [r]esume" },
    { "<leader>cc", "<cmd>ClaudeCode --continue<cr>", desc = "[c]laude Code [c]ontinue" },
    -- files
    { "<leader>cad", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "[c]laude [a]ccept diff" },
    { "<leader>crd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "[c]laude [r]eject diff" },
    -- window navigation
    { "<C-h>", "<C-\\><C-n><C-w>h", mode = "t", desc = "Move to left window" },
    { "<C-w>", "<Nop>", mode = "t", desc = "Disable word deletion" },
  },
  opts = {
    track_selection = true,
    terminal = {
      split_side = "right",
      split_width_percentage = 0.4,
      provider = "auto",
    },
  },
}
