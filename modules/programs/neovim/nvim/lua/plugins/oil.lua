local M = {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}
M.config = function()
	local ok, oil = pcall(require, "oil")
	if not ok then
		return
	end

	oil.setup({
		watch_for_changes = false,
		float = {
			max_width = 0.4,
		},
	})
end

return M
