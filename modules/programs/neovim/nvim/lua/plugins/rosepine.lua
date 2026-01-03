-- rosepine theme

local switcher = require("plugins.themes.switcher")
local theme = switcher.switchTheme()

local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
}

if theme.name == "rose" then
	M.config = function()
		require("rose-pine").setup({
			variant = "moon",
			highlight_groups = theme.theme.highlight_groups,
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
		})

		vim.cmd.colorscheme("rose-pine")
	end
end

return M
