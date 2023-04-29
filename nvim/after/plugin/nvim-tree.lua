require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = {
      "__pycache__",
      ".DS_Store",
      ".mypy_cache",
      ".pytest_cache",
      ".git$",
    }
  },
  git = {
    ignore = false,
  }
})
