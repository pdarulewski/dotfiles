local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  direction = "float",
  insert_mappings = true,
  float_opts = {
    border = "curved",
  },
})
