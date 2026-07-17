vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "dotenv",
	pattern = { ".env", ".env.*" },
	callback = function(event)
		vim.bo[event.buf].filetype = "sh"
	end,
})

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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
	desc = "gotmpl",
	pattern = {
		"*/templates/*.yaml",
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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "tiltfile",
	pattern = { "Tiltfile" },
	callback = function(event)
		vim.bo[event.buf].filetype = "starlark"
	end,
})
