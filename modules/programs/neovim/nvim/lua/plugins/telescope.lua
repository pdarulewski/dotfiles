-- telescope windows with fuzzy search

local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	local ok, telescope = pcall(require, "telescope")
	if not ok then
		return
	end

	telescope.setup({
		defaults = {
			file_ignore_patterns = {
				"mocks",
				"go.mod",
				"go.sum",
			},
			mappings = {
				i = {
					["<c-c>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
		pickers = {
			live_grep = {
				additional_args = function(opts)
					return { "--hidden" }
				end,
			},
		},
	})

	telescope.load_extension("refactoring")
end

return M
