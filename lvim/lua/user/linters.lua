-- -- set additional linters
local M = {}

M.config = function()

  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { command = "pylint", filetypes = { "python" } },
    { command = "shellcheck", extra_args = { "--severity", "warning" } },
  }

end

return M
