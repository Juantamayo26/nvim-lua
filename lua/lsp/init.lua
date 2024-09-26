local lsp = require("lsp-zero")
local Remap = require("keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

lsp.preset("recommended")

lsp.ensure_installed({
  'eslint',
  'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
  sign_icons = { }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
    nnoremap("<leader>ld", function() vim.lsp.buf.definition() end)
    nnoremap("K", function() vim.lsp.buf.hover() end)
    nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
    nnoremap("<C-n>", function() vim.diagnostic.goto_next() end)
    nnoremap("<C-p>", function() vim.diagnostic.goto_prev() end)
    nnoremap("<leader>la", function() vim.lsp.buf.code_action() end)
    nnoremap("<leader>lr", function() vim.lsp.buf.references() end)
    nnoremap("<leader>lR", function() vim.lsp.buf.rename() end)
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end)

lsp.setup()

