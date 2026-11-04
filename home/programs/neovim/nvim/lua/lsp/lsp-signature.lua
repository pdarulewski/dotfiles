-- function signature

local M = {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
}

M.config = function()
	local ok, lsp_signature = pcall(require, "lsp_signature")
	if not ok then
		return
	end

	lsp_signature.setup({
		max_height = 4,
		doc_lines = 2,
	})
end

return M
