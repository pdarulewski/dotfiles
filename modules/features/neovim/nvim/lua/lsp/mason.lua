local M = {
	"mason-org/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
}

M.config = function()
	local ok, mason = pcall(require, "mason")
	if not ok then
		return
	end

	mason.setup()

	local registry = require("mason-registry")
	local packages = {
		"alejandra",
		"codespell",
		"html-lsp",
		"jsonlint",
		"mdformat",
		"prettier",
		"shellcheck",
		"shfmt",
		"yamllint",
	}

	registry.refresh()

	local uname = io.popen("uname -s -m"):read("*l")
	local is_darwin_x86_64 = uname == "Darwin x86_64"

	for _, pkg_name in ipairs(packages) do
		if not registry.is_installed(pkg_name) then
			print(string.format("Installing %s", pkg_name))

			local pkg = registry.get_package(pkg_name)

			if is_darwin_x86_64 then
				pkg:install({ version = "v1.11.1" })
			else
				pkg:install()
			end
		end
	end
end

return M
