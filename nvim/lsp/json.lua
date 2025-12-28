require('lspconfig').jsonls.setup({
  capabilities = _G.lsp_capabilities,
  on_attach = _G.lsp_on_attach,
})
