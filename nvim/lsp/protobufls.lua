vim.lsp.config('buf_ls', {  -- Changed from bufls
  capabilities = _G.lsp_capabilities,
  on_attach = _G.lsp_on_attach,
})

vim.lsp.enable('buf_ls')
