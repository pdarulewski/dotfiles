require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = {
      "venv",
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
