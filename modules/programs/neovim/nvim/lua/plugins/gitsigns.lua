-- git status indicators in the gutter

local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, gitsigns = pcall(require, "gitsigns")
	if not ok then
		return
	end

	gitsigns.setup({
		current_line_blame = true,
		gh = true,
	})
end

return M
