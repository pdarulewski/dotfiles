local neovim_group = vim.api.nvim_create_augroup("neovim", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	desc = "Check if we need to reload the file when it changed outside of neovim",
	command = "checktime",
	group = neovim_group,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at same text location where it was opened last time",
	callback = function()
		vim.cmd([[silent! normal! g`"]])
	end,
	group = neovim_group,
})

vim.api.nvim_create_autocmd({ "User" }, {
	desc = "Remove statusline and tabline when in alpha-nvim welcome screen",
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[ set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3 ]])
	end,
	group = neovim_group,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "Highlight on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 100 })
	end,
	group = neovim_group,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Close some filetypes with <q>",
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"TelescopePrompt",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close!<cr>", { buffer = event.buf, silent = true })
	end,
	group = neovim_group,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Resize splits if window got resized",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
	group = neovim_group,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end,
})

-- SECTION: filetypes

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Disable linting for certain filetypes",
	pattern = {
		".env",
		"*/helm/*/templates/*.yaml",
		".air.toml",
	},
	callback = function(event)
		vim.diagnostic.enable(false, { buffer = event.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "dotenv",
	pattern = { ".env" },
	callback = function(event)
		vim.bo[event.buf].filetype = "dotenv"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
	desc = "gotmpl",
	pattern = {
		"*/helm/*/templates/*.yaml",
		"tmpl",
	},
	callback = function(event)
		vim.bo[event.buf].filetype = "gotmpl"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "ruby",
	pattern = { "*.brewfile" },
	callback = function(event)
		vim.bo[event.buf].filetype = "ruby"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "terraform",
	pattern = { "*.tf" },
	callback = function(event)
		vim.bo[event.buf].filetype = "terraform"
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Disable folding in Telescope results",
	pattern = "TelescopeResults",
	command = [[setlocal nofoldenable]],
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	desc = "Enable treesitter folding",
	callback = function(event)
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

_G.gh_open_in_browser = function()
	vim.cmd("GH")
end

_G.gh_copy_to_clipboard = function()
	local original = vim.g.gh_open_command
	vim.g.gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
	vim.cmd("GH")
	vim.g.gh_open_command = original -- Restore original
end
