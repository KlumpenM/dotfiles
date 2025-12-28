vim.lsp.config('lua_ls', {
  capabilities = _G.lsp_capabilities,
  on_attach = _G.lsp_on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    }
  }
})

vim.lsp.enable('lua_ls')
