return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  keys = {
    { "<leader>du", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
