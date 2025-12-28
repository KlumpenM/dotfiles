vim.lsp.config('ts_ls', {  -- Changed from ts_server
  capabilities = _G.lsp_capabilities,
  on_attach = _G.lsp_on_attach,
})

vim.lsp.enable('ts_ls')
