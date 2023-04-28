require("project_nvim").setup({})
require("telescope").load_extension("projects")

local project_nvim = require("telescope").extensions.projects
vim.keymap.set("n", "<leader>P", project_nvim.projects)
