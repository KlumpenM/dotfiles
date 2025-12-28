vim.lsp.config('gopls', {
  capabilities = _G.lsp_capabilities,
  on_attach = _G.lsp_on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

vim.lsp.enable('gopls')
