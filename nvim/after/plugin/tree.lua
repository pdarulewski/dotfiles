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
  },
  git = {
    ignore = false,
  }
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
