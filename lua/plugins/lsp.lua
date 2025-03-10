local mason = "williamboman/mason.nvim"

local mason_lspconfig = "williamboman/mason-lspconfig.nvim"
local nvim_lspconfig = "neovim/nvim-lspconfig"

local cmp_nvim = "hrsh7th/nvim-cmp"
local cmp_lsp = "hrsh7th/cmp-nvim-lsp"

local luasnip = "L3MON4D3/LuaSnip"

return {
  {
    mason_lspconfig,
    event = "VimEnter",
    dependencies = {
      mason,
      nvim_lspconfig,
    },
    opts = function()
      local lspconfig = require("lspconfig")
      local lsp_zero = require("lsp-zero")
      local lsp_cmp = require("cmp_nvim_lsp")

      return {
        ensure_installed = {
          "bashls",
          "clangd",
          "dockerls",
          "jsonls",
          "lua_ls",
          "pyright",
          "terraformls",
          "ts_ls",
        },
        handlers = {
          lsp_zero.default_setup,

          clangd = function()
            lspconfig.clangd.setup({
              capabilities = lsp_cmp.default_capabilities(),
              init_options = {
                fallbackFlags = { "-std=c++20" },
              },
            })
          end,

          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls({
              capabilities = lsp_cmp.default_capabilities(),
            })
            lspconfig.lua_ls.setup(lua_opts)
          end,

          pyright = function()
            lspconfig.pyright.setup({
              capabilities = lsp_cmp.default_capabilities(),
            })
          end,
        },
      }
    end,
  },
  {
    cmp_nvim,
    event = "InsertEnter",
    dependencies = {
      nvim_lspconfig,
      cmp_lsp,
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "github/copilot.vim"
    },
    opts = function()
      local lsp_zero = require("lsp-zero")
      local cmp = require("cmp")
      local mapping = cmp.mapping

      cmp.setup.cmdline(":", {
        mapping = mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline", option = {
            ignore_cmds = { "Git" },
          } },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      return {
        completion = {
          keyword_length = 3,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
        }),
        snippet = {
          function(args)
            vim.snippet.expand(args.body)
          end,
        },
        formatting = lsp_zero.cmp_format(),
        mapping = mapping.preset.insert({
          ["<Up>"] = mapping.scroll_docs(-4),
          ["<Down>"] = mapping.scroll_docs(4),

          ["<C-p>"] = mapping.select_prev_item(),
          ["<C-n>"] = mapping.select_next_item(),

          ["<C-e>"] = mapping.close(),
          ["<C-s>"] = mapping.complete(),
          ["<C-y>"] = mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          }),
        }),
      }
    end,
  },
  {
    luasnip,
    version = "2.*",
    event = "VeryLazy",
    build = "make install_jsregexp",
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "VimEnter",
    dependencies = {
      mason,
      mason_lspconfig,
      nvim_lspconfig,
      cmp_lsp,
      luasnip,
    },
    branch = "v3.x",
    config = function()
      require("lsp-zero").on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        vim.keymap.set("n", "<leader>ld", function()
          vim.lsp.buf.definition()
        end, { buffer = bufnr, desc = "[l]sp [d]efinitions" })
        vim.keymap.set("n", "<leader>lh", function()
          vim.lsp.buf.hover()
        end, { buffer = bufnr, desc = "[l]sp [h]over" })
        vim.keymap.set("n", "<leader>lr", function()
          vim.lsp.buf.references()
        end, { buffer = bufnr, desc = "[l]sp [r]eferences" })
        vim.keymap.set("n", "<leader>la", function()
          vim.lsp.buf.code_action()
        end, { buffer = bufnr, desc = "[l]sp code [a]ctions" })
        vim.keymap.set("n", "<leader>lR", function()
          vim.lsp.buf.rename()
        end, { buffer = bufnr, desc = "[l]sp [R]ename" })
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_next()
        end, { buffer = bufnr, desc = "]next [d]iagnostic" })
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_prev()
        end, { buffer = bufnr, desc = "[prev [d]iagnostic" })
      end)
    end,
  },
}
