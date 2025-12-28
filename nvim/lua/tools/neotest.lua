return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",

    -- Adapters
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    { "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Test Nearest" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test File" },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Test Summary" },
    { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Test Output" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-go"),
        require("neotest-python"),
        require("neotest-jest"),
      },
    })
  end,
}
