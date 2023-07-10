local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

M.config = function()
  local ok, tree = pcall(require, "nvim-tree")
  if not ok then
    return
  end

  tree.setup({
    log = {
      enable = true,
      truncate = true,
      types = {
        diagnostics = true,
        git = true,
        profile = true,
        watcher = true,
      },
    },
    -- sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      -- update_root = true
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
        ".ruff_cache",
        ".ropeproject"
      }
    },
    git = {
      ignore = false,
    }
  })
end

return M
