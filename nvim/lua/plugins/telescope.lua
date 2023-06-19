local M = {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  tag = "0.1.1",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

M.config = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  telescope.setup {
    pickers = {
      live_grep = {
        additional_args = function(opts)
          return { "--hidden" }
        end
      },
    },
  }
end

return M
