return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame line" })
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle line blame" })
      map('n', '<leader>hd', gs.diffthis, { desc = "Diff this" })
      map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff this ~" })
    end
  },
}
