local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 10,
  }
})
