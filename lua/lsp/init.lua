require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local servers = { 'rust_analyzer', 'tsserver', 'sumneko_lua', 'clangd', 'pyright' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

vim.cmd("nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>")
-- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
-- vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')
vim.cmd("nnoremap <silent> <C-p> :lua vim.diagnostic.goto_prev({popup_opts = {border = single}})<CR>")
vim.cmd("nnoremap <silent> <C-n> :lua vim.diagnostic.goto_next({popup_opts = {border = single}})<CR>")
vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting()")
