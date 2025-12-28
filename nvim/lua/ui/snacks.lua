return {
    "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
			bigfile = { enabled = true },
            picker = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			terminal = {
				win = {
					style = "float",
					border = "rounded",
					height = 0.65,
					width = 0.7,
					title = "Ruben's terminal",
				},
			},
  }
}
