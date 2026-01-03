local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}

M.config = function()
	local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end

	mason_lspconfig.setup({
		ensure_installed = {
			"bashls",
			"buf_ls",
			"clangd",
			"docker_compose_language_service",
			"dockerls",
			"gopls",
			"lua_ls",
			"nil_ls",
			"pyright",
			"yamlls",
		},
	})

	local registry = require("mason-registry")
	local packages = {
		"alejandra",
		"codespell",
		"html-lsp",
		"jsonlint",
		"ltex-ls",
		"luacheck",
		"mdformat",
		"prettier",
		"shellcheck",
		"shfmt",
		"sql-formatter",
		"stylua",
		"taplo",
		"yamllint",
	}

	registry.refresh()

	for _, pkg_name in ipairs(packages) do
		if not registry.is_installed(pkg_name) then
			print(string.format("Installing %s", pkg_name))

			local pkg = registry.get_package(pkg_name)
			pkg:install()
		end
	end
end

return M
