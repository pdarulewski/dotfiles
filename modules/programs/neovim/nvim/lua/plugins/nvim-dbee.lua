local M = {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install()
	end,
}

M.config = function()
	local ok, dbee = pcall(require, "dbee")
	if not ok then
		return
	end

	dbee.setup({
		sources = {
			require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
		},
	})
end

return M
