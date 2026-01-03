-- formatters

local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	local ok, conform = pcall(require, "conform")
	if not ok then
		return
	end

	conform.setup({
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "gofumpt", "goimports-reviser" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "mdoformat" },
			nix = { "alejandra" },
			python = { "ruff_fix", "ruff_format" },
			rust = { "rustfmt" },
			sh = { "shfmt", "shellcheck" },
			sql = { "sqlfuff" },
			swift = { "swiftformat" },
			terraform = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
			toml = { "taplo" },
			typescript = { "prettier" },
			yaml = { "yamlfmt" },
			zsh = { "shfmt", "shellcheck" },
			["*"] = { "trim_newlines", "trim_whitespace", "codespell" },
		},
		notify_on_error = true,
	})

	conform.formatters.codespell = {
		prepend_args = { "--config", "/Users/pd/.config/codespell/setup.cfg" },
	}

	conform.formatters["goimports-reviser"] = {
		prepend_args = {
			"-rm-unused",
			"-set-alias",
		},
	}

	conform.formatters.taplo = {
		inherit = false,
		command = "taplo",
		args = { "format", "--config", "/Users/pd/.config/taplo/taplo.toml", "-" },
	}

	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf })
			-- safe buffer after format
			vim.schedule(function()
				vim.cmd("silent! noautocmd w")
			end)
		end,
	})
end
return M
