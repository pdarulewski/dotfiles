-- github copilot

local M = {
	"github/copilot.vim",
	event = "VeryLazy",
	enabled = false,
}

M.config = function()
	vim.g.copilot_no_tab_map = true
	vim.api.nvim_set_keymap("i", "<M-Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
	vim.api.nvim_set_var("copilot_filetypes", {
		["dap-repl"] = false,
		["dotenv"] = false,
	})
end

return M
