-- virtual text support for dap

local M = {
	"theHamsta/nvim-dap-virtual-text",
	event = "VeryLazy",
}

M.config = function()
	local ok, text = pcall(require, "nvim-dap-virtual-text")
	if not ok then
		return
	end

	text.setup({
		virt_text_pos = "eol",
	})
end

return M
