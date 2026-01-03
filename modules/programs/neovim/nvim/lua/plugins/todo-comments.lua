-- highlight todo, fixme comments
-- FIX:
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:

-- custom
-- SECTION:
-- REVIEW:
-- INFO:
-- FLAG:

local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
}

M.config = function()
  local ok, todo = pcall(require, "todo-comments")
  if not ok then
    return
  end

  todo.setup({
    keywords = {
      NOTE = { alt = { "SECTION", "REVIEW", "INFO" }, color = "#8087a2" },
      FLAG = { alt = { "WARNING", "IMPORTANT" }, color = "#FFA500" },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
    },
  })
end

return M
