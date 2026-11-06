-- obsidian for nvim

local M = {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	local ok, obsidian = pcall(require, "obsidian")
	if not ok then
		return
	end

	obsidian.setup({
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
		},
	})
end

return M
