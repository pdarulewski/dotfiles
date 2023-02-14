-- -- set additional linters
local M = {}

M.config = function()

  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { command = "pylint", filetypes = { "python" } },
  }

end

return M
