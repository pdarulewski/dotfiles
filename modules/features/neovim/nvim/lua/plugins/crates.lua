-- managing crates dependencies in rust

local M = {
  "saecki/crates.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, crates = pcall(require, "crates")
  if not ok then
    return
  end
end

return M
