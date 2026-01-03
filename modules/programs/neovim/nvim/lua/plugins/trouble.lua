-- diagnostics, references in quickfix lists
local M = {
  "folke/trouble.nvim",
  cmd = "Trouble",
}

M.config = function()
  local ok, trouble = pcall(require, "trouble")
  if not ok then
    return
  end

  trouble.setup()
end

return M
