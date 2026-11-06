local M = {
	"nvim-treesitter/nvim-treesitter-context",
}

M.config = function()
	local ok, context = pcall(require, "treesitter-context")
	if not ok then
		return
	end

	context.setup({
		enable = true,
		max_lines = 1,
		separator = "-",
		trim_scope = "inner",
	})
end

return M
