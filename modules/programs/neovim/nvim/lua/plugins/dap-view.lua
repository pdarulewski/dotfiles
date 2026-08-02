local M = {
	"igorlfs/nvim-dap-view",
}

M.config = function()
	local ok, dapview = pcall(require, "dap-view")
	if not ok then
		return
	end

	dapview.setup({
		winbar = {
			default_section = "scopes",
			sections = {
				"scopes",
				"watches",
				"repl",
				"breakpoints",
				"threads",
			},
		},
		windows = {
			size = 0.35,
			position = "right",
			terminal = {
				size = 0.5,
				position = "left",
			},
		},
		virtual_text = {
			enabled = true,
			position = "eol_right_align",
		},
		auto_toggle = true,
	})
end

return M
