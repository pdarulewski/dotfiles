local M = {
  "phaazon/hop.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, hop = pcall(require, "hop")
  if not ok then
    return
  end

  hop.setup()
end

return M
