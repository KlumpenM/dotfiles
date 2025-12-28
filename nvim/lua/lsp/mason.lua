-- ~/.config/nvim/lua/lsp/mason.lua
return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"stylua",
				"bashls",
				"gopls",
				"graphql",
				"jsonls",
				"ts_ls",
				"buf_ls",
			},
			automatic_installation = true,
		})
	end,
}
