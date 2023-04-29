require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"yaml",
		"json",

		"vim",
		"vimdoc",

		"query",

		"bash",
		"c",
		"latex",
		"lua",
		"go",
		"python",
		"rust",

		"markdown",
		"make",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
