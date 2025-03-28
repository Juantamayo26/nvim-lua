local mason = "williamboman/mason.nvim"
local mason_lspconfig = "williamboman/mason-lspconfig.nvim"
local nvim_lspconfig = "neovim/nvim-lspconfig"
local blink_cmp = "Saghen/blink.cmp"
local luasnip = "L3MON4D3/LuaSnip"

return {
  {
    mason_lspconfig,
    event = "VimEnter",
    dependencies = { mason, nvim_lspconfig },
    opts = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      end

      return {
        ensure_installed = { "bashls", "clangd", "dockerls", "jsonls", "lua_ls", "pyright", "terraformls", "ts_ls" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ on_attach = on_attach })
          end,
        },
      }
    end,
  },
  {
    blink_cmp,
    event = "InsertEnter",
    dependencies = {
      nvim_lspconfig,
      luasnip,
    },
    opts = function()
      return {
        completion = {
          accept = { auto_brackets = { enabled = true }, },
          documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        appearance = {
          nerd_font_variant = 'mono'
        },
        signature = { enabled = true }
      }
    end,
  },
}
