-- toggle terminal

local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, toggleterm = pcall(require, "toggleterm")
	if not ok then
		return
	end

	local theme = os.getenv("THEME")

	local highlights = {}

	if theme == "rose" then
		highlights = require("rose-pine.plugins.toggleterm")
	end

	toggleterm.setup({
		open_mapping = [[<c-\>]],
		direction = "horizontal",
		size = 10,
		insert_mappings = true,
		float_opts = {
			border = "curved",
		},
		highlights = highlights,
	})

	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return M
