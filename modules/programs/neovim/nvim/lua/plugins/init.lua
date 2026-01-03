-- plugins that don't need any setup

return {
	-- lazygit in nvim terminal
	{ "kdheepak/lazygit.nvim" },

	-- go back to any previous change
	{ "mbbill/undotree" },

	-- highlight all words under cursor
	{ "RRethy/vim-illuminate" },

	-- comment lines
	{ "numToStr/Comment.nvim" },

	-- lua plugin support
	{ "folke/neodev.nvim", opts = {} },

	-- set transparent background
	{ "xiyaowong/transparent.nvim" },

	-- vim tmux navigation
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			-- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
