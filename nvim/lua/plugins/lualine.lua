local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  lualine.setup({
    options = {
      globalstatus = true,
      theme = 'tokyonight'
    },
    sections = {
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1
        },
      },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
      }
    }
  })
end

return M
