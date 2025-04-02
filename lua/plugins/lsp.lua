local mason = "williamboman/mason.nvim"
local mason_lspconfig = "williamboman/mason-lspconfig.nvim"
local nvim_lspconfig = "neovim/nvim-lspconfig"
local blink_cmp = "Saghen/blink.cmp"

return {
  {
    mason_lspconfig,
    event = "VimEnter",
    dependencies = { mason, nvim_lspconfig },
    opts = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      return {
        ensure_installed = { "bashls", "clangd", "dockerls", "jsonls", "lua_ls", "pyright", "terraformls", "ts_ls" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
        },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("n", "<leader>ld", function()
            vim.lsp.buf.definition()
          end, { buffer = args.buf, desc = "[l]sp code [d]efinitions" })
          vim.keymap.set("n", "<leader>la", function()
            vim.lsp.buf.code_action()
          end, { buffer = args.buf, desc = "[l]sp code [a]ctions" })
          vim.keymap.set("n", "<leader>lr", function()
            vim.lsp.buf.references()
          end, { buffer = args.buf, desc = "[l]sp [r]eferences" })
          vim.keymap.set("n", "<leader>lR", function()
            vim.lsp.buf.rename()
          end, { buffer = args.buf, desc = "[l]sp [R]ename" })
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next()
          end, { buffer = args.buf, desc = "]next [d]iagnostic" })
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev()
          end, { buffer = args.buf, desc = "[prev [d]iagnostic" })
        end,
      })

      require("mason-lspconfig").setup(opts)
    end,
  },
  {
    blink_cmp,
    event = "InsertEnter",
    dependencies = {
      nvim_lspconfig,
    },
    version = "*",
    opts = function()
      return {
        completion = {
          accept = { auto_brackets = { enabled = true }, },
          documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },
        signature = { enabled = true }
      }
    end,
  },
}
