-- postman-like rest

local M = {
	"rest-nvim/rest.nvim",
}

M.config = function()
	local ok, rest = pcall(require, "rest-nvim")
	if not ok then
		return
	end
end

return M
