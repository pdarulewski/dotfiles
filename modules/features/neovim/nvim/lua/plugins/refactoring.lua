-- refactoring

local M = {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	local ok, refactoring = pcall(require, "refactoring")
	if not ok then
		return
	end

	refactoring.setup()
end

return M
