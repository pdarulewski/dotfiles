-- symbols tree

local M = {
	"hedyhli/outline.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, outline = pcall(require, "outline")
	if not ok then
		return
	end

	outline.setup({
		width = 15,
	})
end

return M
