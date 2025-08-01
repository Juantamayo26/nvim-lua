local mason = "williamboman/mason.nvim"
local mason_lspconfig = "williamboman/mason-lspconfig.nvim"
local nvim_lspconfig = "neovim/nvim-lspconfig"
local blink_cmp = "Saghen/blink.cmp"

return {
  {
    mason_lspconfig,
    event = "VimEnter",
    dependencies = { mason, nvim_lspconfig },
    config = function()
      require("mason").setup()
      
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

      require("mason-lspconfig").setup({
        ensure_installed = { "bashls", "clangd", "dockerls", "jsonls", "lua_ls", "pyright", "terraformls", "ts_ls" },
        automatic_enable = false,
      })

      -- Manual LSP setup since handlers are no longer supported
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      
      local servers = { "bashls", "clangd", "dockerls", "jsonls", "lua_ls", "pyright", "terraformls", "ts_ls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({ capabilities = capabilities })
      end
    end,
  },
  {
    blink_cmp,
    event = "InsertEnter",
    dependencies = {
      nvim_lspconfig,
    },
    version = "*",
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      signature = { enabled = true }
    },
  },
}
