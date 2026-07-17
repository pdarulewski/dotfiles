local M = {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
}

M.config = function()
	local ok, treesitter = pcall(require, "nvim-treesitter")
	if not ok then
		return
	end

	local ensureInstalled = {
		"awk",
		"bash",
		"comment",
		"css",
		"csv",
		"diff",
		"diff",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"gowork",
		"graphql",
		"hcl",
		"helm",
		"html",
		"http",
		"java",
		"javascript",
		"jq",
		"json",
		"json5",
		"just",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"mermaid",
		"nix",
		"promql",
		"proto",
		"python",
		"regex",
		"rust",
		"sh",
		"sql",
		"ssh_config",
		"starlark",
		"templ",
		"terraform",
		"tmux",
		"toml",
		"tsv",
		"typescript",
		"vim",
		"yaml",
		"zig",
		"zsh",
	}

	local alreadyInstalled = require("nvim-treesitter.config").get_installed()

	local parsersToInstall = vim.iter(ensureInstalled)
		:filter(function(parser)
			return not vim.tbl_contains(alreadyInstalled, parser)
		end)
		:totable()

	treesitter.install(parsersToInstall)
end

return M
