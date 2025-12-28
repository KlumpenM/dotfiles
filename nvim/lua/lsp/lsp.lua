return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- Merge nvim-cmp capabilities
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Global LSP keybindings
    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }

      -- Navigation
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

      -- Information
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      -- Actions
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      -- Diagnostics
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    end

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Store for use in server configs
    _G.lsp_capabilities = capabilities
    _G.lsp_on_attach = on_attach

    -- LSP Server configurations using new API
    local servers = {
      bashls = {},
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      },
      graphql = {},
      jsonls = {},
      ts_ls = {},  -- Changed from ts_server
      buf_ls = {}, -- Changed from bufls
      lua_ls = {
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
            completion = {
              callSnippet = "Replace"
            },
          }
        }
      },
    }

    -- Setup all servers
    for server_name, config in pairs(servers) do
      -- Merge capabilities and on_attach
      config.capabilities = capabilities
      config.on_attach = on_attach

      -- Use new vim.lsp.config API
      vim.lsp.config(server_name, config)
      vim.lsp.enable(server_name)
    end
  end,
}
