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
      vim.keymap.set("n", "gp", function()
        local filepath = vim.fn.expand("%:p")
        local line = vim.api.nvim_win_get_cursor(0)[1]

        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if git_root == "" then
          vim.notify("Not inside a git repository", vim.log.levels.ERROR)
          return
        end

        local head_ref = vim.fn.systemlist("git symbolic-ref refs/remotes/origin/HEAD")[1]
        local rel_path = filepath:gsub(git_root .. "/", "")
        local commit = vim.fn.systemlist("git rev-parse HEAD")[1]
        local remote = vim.fn.systemlist("git remote get-url origin")[1]
        local default_branch = head_ref and head_ref:match("refs/remotes/origin/(.+)")
        if not default_branch then
          vim.notify("Could not detect default branch", vim.log.levels.ERROR)
          return
        end

        local github_repo_url = remote
          :gsub("git@github.com:", "https://github.com/")
          :gsub("%.git$", "")
          :gsub("^git://github.com/", "https://github.com/")
          :gsub("^https://github.com/", "https://github.com/") -- handles HTTPS too

        if not github_repo_url:match("^https://github.com/") then
          vim.notify("Unsupported remote URL: " .. remote, vim.log.levels.ERROR)
          return
        end

        local permalink = string.format("%s/blob/%s/%s#L%d", github_repo_url, default_branch, rel_path, line)

        vim.fn.setreg("+", permalink)
      end, { buffer = bufnr, desc = "[g]it [p]ermalink" })
    end,
  },
}
