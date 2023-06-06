local ok, todo = pcall(require, "todo-comments")
if not ok then
  return
end

todo.setup({
  keywords = {
    NOTE = { alt = { "SECTION", "REVIEW" } }
  }
})
