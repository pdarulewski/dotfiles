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
						action = function()
							Snacks.picker.files()
						end,
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = function()
							Snacks.picker.grep()
						end,
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
		explorer = { enabled = true },
		-- notifications in the bottom right corner
		notifier = {
			enabled = true,
			timeout = 3000,
			top_down = false,
		},

		-- picker for pop ups
		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					hidden = true,
					git_untracked = true,
					include = {
						"**/.*env",
					},
					layout = {
						preview = true,
						layout = {
							box = "horizontal",
							width = 0.8,
							height = 0.8,
							{
								box = "vertical",
								border = "rounded",
								title = "{source} {live} {flags}",
								title_pos = "center",
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
							},
							{ win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
						},
					},
				},
				files = {
					hidden = true,
				},
				git_files = {
					untracked = true,
				},
				git_grep = {
					untracked = true,
				},
				grep = {
					hidden = true,
				},
			},
		},

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
	keys = {
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"go",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto Type Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gai",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "Calls Incoming",
		},
		{
			"gao",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "Calls Outgoing",
		},
	},
}

return M
