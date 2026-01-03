-- repl highlighting in dap ui

local M = {
	"LiadOz/nvim-dap-repl-highlights",
	event = "VeryLazy",
}

M.config = function()
	local ok, highlights = pcall(require, "nvim-dap-repl-highlights")
	if not ok then
		return
	end

	highlights.setup()
end

return M
