-- hex colorizer

local M = {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
}

M.config = function()
	local ok, colorizer = pcall(require, "colorizer")
	if not ok then
		return
	end

	colorizer.setup({
		"*",
		css = { names = true },
	}, {
		names = false,
		rgb_fn = true,
		hsl_fn = true,
	})
end

return M
