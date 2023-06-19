local M = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, lsp_signature = pcall(require, "lsp_signature")
  if not ok then
    return
  end

  lsp_signature.setup()
end

return M
