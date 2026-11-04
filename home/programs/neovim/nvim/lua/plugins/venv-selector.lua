-- venv
local M = {
	"linux-cultist/venv-selector.nvim",
	lazy = false,
	branch = "main",
}

M.config = function()
	local ok, venv = pcall(require, "venv-selector")
	if not ok then
		return
	end

	venv.setup({
		name = ".venv",
		parents = 1,
		stay_on_this_version = true,
	})
end

return M
