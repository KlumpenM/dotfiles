-- ~/.config/nvim/lua/tools/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tt", desc = "Toggle Terminal" },
    { "<leader>tg", desc = "LazyGit" },
  },
  opts = {
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- LazyGit integration
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "double",
      },
    })

    function _G.lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", { desc = "LazyGit" })
  end,
}
