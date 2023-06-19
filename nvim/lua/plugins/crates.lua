local M = {
  "saecki/crates.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, crates = pcall(require, "crates")
  if not ok then
    return
  end

  crates.setup({
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
  })
end

return M
