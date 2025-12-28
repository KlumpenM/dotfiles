return {
	{
		"nvim-mini/mini.comment",
		version = false,
		options = {
			custom_commentstring = function()
				return vim.bo.commentstring
			end,
		},
		mappings = {
			comment = "gc",
			comment_line = "gcc",
			comment_visual = "gc",
			textobject = "gc",
		},
	},
	{
		"nvim-mini/mini.diff",
		version = false,
	},
	{
		"nvim-mini/mini.nvim",
		version = false,
		modes = { insert = true, command = false, terminal = true },
		mappings = {
			["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
			["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
			["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

			[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
			["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
			["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

			['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
			["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
		},
	},
}
