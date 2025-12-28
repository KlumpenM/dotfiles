return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",

    -- Language specific adapters
    "leoluz/nvim-dap-go",
  },
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
    { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
    { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step Out" },
    { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
    { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle UI" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- Language specific setups
    require("dap-go").setup()
    require("dap-python").setup("python")

    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Signs
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
  end,
}
