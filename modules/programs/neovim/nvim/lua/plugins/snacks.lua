local M = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {
			width = 80,
			enabled = true,
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = "<cmd>Telescope find_files hidden=true<cr>",
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = "<cmd>Telescope live_grep hidden=true<cr>",
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{
					section = "terminal",
					cmd = "chafa /Users/pd/whale.jpg --format symbols --symbols vhalf --size 80x20 --stretch; sleep .1",
					height = 15,
					padding = 1,
				},
				{
					pane = 2,
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
		},
		-- notifications in the bottom right corner
		notifier = {
			enabled = true,
			timeout = 3000,
			top_down = false,
		},

		-- picker for pop ups
		picker = { enabled = true },

		lazygit = { enabled = true },
		gh = { enabled = true },
		indent = { enabled = true },
		scratch = {
			enabled = true,
			ft = "markdown",
		},

		animate = { enabled = false },
		bigfile = { enabled = false },
		bufdelete = { enabled = false },
		dim = { enabled = false },
		explorer = { enabled = false },
		git = { enabled = false },
		image = { enabled = false },
		keymap = { enabled = false },
		layout = { enabled = false },
		notify = { enabled = false },
		profiler = { enabled = false },
		quickfile = { enabled = false },
		rename = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		terminal = { enabled = false },
		toggle = { enabled = false },
		input = { enabled = false },
		util = { enabled = false },
		win = { enabled = false },
		words = { enabled = false },

		debug = { enabled = false },
		gitbrowse = { enabled = false },
		zen = { enabled = false },
	},
}

return M
