return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	version = "1.*",
	opts = {
		keymap = {
			preset = "default",

			["<CR>"] = { "select_and_accept", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},

		cmdline = {
			completion = {
				ghost_text = {
					enabled = true,
				},
			},
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			documentation = {
				auto_show = true,
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
	},
	opts_extend = { "sources.default" },
}
