local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

project.setup({
  detection_methods = {},
  patterns = { ".git", },
})
require("telescope").load_extension("projects")
