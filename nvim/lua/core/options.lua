-- Local config
local opt = vim.opt

-- Leader key
vim.g.mapleader = ' '
vim.g.loacalleader = ' '

-- General Settings
opt.number = true                    -- Show line numbers
opt.relativenumber = true            -- Show relative line numbers
opt.mouse = "a"                      -- Enable mouse support
opt.clipboard = "unnamedplus"        -- Use system clipboard
opt.undofile = true                  -- Enable persistent undo
opt.swapfile = false                 -- Disable swap files
opt.backup = false                   -- Disable backup files

-- Indentation and formatting
opt.tabstop = 4                      -- Tab width (default, overridden by ftplugin)
opt.shiftwidth = 4                   -- Indent width
opt.expandtab = true                 -- Use spaces instead of tabs
opt.smartindent = true               -- Smart autoindenting
opt.autoindent = true                -- Maintain indent from previous line
opt.breakindent = true               -- Wrapped lines continue indent

-- Search
opt.ignorecase = true                -- Ignore case in search
opt.smartcase = true                 -- Override ignorecase if search has uppercase
opt.hlsearch = true                  -- Highlight search matches
opt.incsearch = true                 -- Show matches while typing

-- Ui and Apperance
opt.termguicolors = true             -- True color support
opt.signcolumn = "yes"               -- Always show sign column
opt.cursorline = true                -- Highlight current line
opt.scrolloff = 8                    -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8                -- Keep 8 columns visible when scrolling
opt.wrap = false                     -- Don't wrap lines
opt.linebreak = true                 -- Break lines at word boundaries
opt.showmode = false                 -- Don't show mode (statusline shows it)
opt.conceallevel = 0                 -- Don't hide characters
opt.pumheight = 10                   -- Popup menu height
opt.cmdheight = 1                    -- Command line height
opt.splitbelow = true                -- Horizontal splits go below
opt.splitright = true                -- Vertical splits go right

-- Editing
opt.timeoutlen = 300                 -- Time to wait for mapped sequence
opt.updatetime = 300                 -- Faster completion
opt.completeopt = { "menu", "menuone", "noselect" } -- Completion options
opt.shortmess:append("c")            -- Don't show completion messages
opt.iskeyword:append("-")            -- Treat dash as part of word

-- Performance
opt.lazyredraw = true                -- Don't redraw while executing macros
opt.synmaxcol = 240                  -- Max column for syntax highlighting
opt.hidden = true                    -- Keep buffers loaded in background

-- Folding
opt.foldmethod = "expr"              -- Use treesitter for folding
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99                   -- Open all folds by default
opt.foldlevelstart = 99              -- Start with all folds open

-- Diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

