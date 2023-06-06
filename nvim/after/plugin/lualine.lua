local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

lualine.setup({
  options = {
    globalstatus = true
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
