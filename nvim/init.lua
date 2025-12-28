-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- t
-- Load core configuration
require("core.options")
require("core.autocmds")
require("core.keymaps")

-- Setup lazy and load plugins
require("lazy").setup({
	{ import = "ui" },
	{ import = "lsp" },
	{ import = "editor" },
	{ import = "tools" },
})
