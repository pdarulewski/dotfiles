-- git worktree support

local M = {
	"afonsofrancof/worktrees.nvim",
	event = "VeryLazy",
	opts = {
		path_template = function(branch)
			return branch:gsub("/", "-")
		end,
	},
}

return M
