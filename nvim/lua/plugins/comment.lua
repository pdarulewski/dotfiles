local M = {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, comment = pcall(require, "Comment")
  if not ok then
    return
  end

  comment.setup()
end

return M
