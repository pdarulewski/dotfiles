-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local M = {}

M.config = function()

  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    { command = "gofumpt", filetypes = { "go" } }
  }

end

return M
