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
      NOTE = { alt = { "SECTION", "REVIEW" } }
    }
  })
end

return M
