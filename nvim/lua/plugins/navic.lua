local M = {
  "SmiteshP/nvim-navic",
  event = "VeryLazy",
}

M.config = function()
  local ok, navic = pcall(require, "nvim-navic")
  if not ok then
    return
  end

  navic.setup({
    lsp = {
      auto_attach = true
    }
  })
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

return M
