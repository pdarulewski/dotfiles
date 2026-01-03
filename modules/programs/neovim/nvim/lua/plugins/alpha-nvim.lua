-- welcome screen

local M = {
	"goolord/alpha-nvim",
}

M.config = function()
	require("alpha.term")

	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.terminal = {
		type = "terminal",
		command = "cat | onefetch --no-title -d churn --no-color-palette --nerd-fonts",
		width = 100,
		height = 20,
		opts = {
			redraw = true,
			window_config = {},
		},
	}

	dashboard.section.buttons.val = {
		dashboard.button("a", "  New file", ":ene <BAR> startinsert <cr>"),
		dashboard.button("p", "  Projects", "<cmd>Telescope projects<cr>"),
		dashboard.button("f", "  Find files", "<cmd>Telescope find_files hidden=true<cr>"),
		dashboard.button("t", "  Find text", "<cmd>Telescope live_grep hidden=true<cr>"),
		dashboard.button("q", "󰅖  Quit Neovim", ":qa<cr>"),
	}

	dashboard.config.layout = {
		{ type = "padding", val = 1 },
		dashboard.section.terminal,
		{ type = "padding", val = 1 },
		dashboard.section.buttons,
		{ type = "padding", val = 1 },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)
end

return M
