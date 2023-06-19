local M = {
  "ghillb/cybu.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, cybu = pcall(require, "cybu")
  if not ok then
    return
  end

  cybu.setup({
    position = {
      max_win_width = 0.8,
    },
    style = {
      path = "relative",
      border = "rounded",
    },
    behavior = {
      mode = {
        default = {
          switch = "immediate",
          view = "paging",
        },
        last_used = {
          switch = "immediate",
          view = "paging",
        }
      }
    },
    display_time = 750,
  })

  vim.keymap.set("n", "<S-h>", "<Plug>(CybuPrev)")
  vim.keymap.set("n", "<S-l>", "<Plug>(CybuNext)")
end

return M
