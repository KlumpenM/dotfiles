return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
  },
  opts = {
    ensure_installed = {
        "c", "lua", "vim", "vimdoc", "markdown",
        "go", "gomod", "gosum",
        "javascript", "typescript", "tsx",
        "yaml", "json", "html", "css",
    },
    auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = { "yaml" },
      },
  },
}
