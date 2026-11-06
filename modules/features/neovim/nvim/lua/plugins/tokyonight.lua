-- tokyonight theme

local switcher = require("plugins.themes.switcher")
local theme = switcher.switchTheme()

local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

if theme.name == "ocean" then
	M.config = function()
		require("tokyonight").setup({
			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			sidebars = { "qf", "terminal", "packer" },
			dim_inactive = true,
			on_highlights = theme.theme.on_highlights,
			on_colors = theme.theme.on_colors,
		})

		vim.cmd.colorscheme("tokyonight")
	end
end

return M
